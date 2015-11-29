ECE 552 Final Project Report
===================

Introduction
-------------

Today, people increasingly rely on image processing algorithms to expedite and enable various facets of their lives, sped up by the proliferation of smartphones and the advent of cloud computing. Given the increasing usage of image processing, demand for faster and higher performing algorithms will surely rise. Out of the many methods to speed up image processing routines, hardware acceleration ranks among the most popular. Since image processing can be parallelized on a pixel-by-pixel basis, and since the resulting image never needs to be cached, the use of hardware acceleration makes sense. 

The purpose of this paper is to compare a handful of image processing algorithms for differences in performance benefits from using a hardware acceleration schema vs. using a general CPU. Given differences within each image processing routine will be analyzed at the architectural level and architectural justifications for each will be given. Conclusions can then be drawn about the characteristics of image processing routines that can be easily sped up using GPU acceleration. Different programming languages (Python, C++, OpenCL) will be used in order to test their performance. 

Overview 
-------------

### Algorithms

This section will explain the different computer vision algorithms used in benchmarking performance speedups with hardware acceleration. 

####Circular Hough Transforms 

The circular Hough transform is analogous to the Hough transform for line detection. In order to detect a circle, three variables must be known; the x coordinate of the circle's center, the corresponding y coordinate, and the radius of the circle. An accumulator matrix is instantiated and traverses the gradient space of the image to search for a (x, y, r) combination; if it surpasses some threshold, it is considered to be a legitimate circle and will be returned from the function.  

Code for the circular Hough transform in all three languages is listed in Appendix A; this is the code used for benchmarking. Programs are ideally as similar to each other as possible in order to minimize the number of high-level differences between them as possible. 

####Sobel Edge Detection  

The Sobel operator is a discrete differentiation operator. It produces a gradient of the original image by convolving two kernels with the original image, for the x-gradient as well as the y-gradient. One can then bitwise or the returned results to create an overall gradient representation of the image. 

Code for the Sobel edge detection operator in all three languages in listed in Appendix A. 

####Color Quantization with K-Means Clustering




#### Superpixel Analysis






### Simulation Setup 




Simulation Results and Analysis
-------------



Architectural Discussion & Conclusion
-------------

### Architectural Simulators for GPGPUs
#### gem5 
#### gem5-gpu 



Bibliography
-------------

https://bitbucket.org/yingw787/ece552_computer_vision/commits/branch/master 

