Appendix B: Timing/Memory Analyses of Python Implementations using line_profiler and memory_profiler 
-------------

houghcircles.py/timing 

```
Timer unit: 1e-06 s

Total time: 3.50474 s
File: houghcircles.py
Function: houghcircles at line 16

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    16                                           @profile 
    17                                           def houghcircles(): 
    18         1           62     62.0      0.0  	output = image.copy()
    19         1          299    299.0      0.0  	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20                                           
    21                                           	# detect circles in the image
    22         1         7751   7751.0      0.2  	circles = cv2.HoughCircles(gray, cv2.cv.CV_HOUGH_GRADIENT, 1.2, 100)
    23                                           	 
    24                                           	# ensure at least some circles were found
    25         1            2      2.0      0.0  	if circles is not None:
    26                                           		# convert the (x, y) coordinates and radius of the circles to integers
    27         1           82     82.0      0.0  		circles = np.round(circles[0, :]).astype("int")
    28                                           	 
    29                                           		# loop over the (x, y) coordinates and radius of the circles
    30         2           17      8.5      0.0  		for (x, y, r) in circles:
    31                                           			# draw the circle in the output image, then draw a rectangle
    32                                           			# corresponding to the center of the circle
    33         1           96     96.0      0.0  			cv2.circle(output, (x, y), r, (0, 255, 0), 4)
    34         1           35     35.0      0.0  			cv2.rectangle(output, (x - 5, y - 5), (x + 5, y + 5), (0, 128, 255), -1)
    35                                           	 
    36                                           		# show the output image
    37         1        67848  67848.0      1.9  		cv2.imshow("output", np.hstack([image, output]))
    38         1      3428553 3428553.0     97.8  		cv2.waitKey(0)

```

houghcircles.py/memory 

```
Filename: houghcircles.py

Line #    Mem usage    Increment   Line Contents
================================================
    16   27.891 MiB    0.000 MiB   @profile 
    17                             def houghcircles(): 
    18   27.898 MiB    0.008 MiB   	output = image.copy()
    19   28.234 MiB    0.336 MiB   	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20                             
    21                             	# detect circles in the image
    22   30.695 MiB    2.461 MiB   	circles = cv2.HoughCircles(gray, cv2.cv.CV_HOUGH_GRADIENT, 1.2, 100)
    23                             	 
    24                             	# ensure at least some circles were found
    25   30.695 MiB    0.000 MiB   	if circles is not None:
    26                             		# convert the (x, y) coordinates and radius of the circles to integers
    27   30.750 MiB    0.055 MiB   		circles = np.round(circles[0, :]).astype("int")
    28                             	 
    29                             		# loop over the (x, y) coordinates and radius of the circles
    30   30.805 MiB    0.055 MiB   		for (x, y, r) in circles:
    31                             			# draw the circle in the output image, then draw a rectangle
    32                             			# corresponding to the center of the circle
    33   30.781 MiB   -0.023 MiB   			cv2.circle(output, (x, y), r, (0, 255, 0), 4)
    34   30.805 MiB    0.023 MiB   			cv2.rectangle(output, (x - 5, y - 5), (x + 5, y + 5), (0, 128, 255), -1)
    35                             	 
    36                             		# show the output image
    37   43.695 MiB   12.891 MiB   		cv2.imshow("output", np.hstack([image, output]))
    38   49.688 MiB    5.992 MiB   		cv2.waitKey(0)

```

sobel.py/timing 

```
Timer unit: 1e-06 s

Total time: 2.74255 s
File: sobel.py
Function: sobel at line 17

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    17                                           @profile 
    18                                           def sobel(): 
    19         1         1171   1171.0      0.0  	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20         1         9777   9777.0      0.4  	sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
    21         1          780    780.0      0.0  	sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)
    22         1          384    384.0      0.0  	sobelCombined = cv2.bitwise_or(sobelX, sobelY)
    23         1       164081 164081.0      6.0  	cv2.imshow("image", image)
    24         1         7195   7195.0      0.3  	cv2.imshow("output", sobelCombined)
    25         1      2559161 2559161.0     93.3  	cv2.waitKey(0)
```

sobel.py/memory 

```
Filename: sobel.py

Line #    Mem usage    Increment   Line Contents
================================================
    17   26.750 MiB    0.000 MiB   @profile 
    18                             def sobel(): 
    19   26.812 MiB    0.062 MiB   	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20   27.461 MiB    0.648 MiB   	sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
    21   27.988 MiB    0.527 MiB   	sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)
    22   28.531 MiB    0.543 MiB   	sobelCombined = cv2.bitwise_or(sobelX, sobelY)
    23   34.867 MiB    6.336 MiB   	cv2.imshow("image", image)
    24   35.832 MiB    0.965 MiB   	cv2.imshow("output", sobelCombined)
    25   40.273 MiB    4.441 MiB   	cv2.waitKey(0)
```

quant.py/timing 

```
Timer unit: 1e-06 s

Total time: 3.11078 s
File: quant.py
Function: quant at line 19

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    19                                           @profile 
    20                                           def quant(image): 
    21                                           	# find the dimensions of the image 
    22         1            8      8.0      0.0  	r = 600.0 / image.shape[1]
    23         1            5      5.0      0.0  	dim = (600, int(image.shape[0] * r))
    24                                           	# resize the image 
    25         1         4672   4672.0      0.2  	image = cv2.resize(image, dim, interpolation=cv2.INTER_AREA)
    26                                           	# get image width and height 
    27         1            6      6.0      0.0  	(h, w) = image.shape[:2]	
    28                                           	# convert the image from the RGB color space to the L*a*b*
    29                                           	# color space -- since we will be clustering using k-means
    30                                           	# which is based on the euclidean distance, we'll use the
    31                                           	# L*a*b* color space where the euclidean distance implies
    32                                           	# perceptual meaning
    33         1         1129   1129.0      0.0  	image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
    34                                           	# reshape the image into a feature vector so that k-means
    35                                           	# can be applied
    36         1           26     26.0      0.0  	image = image.reshape((image.shape[0] * image.shape[1], 3))
    37                                           	# apply k-means using the specified number of clusters and
    38                                           	# then create the quantized image based on the predictions
    39         1           34     34.0      0.0  	clt = MiniBatchKMeans(n_clusters = args["clusters"])
    40         1      2174238 2174238.0     69.9  	labels = clt.fit_predict(image)
    41         1        12378  12378.0      0.4  	quant = clt.cluster_centers_.astype("uint8")[labels]
    42                                           	# reshape the feature vectors to images
    43         1            7      7.0      0.0  	quant = quant.reshape((h, w, 3))
    44         1            3      3.0      0.0  	image = image.reshape((h, w, 3))
    45                                           	# convert from L*a*b* to RGB
    46         1         3197   3197.0      0.1  	quant = cv2.cvtColor(quant, cv2.COLOR_LAB2BGR)
    47         1         3110   3110.0      0.1  	image = cv2.cvtColor(image, cv2.COLOR_LAB2BGR)
    48                                           	# display the images and wait for a keypress
    49         1        60992  60992.0      2.0  	cv2.imshow("image", np.hstack([image, quant]))
    50         1       850972 850972.0     27.4  	cv2.waitKey(0)
```

quant.py/memory 

```
Filename: quant.py

Line #    Mem usage    Increment   Line Contents
================================================
    19   57.164 MiB    0.000 MiB   @profile 
    20                             def quant(image): 
    21                             	# find the dimensions of the image 
    22   57.164 MiB    0.000 MiB   	r = 600.0 / image.shape[1]
    23   57.164 MiB    0.000 MiB   	dim = (600, int(image.shape[0] * r))
    24                             	# resize the image 
    25   57.363 MiB    0.199 MiB   	image = cv2.resize(image, dim, interpolation=cv2.INTER_AREA)
    26                             	# get image width and height 
    27   57.363 MiB    0.000 MiB   	(h, w) = image.shape[:2]	
    28                             	# convert the image from the RGB color space to the L*a*b*
    29                             	# color space -- since we will be clustering using k-means
    30                             	# which is based on the euclidean distance, we'll use the
    31                             	# L*a*b* color space where the euclidean distance implies
    32                             	# perceptual meaning
    33   58.160 MiB    0.797 MiB   	image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
    34                             	# reshape the image into a feature vector so that k-means
    35                             	# can be applied
    36   58.164 MiB    0.004 MiB   	image = image.reshape((image.shape[0] * image.shape[1], 3))
    37                             	# apply k-means using the specified number of clusters and
    38                             	# then create the quantized image based on the predictions
    39   58.164 MiB    0.000 MiB   	clt = MiniBatchKMeans(n_clusters = args["clusters"])
    40   73.965 MiB   15.801 MiB   	labels = clt.fit_predict(image)
    41   73.969 MiB    0.004 MiB   	quant = clt.cluster_centers_.astype("uint8")[labels]
    42                             	# reshape the feature vectors to images
    43   73.969 MiB    0.000 MiB   	quant = quant.reshape((h, w, 3))
    44   73.969 MiB    0.000 MiB   	image = image.reshape((h, w, 3))
    45                             	# convert from L*a*b* to RGB
    46   74.684 MiB    0.715 MiB   	quant = cv2.cvtColor(quant, cv2.COLOR_LAB2BGR)
    47   74.684 MiB    0.000 MiB   	image = cv2.cvtColor(image, cv2.COLOR_LAB2BGR)
    48                             	# display the images and wait for a keypress
    49   84.973 MiB   10.289 MiB   	cv2.imshow("image", np.hstack([image, quant]))
    50   90.594 MiB    5.621 MiB   	cv2.waitKey(0)
```

slic.py/timing 

```
Timer unit: 1e-06 s

Total time: 2.81834 s
File: slic.py
Function: segmentMaker at line 18

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    18                                           @profile 
    19                                           def segmentMaker(): 
    20         1            3      3.0      0.0  	numSegments = 100; 
    21                                           	# apply SLIC and extract (approximately) the supplied number
    22                                           	# of segments
    23         1       534102 534102.0     19.0  	segments = slic(image, n_segments = numSegments, sigma = 5)
    24                                           	# show the output of SLIC
    25         1        71873  71873.0      2.6  	fig = plt.figure("Superpixels -- %d segments" % (numSegments))
    26         1        85900  85900.0      3.0  	ax = fig.add_subplot(1, 1, 1)
    27         1        36507  36507.0      1.3  	ax.imshow(mark_boundaries(image, segments))
    28         1          101    101.0      0.0  	plt.axis("off")
    29                                           	# show the plots
    30         1      2089850 2089850.0     74.2  	plt.show()
```

slic.py/memory 

```
Filename: slic.py

Line #    Mem usage    Increment   Line Contents
================================================
    18   80.926 MiB    0.000 MiB   @profile 
    19                             def segmentMaker(): 
    20   80.930 MiB    0.004 MiB   	numSegments = 100; 
    21                             	# apply SLIC and extract (approximately) the supplied number
    22                             	# of segments
    23  119.355 MiB   38.426 MiB   	segments = slic(image, n_segments = numSegments, sigma = 5)
    24                             	# show the output of SLIC
    25  121.887 MiB    2.531 MiB   	fig = plt.figure("Superpixels -- %d segments" % (numSegments))
    26  122.887 MiB    1.000 MiB   	ax = fig.add_subplot(1, 1, 1)
    27  111.457 MiB  -11.430 MiB   	ax.imshow(mark_boundaries(image, segments))
    28  111.457 MiB    0.000 MiB   	plt.axis("off")
    29                             	# show the plots
    30  129.715 MiB   18.258 MiB   	plt.show()
```