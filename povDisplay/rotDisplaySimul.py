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

window = pyglet.window.Window(width=900, height=900, vsync=False)
#window = pyglet.window.Window(width=900, height=900, vsync=True)

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

midWindowX = window.width / 2
midWindowY = window.height / 2

#imageMode = 'L'
imageMode = 'RGB'
ledRadius = 5 #2 #5
ledDetails = 10 #20
ledCount = 32 #100 #32
offset = 8
angularPositionCount = 300 
ledCenterX = midWindowX
ledCenterY = midWindowY

# Process supplied image
imagePath = sys.argv[1]
img = PIL.Image.open(imagePath)
imageSize = 2 * (ledCount + offset)
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

pixelCount = 0
pixelSum = 0
pixelMean = 128
@window.event
def on_draw():
    global animPosition, ledRadius, ledDetails, ledCount, offset, pixelCount, pixelSum, pixelMean
    #pyglet.gl.glClearColor(0,0,0,0)
    #window.clear()
    if animPosition == 0 and pixelCount > 0:
        #glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)
        newPixelMean = pixelSum / pixelCount
        if newPixelMean >= pixelMean:
            pixelMean = newPixelMean * 1.1
        else:
            pixelMean = newPixelMean * 0.9

        #sys.stdout.write("pixel mean value: %d\n" % pixelMean)
        sys.stdout.flush()
        pixelCount = 0
        pixelSum = 0

    for k in range(ledCount + 1):
        animAngle = pi * 2 / angularPositionCount * animPosition
        radius = (offset + 2 * k) * ledRadius
        coords = get_circle_cartesian_coordinates(animAngle, radius)
        circle = makeCircle(ledDetails, coords[0], coords[1], ledRadius)
        
        #sys.stdout.write("display coords: (%d ; %d)\n" % (coords[0], coords[1]))

        if k < (ledCount):
            imageX = round((offset + k) / (offset + ledCount) * (imageSize/2) * cos(animAngle) + imageSize/2)
            imageY = round((offset + k) / (offset + ledCount) * (imageSize/2) * sin(animAngle + pi) + imageSize/2)
            #sys.stdout.write("img coords: (%d ; %d)\n" % (imageX, imageY))

            pixel = img.getpixel((imageX, imageY))
            #sys.stdout.write(str(pixel))
                
            if imageMode == 'L':
                pixelSum += pixel
                pixelCount += 1

                if (pixel < pixelMean):
                    glColor3f(255,0,0)
                else:
                    glColor3f(0,0,0)
            else:
                glColor3f(pixel[0], pixel[1], pixel[2])

        #sys.stdout.write("animPosition: %d" % animPosition)
        else:
            glColor3f(255,255,255)
            
        circle.draw(GL_LINE_LOOP)


glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)
pyglet.clock.set_fps_limit(None)
pyglet.clock.schedule_interval(update_frames,1/10000.0)

pyglet.app.run()

