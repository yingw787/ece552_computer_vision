ECE 552 Final Project Report
===================

Introduction
-------------

Today, people increasingly rely on image processing algorithms. Given the increasing usage of image processing as well as demand for at least maintaining the same performance for image processing applications, demand for faster and higher performing algorithms will surely rise. Having a means in order to track performance of image processing algorithms will not only ensure that the optimizations promised by image processing are fulfilled by the hardware, but that slimmer programs will function on older-generation hardware helping to ensure backwards compatibility, among other benefits.  

This paper describes the effort to benchmark image processing algorithms with PAPI, an open-source performance counter API, and infer the performance behind each of 

Overview 
-------------

### Algorithms

This section will explain the different computer vision algorithms considered in benchmarking, as well as a discussion about how each is expected to perform relative to each other.  

Code for the all functions in all three languages are listed in [Appendix A](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_A.md). Programs are ideally as similar to each other as possible in order to minimize the number of high-level differences between them as possible. 

####Circular Hough Transforms 

The circular Hough transform is analogous to the Hough transform for line detection, and OpenCV uses the Hough gradient method in order to detect circles. In general, the Hough transform uses an accumulator array to represent each combination of parameters, and based on some given threshold, adds the value computed from the image to the accumulator array. Three variables must be known in order to detect a circle; the x coordinate of the circle's center, the corresponding y coordinate, and the radius of the circle. The accumulator traverses the gradient space of the image to search for a (x, y, r) combination; if it surpasses a user-specified threshold, it is considered to be a legitimate circle and will be returned from the function.  

Circular Hough Transforms involve trigonometric calculations and thus may involve floating point calculations for accuracy at the hardware level. Performance counters for floating point computations may be interesting. 

An example of the Circular Hough Transform is given below: 

<p align = "center">
	<img src = "https://github.com/yingw787/ece552_computer_vision/blob/master/algorithm_benchmarks/python/houghcircles_result.png" />
</p>

####Sobel Edge Detection  

The Sobel operator is a discrete differentiation operator. It produces a gradient of the original image by convolving two Sobel kernels with the original image, for the x-gradient as well as the y-gradient. Calculating the gradient means changes in the pixel intensity in the image across the kernel are displayed more prominently, and edges will show up more. One can then bitwise or the returned results to create an overall gradient representation of the image. 

This image processing algorithm can serve as a worthy benchmark since convolution involves multiplication and integration over every kernel in the image; examining performance counters may indicate whether Sobel is a performance-intensive task and act as a bottleneck in speedups. In addition, to what degree the algorithm can be parallelized remains an interesting question.

An example of the Sobel Edge Detection is given below:  

<p align = "center">
	<img src = "https://github.com/yingw787/ece552_computer_vision/blob/master/algorithm_benchmarks/python/sobel_result.png" />
</p>

### PAPI 

PAPI (Performance Analysis Programming Interface) is a set of APIs that allow an application access to the underlying hardware. Two APIs are given: one a high-level API that allows general access to commonly available performance counters, and a low-level API that allows access to more hardware-specific performance counters. 

PAPI high level API access on specified hardware is found in [Appendix D](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_D.md) and low-level API access is found in [Appendix E](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_E.md). As can be seen, there are a multitude of events that can be examined, a point that eventually resulted in difficulty and mentioned in the results below. 

### Planned Simulation Steps 

- Determine the types of image processing algorithms to test 
- Implement the computer vision algorithms in python and c++ 
- Implement the computer vision algorithms in openCL 
- Install and run/verify PAPI 
- Run computer vision algorithms with PAPI 

### System description 

The computer used to run the performance is a Lenovo Thinkpad Edge E545; it contains an AMD A6-5350M APU, that contains 2 cores, each with 2 threads. The APU contains a 16KB level 1 data cache, a 64KB level 1 instruction cache, and a 1MB unified Level 2 cache. The computer runs Ubuntu 14.04. The specifics of the hardware can be determined from looking at /proc/cpuinfo flags and comparing it to those in the IA-64 Linux kernel. 

The full description of the hardware, including off-chip components, is available in full in [Appendix C](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_C.md). 

Process and Discussion
-------------

Running and deciding on image processing algorithm material was relatively trivial; commits to describe process are listed [here](https://bitbucket.org/yingw787/ece552_computer_vision/commits/branch/master ). This process involved learning the OpenCV API. The Python version of the image processing languages took place first. 

After the Python programs were tested, they were profiled with [line_profiler](https://github.com/rkern/line_profiler) and [memory_profiler](https://github.com/fabianp/memory_profiler). This provides a line-by-line detailing of how many times a function is called, and how much memory each function call takes up. The results of this testing for the Python benchmark can be seen in [Appendix B](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_B.md). 

From the results in Appendix B, 

One unanticipated issue resulted from the fact that IA64-Linux only specifies 4 48-bit performance counters; any more specified within a given process and executed would produce garbage output. As from Appendix D, there are 40 preset events that are available from PAPI on the specified hardware. 

Ultimately, the primary difficulty resulted in the limited amount of time available in order to conduct the experiment, as well as shifting priorities due to unprocessed difficulties. Given a possible redo, the author would limit himself to 

Additional Exploration
-------------

### Architectural Simulators for GPGPUs
#### gem5 
#### gem5-gpu 



Bibliography
-------------

Mucci, Phillip. "Performance Monitoring with PAPI." Dr. Dobb's World of Software Development. N/A, 01 June 2005. Web. 04 Dec. 2015.

"OpenCV 2.4.11 Documentation." OpenCV. OpenCV, 25 Feb. 2015. Web. 04 Dec. 2015.




