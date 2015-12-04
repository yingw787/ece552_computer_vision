ECE 552 Final Project Report
===================

Introduction
-------------

Today, people increasingly rely on image processing algorithms. Given the increasing usage of image processing as well as demand for at least maintaining the same performance for image processing applications, demand for faster and higher performing algorithms will surely rise. Having a means in order to track performance of image processing algorithms will not only ensure that the optimizations promised by image processing are fulfilled by the hardware, but that slimmer programs will function on older-generation hardware helping to ensure backwards compatibility, among other benefits.  

Overview 
-------------

### Algorithms

This section will explain the different computer vision algorithms considered in benchmarking, as well as a discussion about how each is expected to perform relative to each other.  

Code for the all functions in all three languages are listed in Appendix A. Programs are ideally as similar to each other as possible in order to minimize the number of high-level differences between them as possible. 

####Circular Hough Transforms 

The circular Hough transform is analogous to the Hough transform for line detection, and OpenCV uses the Hough gradient method in order to detect circles. In general, the Hough transform uses an accumulator array to represent each combination of parameters, and based on some given threshold, adds the value computed from the image to the accumulator array. Three variables must be known in order to detect a circle; the x coordinate of the circle's center, the corresponding y coordinate, and the radius of the circle. The accumulator traverses the gradient space of the image to search for a (x, y, r) combination; if it surpasses a user-specified threshold, it is considered to be a legitimate circle and will be returned from the function.  

Circular Hough Transforms involve trigonometric calculations and thus may involve floating point calculations for accuracy at the hardware level. Performance counters for floating point computations may be interesting. 

An example of the Circular Hough Transform is given below: 

<p align = "center">
	<img src = "https://github.com/yingw787/ece552_computer_vision/blob/master/algorithm_benchmarks/python/houghcircles_result.jpg" />
</p>

####Sobel Edge Detection  

The Sobel operator is a discrete differentiation operator. It produces a gradient of the original image by convolving two Sobel kernels with the original image, for the x-gradient as well as the y-gradient. Calculating the gradient means changes in the pixel intensity in the image across the kernel are displayed more prominently, and edges will show up more. One can then bitwise or the returned results to create an overall gradient representation of the image. 

This image processing algorithm can serve as a worthy benchmark since convolution involves multiplication and integration over every kernel in the image; examining performance counters may indicate whether Sobel is a performance-intensive task and act as a bottleneck in speedups. In addition, to what degree the algorithm can be parallelized remains an interesting question.

An example of the Sobel Edge Detection is given below:  

### Planned Simulation Steps 

- Determine the types of image processing algorithms to test 
- Implement the computer vision algorithms in python and c++ 
- Implement the computer vision algorithms in openCL 
- Install and run/verify PAPI 
- Run computer vision algorithms with PAPI 

### Hardware description 

The computer used to run the performance is a Lenovo Thinkpad Edge E545; it contains 

The full description of the hardware, including off-chip components, is available in full in Appendix C. 

Results and Discussion
-------------



Additional Exploration
-------------

### Architectural Simulators for GPGPUs
#### gem5 
#### gem5-gpu 

### OpenCL 



Bibliography
-------------

https://bitbucket.org/yingw787/ece552_computer_vision/commits/branch/master 

