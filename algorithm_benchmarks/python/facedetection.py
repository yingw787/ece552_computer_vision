import numpy as np 
import argparse
import cv2 

# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())
# load the image, clone it for output, and then convert it to grayscale
image = cv2.imread(args["image"])



@profile 
def facedetection(): 
	face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

	faces = face_cascade.detectMultiScale(
	    gray,
	    scaleFactor=1.1,
	    minNeighbors=1,
	    minSize=(10, 10),
	    flags = cv2.cv.CV_HAAR_SCALE_IMAGE
	)
	for (x, y, w, h) in faces:
	    cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)

facedetection() 

cv2.imshow('output', image)
cv2.waitKey(0)