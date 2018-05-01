#! /usr/bin/python3

# Need pyglet: sudo pip3 install pyglet

import pyglet
from math import *
from pyglet.gl import *
import sys
import PIL.Image
import random
import getopt

if (len(sys.argv) < 2):
    sys.stderr.write("usage: " + sys.argv[0] + " imagePath\n")
    sys.exit(1)

def usage():
    print(sys.argv[0] + " [-t threshold] [-r ratio] [-d] <pictureInputFile>")
    sys.exit(3)

# Options management
threshold = 228
ratio = 1
dataOutput = False

try:
    opts, args = getopt.getopt(sys.argv[1:], "ht:r:d", ["threshold=", "ratio=", "data-output="])
except getopt.GetoptError:
    usage()

for opt, arg in opts:
    if opt == '-h':
        usage()
    elif opt in ("-t", "--threshold"):
        threshold = int(arg)
    elif opt in ("-r", "--ratio"):
        ratio = int(arg)
    elif opt in ("-d", "--data-output"):
        dataOutput = True

#if not dataOutput:
if True:
    window = pyglet.window.Window(width=1000, height=1000, vsync=False)
    #window = pyglet.window.Window(width=900, height=900, vsync=True)

    midWindowX = window.width / 2
    midWindowY = window.height / 2

    ledCenterX = midWindowX
    ledCenterY = midWindowY

def makeCircle(numPoints, centerX, centerY, radius):
    verts = [centerX, centerY]
    for i in range(numPoints):
        angle = radians(float(i)/numPoints * 360.0)
        for r in range(radius):
            x = (r + 1)*cos(angle) + centerX
            y = (r + 1)*sin(angle) + centerY
            verts += [x,y]
    #global circle
    circle = pyglet.graphics.vertex_list(numPoints * radius + 1, ('v2f', verts))
    return circle


random = False
imageMode = 'L'
#imageMode = 'RGB'
#ledScheme = [0 for i in range(10)] + [1 for i in range(16)] + [0] + [1 for i in range(16)]
ledScheme = [0 for i in range(3)] + [1 for i in range(40)]
ledDetails = 20 #20
ledRadius = 5 #2 #5
angularPositionCount = 256

# Process supplied image
imagePath = sys.argv[len(sys.argv) - 1]
img = PIL.Image.open(imagePath)
imageSize = int(2 * len(ledScheme))
img = img.resize((imageSize, imageSize))
img = img.convert(imageMode)
#(imgWidth, imgHeight) = img.size
#ratio = imgWidth / imgHeight
#if imgWidth > imgHeight:
#    img = img.resize((imageSize, round(imageSize * ratio)))
#else:
#    img = img.resize((round(imageSize * ratio), imageSize))


animPosition = 0
def update_frames(dt):
    global animPosition
    animPosition = (animPosition + 1) % angularPositionCount

update_frames(0)

def get_circle_cartesian_coordinates(angle, radius):
    global ledCenterX, ledCenterY
    return (radius * cos(angle) + ledCenterX, radius * sin(angle) + ledCenterY)

# Build all circles and sample image
circlesMatrix=[[None for ledIndex in range(len(ledScheme) + 1)] for position in range(angularPositionCount)]
imageSampleColor=[[None for ledIndex in range(len(ledScheme))] for position in range(angularPositionCount)]
pixelCount = 0
pixelSum = 0
pixelMean = 128
extremumColors = (255, 0)
for position in range(len(circlesMatrix)):
    for k, enable in enumerate(range(len(circlesMatrix[0]))):
        angle = pi * 2 / angularPositionCount * position
        radius = 2 * k * ledRadius

        if not dataOutput:
            coords = get_circle_cartesian_coordinates(angle, radius)

            circle = makeCircle(ledDetails, coords[0], coords[1], ledRadius)
            circlesMatrix[position][k] = circle
        
        if k >= len(ledScheme):
            continue

        imageX = round(k / len(ledScheme) * (imageSize/2) * cos(angle) + imageSize/2)
        imageY = round(k / len(ledScheme) * (imageSize/2) * sin(angle + pi) + imageSize/2)
        pixel = img.getpixel((imageX, imageY))

        if imageMode == 'L':
            pixelSum += pixel
            pixelCount += 1
            pixelMean = pixelSum / pixelCount
            sampleColor = pixel
            extremumColors = (min(pixel, extremumColors[0]), max(pixel, extremumColors[1]))
        else:
            sampleColor = pixel #(pixel[0], pixel[1], pixel[2])

        imageSampleColor[position][k] = sampleColor


if dataOutput:
    # Build a led data matrix : a 3 dimensional array position/byteIndex/8_bit leds (true if LED on)
    ledDataMatrix = [[[False for x in range(8)] for y in range(5)] for z in range(len(imageSampleColor))]
    for position in range(len(imageSampleColor)):
        byteIndex = 0
        bitCount = 0
        ledIndex = 0
        for k in range(len(circlesMatrix[0]) - 1):
            enable = ledScheme[k]
            if imageMode == 'L' and enable:
                #print("pos: %d ; k: %d ; ledIndex: %d" % (position, k, ledIndex))
                ledDataMatrix[position][byteIndex][bitCount] = imageSampleColor[position][ledIndex] < threshold
                bitCount += 1
                ledIndex += 1
                if bitCount == 8:
                    bitCount = 0
                    byteIndex += 1

    #print(ledDataMatrix)

    # Transpose data into a byte array
    sys.stdout.write("const byte PICTURE[%d] PROGMEM = {" % (angularPositionCount * 8))

    byteArrayOutput = [0 for x in range(angularPositionCount * 8)]
    byteIndex = 0
    for position in range(angularPositionCount):
        for i in range(8):     
            for j in range(len(ledDataMatrix[position])):
                if not ledDataMatrix[position][j][i]:
                    byteArrayOutput[byteIndex + i] = byteArrayOutput[byteIndex + i] + pow(2, j)

        for i in range(8):     
            sys.stdout.write("%d, " % byteArrayOutput[byteIndex + i])

        byteIndex += 8        

        #sys.stdout.write("\n")
        
    sys.stdout.write("};\n")

@window.event
def on_draw():
    global animPosition, ledRadius, ledDetails, ledCount, offset, pixelCount, pixelSum, pixelMean

    #if animPosition == 0:
    #    glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)

    if random and imageMode == 'L':
        rand = random.randint(ceil((extremumColors[0] + pixelMean)/2), floor((extremumColors[1] + pixelMean)/2)) 

    for k, enable in enumerate(ledScheme):
        circle = circlesMatrix[animPosition][k]
        sampleColor = imageSampleColor[animPosition][k]
        
        if not sampleColor or not enable:
            glColor3f(0, 0, 0)

        elif imageMode == 'L':
            #if (sampleColor * (100 + rand) / 100) < pixelMean:
            if random and sampleColor < rand or sampleColor < threshold:
                glColor3f(255, 0, 0)
            else:
                glColor3f(0, 0, 0)
        else:
            glColor3f(sampleColor[0]/256, sampleColor[1]/256, sampleColor[2]/256)

        circle.draw(GL_LINE_LOOP)

    # Add white disks
    circle = circlesMatrix[animPosition][k + 1]
    glColor3f(255, 255, 255)
    circle.draw(GL_LINE_LOOP)

if not dataOutput:
    glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)
    pyglet.clock.set_fps_limit(None)
    pyglet.clock.schedule_interval(update_frames,1/10000.0)
    
    pyglet.app.run()
    
