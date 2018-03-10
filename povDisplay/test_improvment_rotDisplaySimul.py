#! /usr/bin/python3

# Need pyglet: sudo pip3 install pyglet

import pyglet
from math import *
from pyglet.gl import *
import sys
import PIL.Image
import random

if (len(sys.argv) < 2):
    sys.stderr.write("usage: " + sys.argv[0] + " imagePath\n")
    sys.exit(1)

window = pyglet.window.Window(width=1000, height=1000, vsync=False)
#window = pyglet.window.Window(width=900, height=900, vsync=True)

def makeCircle(numPoints, centerX, centerY, radius):
    verts = [centerX, centerY]
    for i in range(numPoints):
        angle = radians(float(i)/numPoints * 360.0)
        for r in range(radius):
            x = (r + 1)*cos(angle) + centerX
            y = (r + 1)*sin(angle) + centerY
            verts += [int(round(x)),int(round(y))]
    #global circle
    #circle = pyglet.graphics.vertex_list(numPoints * radius + 1, ('v2f', verts))
    circle = pyglet.graphics.vertex_list(floor(len(verts)/2), ('v2f', verts))
    return circle

def makeCircle2(numPoints, centerX, centerY, radius):
    verts = []
    verts += [centerX, centerY]
    for i in range(numPoints):
        angle = radians(float(i)/numPoints * 360.0)
        for r in range(radius):
            x = (r + 1)*cos(angle) + centerX
            y = (r + 1)*sin(angle) + centerY
            verts += [int(round(x)),int(round(y))]
    #global circle
    return verts

midWindowX = window.width / 2
midWindowY = window.height / 2

imageMode = 'L'
#imageMode = 'RGB'
#ledScheme = [0 for i in range(10)] + [1 for i in range(16)] + [0] + [1 for i in range(16)]
#ledScheme = [0 for i in range(10)] + [1 for i in range(40)]
ledScheme = [1 for i in range(40)]
ledDetails = 20
ledRadius = 5 #2 #5
angularPositionCount = 64 
#angularPositionCount = 300 
#angularPositionCount = 600 
ledCenterX = midWindowX
ledCenterY = midWindowY

# Process supplied image
imagePath = sys.argv[1]
img = PIL.Image.open(imagePath)
imageSize = 2 * len(ledScheme)
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
circlesMatrix = [[None for ledIndex in range(len(ledScheme) + 1)] for position in range(angularPositionCount)]
imageSampleColor = [[None for ledIndex in range(len(ledScheme))] for position in range(angularPositionCount)]
pixelCount = 0
pixelSum = 0
pixelMean = 128
extremumColors = (255, 0)
for position in range(len(circlesMatrix)):
    barAllPixels = []
    for k, enable in enumerate(range(len(circlesMatrix[0]))):
        angle = pi * 2 / angularPositionCount * position
        radius = 2 * k * ledRadius
        coords = get_circle_cartesian_coordinates(angle, radius)

        circle = makeCircle(ledDetails, coords[0], coords[1], ledRadius)
        circlesMatrix[position][k] = circle
        
        if k >= len(ledScheme) or not enable:
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


# Build led bars ready to display
barsMap = {}
for position in range(len(circlesMatrix)):
    barAllPixels = []
    for k, enable in enumerate(range(len(circlesMatrix[0]) - 1)):
        if enable:
            sampleColor = imageSampleColor[position][k]
            if k <= pixelMean:
                circle2 = makeCircle2(ledDetails, coords[0], coords[1], ledRadius)
                barAllPixels += circle2

    barsMap[position] = pyglet.graphics.vertex_list(floor(len(barAllPixels)/2), ('v2f', barAllPixels))


@window.event
def on_draw():
    global animPosition, ledRadius, ledDetails, ledCount, offset, pixelCount, pixelSum, pixelMean

    #if animPosition == 0:
    #    glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)
    #glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)

    if imageMode == 'L':
        rand = random.randint(ceil((extremumColors[0] + 4*pixelMean)/5), floor((extremumColors[1] + 4*pixelMean)/5)) 

    #previousAnimPosition = (animPosition - 1) % angularPositionCount
    #ledBar = barsMap[previousAnimPosition]
    ledBar = barsMap[animPosition]
    glColor3f(255, 0, 0)
    ledBar.draw(GL_LINE_LOOP)

    #for k, enable in enumerate(ledScheme + [0]):
    #    circle = circlesMatrix[previousAnimPosition][k]
    #    glColor3f(0, 0, 0)
    #    circle.draw(GL_LINE_LOOP)

    #for k, enable in enumerate(ledScheme):
    #    circle = circlesMatrix[animPosition][k]
    #    sampleColor = imageSampleColor[animPosition][k]
    #    
    #    if not sampleColor or not enable:
    #        glColor3f(0, 0, 0)

    #    elif imageMode == 'L':
    #        #if (sampleColor * (100 + rand) / 100) < pixelMean:
    #        if sampleColor < rand:
    #            glColor3f(255, 0, 0)
    #        else:
    #            glColor3f(0, 0, 0)
    #    else:
    #        glColor3f(sampleColor[0]/256, sampleColor[1]/256, sampleColor[2]/256)

    #    circle.draw(GL_LINE_LOOP)

    # Add white disks
    #circle = circlesMatrix[animPosition][k + 1]
    circle = circlesMatrix[animPosition][len(ledScheme)]
    glColor3f(255, 255, 255)
    circle.draw(GL_LINE_LOOP)

glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)
pyglet.clock.set_fps_limit(None)
pyglet.clock.schedule_interval(update_frames,1/100.0)

pyglet.app.run()

