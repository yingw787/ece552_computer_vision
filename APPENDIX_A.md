Appendix A: Source Code for Sobel Edge Detection in Python & C++  
-------------

sobel.py 
```
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

@profile 
def sobel(): 
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
	sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)
	sobelCombined = cv2.bitwise_or(sobelX, sobelY)
	cv2.imshow("image", image)
	cv2.imshow("output", sobelCombined)
	cv2.waitKey(0)

sobel() 
```


sobel.cpp 
```
#include "/usr/local/Cellar/opencv/2.4.12/include/opencv2/imgproc/imgproc.hpp"
#include "/usr/local/Cellar/opencv/2.4.12/include/opencv2/highgui/highgui.hpp"
#include <stdlib.h>
#include <stdio.h>

using namespace cv;

/** @function main */
int main( int argc, char** argv )
{

  Mat src, src_gray;
  Mat grad;
  // char* window_name = "Sobel Demo - Simple Edge Detector";
  int scale = 1;
  int delta = 0;
  int ddepth = CV_16S;

  int c;

  /// Load an image
  src = imread( argv[1] );

  if( !src.data )
  { return -1; }

  GaussianBlur( src, src, Size(3,3), 0, 0, BORDER_DEFAULT );

  /// Convert it to gray
  cvtColor( src, src_gray, CV_BGR2GRAY );

  /// Create window
  namedWindow( "window_name", CV_WINDOW_AUTOSIZE );

  /// Generate grad_x and grad_y
  Mat grad_x, grad_y;
  Mat abs_grad_x, abs_grad_y;

  /// Gradient X
  //Scharr( src_gray, grad_x, ddepth, 1, 0, scale, delta, BORDER_DEFAULT );
  Sobel( src_gray, grad_x, ddepth, 1, 0, 3, scale, delta, BORDER_DEFAULT );
  convertScaleAbs( grad_x, abs_grad_x );

  /// Gradient Y
  //Scharr( src_gray, grad_y, ddepth, 0, 1, scale, delta, BORDER_DEFAULT );
  Sobel( src_gray, grad_y, ddepth, 0, 1, 3, scale, delta, BORDER_DEFAULT );
  convertScaleAbs( grad_y, abs_grad_y );

  /// Total Gradient (approximate)
  addWeighted( abs_grad_x, 0.5, abs_grad_y, 0.5, 0, grad );

  imshow( "window_name", grad );

  waitKey(0);

  return 0;
  }
```
