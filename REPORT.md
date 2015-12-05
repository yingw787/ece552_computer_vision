ECE 552 Final Project Report
===================

Introduction
-------------

Today, people increasingly rely on image processing algorithms. Given the increasing usage of image processing as well as demand for at least maintaining the same performance for image processing applications, demand for faster and higher performing algorithms will surely rise. Having a means in order to track performance of image processing algorithms will not only ensure that the optimizations promised by image processing are fulfilled by the hardware, but that slimmer programs will function on older-generation hardware helping to ensure backwards compatibility, among other benefits.  

This paper describes the effort to benchmark image processing algorithms with PAPI, an open-source performance counter API, and link the time and memory performance behind the algorithms themselves to the underlying hardware. Is there an architectural justification behind the particular implementation given? How could hardware specific for image processing be designed in order to maximize performance?   

Overview 
-------------

### Algorithms

This section will explain the different computer vision algorithms considered in benchmarking, as well as a discussion about how each is expected to perform relative to each other.  

Code for Sobel edge detection in Python and C++ is listed in [Appendix A](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_A.md). Due to lack of understanding code for Sobel edge detection in OpenCL is not included. Programs are ideally as similar to each other as possible in order to minimize the number of high-level differences between them as possible. 

####Circular Hough Transforms 

The circular Hough transform is analogous to the Hough transform for line detection, and OpenCV uses the Hough gradient method in order to detect circles. In general, the Hough transform uses an accumulator array to represent each combination of parameters, and based on some given threshold, adds the value computed from the image to the accumulator array. Three variables must be known in order to detect a circle; the x coordinate of the circle's center, the corresponding y coordinate, and the radius of the circle. The accumulator traverses the gradient space of the image to search for a (x, y, r) combination; if it surpasses a user-specified threshold, it is considered to be a legitimate circle and will be returned from the function.  

Circular Hough Transforms involve trigonometric calculations and thus may involve floating point calculations for accuracy at the hardware level. Performance counters for floating point computations may be interesting. 

An example of the Circular Hough Transform is given below: 

<p align = "center">
	<img src = "https://github.com/yingw787/ece552_computer_vision/blob/master/algorithm_benchmarks/python/houghcircles_result.png" />
</p>

####Sobel Edge Detection  

The Sobel operator is a discrete differentiation operator. It produces a gradient of the original image by convolving two Sobel kernels with the original image, for the x-gradient as well as the y-gradient. Calculating the gradient means changes in the pixel intensity in the image across the kernel are displayed more prominently, and edges will show up more. One can then bitwise or the returned results to create an overall gradient representation of the image. 

This image processing algorithm can serve as a worthy benchmark since convolution involves multiplication and integration over every kernel in the image. In particular, finding out how integration is handled in machine code would prove interesting. Examining performance counters may indicate whether Sobel is a performance-intensive task and act as a bottleneck in speedups. In addition, to what degree the algorithm can be parallelized remains a worthy question.

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

From the results in Appendix B, one notes that the calls to cv2.Sobel took about 700 to 800 milliseconds, while memory-wise the calls took about 0.5 to 0.7 MiB. 

#### Difficulties in Implementation

Unfortunately, since Python is compiled down to bytecode and run on a virtual machine, Python applications cannot be translated directly into machine instructions accurately, since the virtual machine masks much of the direct translation. A language compilable into an executable provides more accurate and relevant performance testing. C++ provides that kind of functionality along with being able to interface nicely with both OpenCV and PAPI. The author focused too much on the Python implementation and understanding OpenCV, and did not focus enough on gaining an understanding of the C++ and OpenCL implementations of the OpenCV implementations.

C++ functions for PAPI were written, and they and the test output can be viewed [here](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_F.md) and [here](https://github.com/yingw787/ece552_computer_vision/blob/master/APPENDIX_F.md). The current problem experienced with PAPI is that without the particular Makefile associated with the example directory, it was difficult for the compiler to link the requisite C++ to PAPI. The difficulty in linking meant that OpenCV and PAPI could not run at the same time on the specified hardware in time. A greater understanding of C++ and Makefiles would have been extremely useful in this project. 

One unanticipated issue resulted from the fact that IA64-Linux only specifies 4 48-bit performance counters; any more specified within a given process and executed would produce garbage output. As from Appendix D, there are 40 preset events that are available from PAPI on the specified hardware. With a process as comprehensive as image processing, it was difficult to narrow down which parameters were crucial to look at, and how to examine the necessary number of events at the same time was never established. A possible solution in running multiple versions of the program, each with the same test program but focusing on different performance counters, was considered but the inability to get OpenCV and PAPI working together made this a null point. 

This leads to the consideration of the architectural impact, which for this project was too broad and could not be narrowed down successfully in time. It is difficult to examine what instructions an image processing routine will convert into, and which ones are architecturally significant, in determining performance bottlenecks. 

Ultimately, the primary difficulty resulted in the limited amount of time available in order to conduct the experiment, as well as shifting priorities due to unprocessed difficulties. Given a possible redo, the author may examine himself to analyzing a purely architectural aspect of GPU acceleration, for example DMA for GPUs, that have a clearly defined scope, easy measurability, as well as architectural significance. 

Bibliography
-------------

Dongarra, John, Kevin London, Shirley Moore, Phillip Mucci, and Dan Terpstra. "Using PAPI for Hardware Performance Monitoring on Linux Systems." Netlib.org (2015): n. pag. Netlib.org. Web. 04 Dec. 2015. <http://www.netlib.org/utk/people/JackDongarra/PAPERS/papi-linux.pdf>.

Duda, Richard O., and Peter E. Hart. "Use of the Hough Transform to Detect Lines and Circles in Pictures." Graphics and Image Processing (1972): n. pag. Web. <http://www.cse.unr.edu/~bebis/CS474/Handouts/HoughTransformPaper.pdf>.

Maini, Raman, and Himanshu Aggarwal. "Study and Comparison of Various Edge Detection Algorithms." International Journal of Image Processing 3.1 (n.d.): n. pag. Web. <http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.301.927&rep=rep1&type=pdf>.

Mucci, Phillip. "Performance Monitoring with PAPI." Dr. Dobb's World of Software Development. N/A, 01 June 2005. Web. 04 Dec. 2015.

"OpenCV 2.4.11 Documentation." OpenCV. OpenCV, 25 Feb. 2015. Web. 04 Dec. 2015.

"PAPI." PAPI. Innovative Computing Laboratory, University of Tennessee, 3 Feb. 2015. Web. 04 Dec. 2015.

Weaver, Vincent M., Matt Johnson, Kiran Kasichayanula, James Ralph, Piotr Luszczek, Dan Terpstra, and Shirley Moore. "Measuring Energy and Power with PAPI." 2012 41st International Conference on Parallel Processing Workshops (2012): n. pag. Web.




