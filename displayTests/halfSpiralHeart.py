#! /usr/bin/python3

# Need pyglet: sudo pip3 install pyglet

import pyglet
import math
from pyglet.gl import *
import sys
import PIL.Image
import random

window = pyglet.window.Window(width=1000, height=1000, vsync=False)

midWindowX = window.width / 2
midWindowY = window.height / 2

ledCenterX = midWindowX
ledCenterY = midWindowY

def makeCircle(numPoints, centerX, centerY, radius):
    verts = [centerX, centerY]
    for i in range(numPoints):
        angle = math.radians(float(i)/numPoints * 360.0)
        for r in range(radius):
            x = (r + 1)*math.cos(angle) + centerX
            y = (r + 1)*math.sin(angle) + centerY
            verts += [x,y]
    #global circle
    circle = pyglet.graphics.vertex_list(numPoints * radius + 1, ('v2f', verts))
    return circle


random = False
imageMode = 'L'
#imageMode = 'RGB'
ledDetails = 20 #20
ledRadius = 5

def get_circle_cartesian_coordinates(angle, radius):
    global ledCenterX, ledCenterY
    return (radius * cos(angle) + ledCenterX, radius * sin(angle) + ledCenterY)

# Build all circles and sample image
def buildCircles(coordinates):
    circles = []
    for (x, y) in coordinates:
        circle = makeCircle(ledDetails, x, y, ledRadius)
        circles.append(circle)

    return circles

@window.event
def on_draw():
    global FRAMES_MATRIX, CIRCLES_ARRAY, frameCounter

    frameId = frameCounter % len(FRAMES_MATRIX)
    frames = FRAMES_MATRIX[frameId]
    print('Frames: %s' % (frames))
    print('Drawing frame: %d ...' % (frameCounter))
    for k, enable in enumerate(frames):
        circle = CIRCLES_ARRAY[k]
        sampleColor = (255, 0, 0)
    
        if not enable:
            sampleColor = (0, 0, 0)

        print('f: %d, k: %d, enable: %s, color: %s' %(frameCounter, k, enable, sampleColor))

        glColor3f(sampleColor[0]/256, sampleColor[1]/256, sampleColor[2]/256)
        circle.draw(GL_LINE_LOOP)

def oneCircleByFrameMatrixGenerator(circlesCount):
    i = 0
    while i < circlesCount:
        frame = [False for n in range(circlesCount)]
        #frame = [True for n in range(circlesCount)]
        frame[i] = True
        yield frame
        i += 1

frameCounter = 0
def update_frames(dt):
    global frameCounter
    frameCounter += 1

coordinates = [(400,200),(200,300),(100,400),(100,500),(300,600),(400,500),(300,400),(200,500)]
#coordinates = [(100,100), (900,900)]
CIRCLES_ARRAY = buildCircles(coordinates)
FRAMES_MATRIX = list(oneCircleByFrameMatrixGenerator(len(coordinates)))

glClear(pyglet.gl.GL_COLOR_BUFFER_BIT)
#pyglet.clock.set_fps_limit(None)
pyglet.clock.schedule_interval(update_frames,1/10.0)
    
pyglet.app.run()
    
