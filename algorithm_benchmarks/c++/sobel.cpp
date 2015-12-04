#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <stdlib.h>
#include <stdio.h>



using namespace cv;

/** @function main */
int main( int argc, char** argv )
{

  Mat src; 
  src = imread( argv[1] );

  return 0;
  }
