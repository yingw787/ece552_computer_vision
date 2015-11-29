# creds: http://www.pyimagesearch.com/2014/07/21/detecting-circles-images-using-opencv-hough-circles/
# and: http://docs.opencv.org/2.4/doc/tutorials/imgproc/imgtrans/sobel_derivatives/sobel_derivatives.html  

# import the necessary packages
import numpy as np
import argparse
import cv2
 
# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())

# load the image, clone it for output, and then convert it to grayscale
image = cv2.imread(args["image"])
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)

sobelCombined = cv2.bitwise_or(sobelX, sobelY)

cv2.imshow("image", image)
cv2.imshow("output", sobelCombined)
cv2.waitKey(0)