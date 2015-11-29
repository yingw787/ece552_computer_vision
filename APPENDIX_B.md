Appendix B: Timing/Memory Analyses of Python Implementations using line_profiler and memory_profiler 
-------------

houghcircles.py/timing 

```
Timer unit: 1e-06 s

Total time: 2.22871 s
File: houghcircles.py
Function: houghcircles at line 16

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    16                                           @profile 
    17                                           def houghcircles(): 
    18         1          279    279.0      0.0     output = image.copy()
    19         1         2077   2077.0      0.1     gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20                                           
    21                                              # detect circles in the image
    22         1         6452   6452.0      0.3     circles = cv2.HoughCircles(gray, cv2.cv.CV_HOUGH_GRADIENT, 1.2, 100)
    23                                               
    24                                              # ensure at least some circles were found
    25         1            2      2.0      0.0     if circles is not None:
    26                                                  # convert the (x, y) coordinates and radius of the circles to integers
    27         1           98     98.0      0.0         circles = np.round(circles[0, :]).astype("int")
    28                                               
    29                                                  # loop over the (x, y) coordinates and radius of the circles
    30         2           15      7.5      0.0         for (x, y, r) in circles:
    31                                                      # draw the circle in the output image, then draw a rectangle
    32                                                      # corresponding to the center of the circle
    33         1          112    112.0      0.0             cv2.circle(output, (x, y), r, (0, 255, 0), 4)
    34         1           38     38.0      0.0             cv2.rectangle(output, (x - 5, y - 5), (x + 5, y + 5), (0, 128, 255), -1)
    35                                               
    36                                                  # show the output image
    37         1       129733 129733.0      5.8         cv2.imshow("output", np.hstack([image, output]))
    38         1      2089908 2089908.0     93.8        cv2.waitKey(0)

```

houghcircles.py/memory 

```
Filename: houghcircles.py

Line #    Mem usage    Increment   Line Contents
================================================
    16   33.914 MiB    0.000 MiB   @profile 
    17                             def houghcircles(): 
    18   34.637 MiB    0.723 MiB    output = image.copy()
    19   35.051 MiB    0.414 MiB    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20                             
    21                              # detect circles in the image
    22   35.434 MiB    0.383 MiB    circles = cv2.HoughCircles(gray, cv2.cv.CV_HOUGH_GRADIENT, 1.2, 100)
    23                               
    24                              # ensure at least some circles were found
    25   35.434 MiB    0.000 MiB    if circles is not None:
    26                                  # convert the (x, y) coordinates and radius of the circles to integers
    27   35.477 MiB    0.043 MiB        circles = np.round(circles[0, :]).astype("int")
    28                               
    29                                  # loop over the (x, y) coordinates and radius of the circles
    30   35.543 MiB    0.066 MiB        for (x, y, r) in circles:
    31                                      # draw the circle in the output image, then draw a rectangle
    32                                      # corresponding to the center of the circle
    33   35.527 MiB   -0.016 MiB            cv2.circle(output, (x, y), r, (0, 255, 0), 4)
    34   35.543 MiB    0.016 MiB            cv2.rectangle(output, (x - 5, y - 5), (x + 5, y + 5), (0, 128, 255), -1)
    35                               
    36                                  # show the output image
    37   39.016 MiB    3.473 MiB        cv2.imshow("output", np.hstack([image, output]))
    38   40.020 MiB    1.004 MiB        cv2.waitKey(0)

```

sobel.py/timing 

```
Timer unit: 1e-06 s

Total time: 1.91592 s
File: sobel.py
Function: sobel at line 17

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    17                                           @profile 
    18                                           def sobel(): 
    19         1         1412   1412.0      0.1     gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20         1          791    791.0      0.0     sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
    21         1          711    711.0      0.0     sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)
    22         1        11133  11133.0      0.6     sobelCombined = cv2.bitwise_or(sobelX, sobelY)
    23         1       160643 160643.0      8.4     cv2.imshow("image", image)
    24         1          550    550.0      0.0     cv2.imshow("output", sobelCombined)
    25         1      1740680 1740680.0     90.9    cv2.waitKey(0)

```

sobel.py/memory 

```
Filename: sobel.py

Line #    Mem usage    Increment   Line Contents
================================================
    17   31.492 MiB    0.000 MiB   @profile 
    18                             def sobel(): 
    19   31.832 MiB    0.340 MiB    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    20   32.473 MiB    0.641 MiB    sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
    21   33.000 MiB    0.527 MiB    sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)
    22   33.551 MiB    0.551 MiB    sobelCombined = cv2.bitwise_or(sobelX, sobelY)
    23   35.680 MiB    2.129 MiB    cv2.imshow("image", image)
    24   35.961 MiB    0.281 MiB    cv2.imshow("output", sobelCombined)
    25   36.930 MiB    0.969 MiB    cv2.waitKey(0)

```

quant.py/timing 

```
Timer unit: 1e-06 s

Total time: 3.85735 s
File: quant.py
Function: quant at line 19

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    19                                           @profile 
    20                                           def quant(image): 
    21                                              # find the dimensions of the image 
    22         1            6      6.0      0.0     r = 600.0 / image.shape[1]
    23         1            4      4.0      0.0     dim = (600, int(image.shape[0] * r))
    24                                              # resize the image 
    25         1        33690  33690.0      0.9     image = cv2.resize(image, dim, interpolation=cv2.INTER_AREA)
    26                                              # get image width and height 
    27         1            7      7.0      0.0     (h, w) = image.shape[:2]    
    28                                              # convert the image from the RGB color space to the L*a*b*
    29                                              # color space -- since we will be clustering using k-means
    30                                              # which is based on the euclidean distance, we'll use the
    31                                              # L*a*b* color space where the euclidean distance implies
    32                                              # perceptual meaning
    33         1        34404  34404.0      0.9     image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
    34                                              # reshape the image into a feature vector so that k-means
    35                                              # can be applied
    36         1           31     31.0      0.0     image = image.reshape((image.shape[0] * image.shape[1], 3))
    37                                              # apply k-means using the specified number of clusters and
    38                                              # then create the quantized image based on the predictions
    39         1           41     41.0      0.0     clt = MiniBatchKMeans(n_clusters = args["clusters"])
    40         1       751264 751264.0     19.5     labels = clt.fit_predict(image)
    41         1        12799  12799.0      0.3     quant = clt.cluster_centers_.astype("uint8")[labels]
    42                                              # reshape the feature vectors to images
    43         1            9      9.0      0.0     quant = quant.reshape((h, w, 3))
    44         1            2      2.0      0.0     image = image.reshape((h, w, 3))
    45                                              # convert from L*a*b* to RGB
    46         1         7402   7402.0      0.2     quant = cv2.cvtColor(quant, cv2.COLOR_LAB2BGR)
    47         1         7385   7385.0      0.2     image = cv2.cvtColor(image, cv2.COLOR_LAB2BGR)
    48                                              # display the images and wait for a keypress
    49         1       184846 184846.0      4.8     cv2.imshow("image", np.hstack([image, quant]))
    50         1      2825462 2825462.0     73.2    cv2.waitKey(0)

```

quant.py/memory 

```
Filename: quant.py

Line #    Mem usage    Increment   Line Contents
================================================
    19   60.953 MiB    0.000 MiB   @profile 
    20                             def quant(image): 
    21                              # find the dimensions of the image 
    22   60.953 MiB    0.000 MiB    r = 600.0 / image.shape[1]
    23   60.957 MiB    0.004 MiB    dim = (600, int(image.shape[0] * r))
    24                              # resize the image 
    25   61.922 MiB    0.965 MiB    image = cv2.resize(image, dim, interpolation=cv2.INTER_AREA)
    26                              # get image width and height 
    27   61.922 MiB    0.000 MiB    (h, w) = image.shape[:2]    
    28                              # convert the image from the RGB color space to the L*a*b*
    29                              # color space -- since we will be clustering using k-means
    30                              # which is based on the euclidean distance, we'll use the
    31                              # L*a*b* color space where the euclidean distance implies
    32                              # perceptual meaning
    33   62.594 MiB    0.672 MiB    image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
    34                              # reshape the image into a feature vector so that k-means
    35                              # can be applied
    36   62.594 MiB    0.000 MiB    image = image.reshape((image.shape[0] * image.shape[1], 3))
    37                              # apply k-means using the specified number of clusters and
    38                              # then create the quantized image based on the predictions
    39   62.594 MiB    0.000 MiB    clt = MiniBatchKMeans(n_clusters = args["clusters"])
    40   73.773 MiB   11.180 MiB    labels = clt.fit_predict(image)
    41   73.773 MiB    0.000 MiB    quant = clt.cluster_centers_.astype("uint8")[labels]
    42                              # reshape the feature vectors to images
    43   73.773 MiB    0.000 MiB    quant = quant.reshape((h, w, 3))
    44   73.773 MiB    0.000 MiB    image = image.reshape((h, w, 3))
    45                              # convert from L*a*b* to RGB
    46   73.785 MiB    0.012 MiB    quant = cv2.cvtColor(quant, cv2.COLOR_LAB2BGR)
    47   73.785 MiB    0.000 MiB    image = cv2.cvtColor(image, cv2.COLOR_LAB2BGR)
    48                              # display the images and wait for a keypress
    49   75.590 MiB    1.805 MiB    cv2.imshow("image", np.hstack([image, quant]))
    50   76.141 MiB    0.551 MiB    cv2.waitKey(0)

```

slic.py/timing 

```
Timer unit: 1e-06 s

Total time: 5.28289 s
File: slic.py
Function: segmentMaker at line 18

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    18                                           @profile 
    19                                           def segmentMaker(): 
    20         1            2      2.0      0.0     numSegments = 100; 
    21                                              # apply SLIC and extract (approximately) the supplied number
    22                                              # of segments
    23         1       528285 528285.0     10.0     segments = slic(image, n_segments = numSegments, sigma = 5)
    24                                              # show the output of SLIC
    25         1      1356093 1356093.0     25.7    fig = plt.figure("Superpixels -- %d segments" % (numSegments))
    26         1        74443  74443.0      1.4     ax = fig.add_subplot(1, 1, 1)
    27         1        31332  31332.0      0.6     ax.imshow(mark_boundaries(image, segments))
    28         1           73     73.0      0.0     plt.axis("off")
    29                                              # show the plots
    30         1      3292667 3292667.0     62.3    plt.show()
```

slic.py/memory 

```
Filename: slic.py

Line #    Mem usage    Increment   Line Contents
================================================
    18   65.535 MiB    0.000 MiB   @profile 
    19                             def segmentMaker(): 
    20   65.535 MiB    0.000 MiB    numSegments = 100; 
    21                              # apply SLIC and extract (approximately) the supplied number
    22                              # of segments
    23   81.520 MiB   15.984 MiB    segments = slic(image, n_segments = numSegments, sigma = 5)
    24                              # show the output of SLIC
    25   85.188 MiB    3.668 MiB    fig = plt.figure("Superpixels -- %d segments" % (numSegments))
    26   85.770 MiB    0.582 MiB    ax = fig.add_subplot(1, 1, 1)
    27   92.066 MiB    6.297 MiB    ax.imshow(mark_boundaries(image, segments))
    28   92.070 MiB    0.004 MiB    plt.axis("off")
    29                              # show the plots
    30   92.418 MiB    0.348 MiB    plt.show()

```
