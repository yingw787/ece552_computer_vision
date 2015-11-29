Appendix A: Source Code for all Implementations 
-------------

houghcircles.py 

```
# creds: http://www.pyimagesearch.com/2014/07/21/detecting-circles-images-using-opencv-hough-circles/ 

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
def houghcircles(): 
    output = image.copy()
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # detect circles in the image
    circles = cv2.HoughCircles(gray, cv2.cv.CV_HOUGH_GRADIENT, 1.2, 100)
     
    # ensure at least some circles were found
    if circles is not None:
        # convert the (x, y) coordinates and radius of the circles to integers
        circles = np.round(circles[0, :]).astype("int")
     
        # loop over the (x, y) coordinates and radius of the circles
        for (x, y, r) in circles:
            # draw the circle in the output image, then draw a rectangle
            # corresponding to the center of the circle
            cv2.circle(output, (x, y), r, (0, 255, 0), 4)
            cv2.rectangle(output, (x - 5, y - 5), (x + 5, y + 5), (0, 128, 255), -1)
     
        # show the output image
        cv2.imshow("output", np.hstack([image, output]))
        cv2.waitKey(0)
        
houghcircles() 

```


houghcircles.cpp 

```


```

houghcircles.ocl 

```


```

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
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

sobelX = cv2.Sobel(gray, cv2.CV_64F, 1, 0)
sobelY = cv2.Sobel(gray, cv2.CV_64F, 0, 1)

sobelCombined = cv2.bitwise_or(sobelX, sobelY)

cv2.imshow("image", image)
cv2.imshow("output", sobelCombined)
cv2.waitKey(0)

```

sobel.cpp 

```

```

sobel.ocl 

```

```

quant.py 

```
# creds: http://www.pyimagesearch.com/2014/07/07/color-quantization-opencv-using-k-means-clustering/

# import the necessary packages
from sklearn.cluster import MiniBatchKMeans
import numpy as np
import argparse
import cv2
 
# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
ap.add_argument("-c", "--clusters", required = True, type = int,
    help = "# of clusters")
args = vars(ap.parse_args())

# load the image and grab its width and height

image = cv2.imread(args["image"])

r = 600.0 / image.shape[1]
dim = (600, int(image.shape[0] * r))

image = cv2.resize(image, dim, interpolation=cv2.INTER_AREA)

(h, w) = image.shape[:2]
 
# convert the image from the RGB color space to the L*a*b*
# color space -- since we will be clustering using k-means
# which is based on the euclidean distance, we'll use the
# L*a*b* color space where the euclidean distance implies
# perceptual meaning
image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
 
# reshape the image into a feature vector so that k-means
# can be applied
image = image.reshape((image.shape[0] * image.shape[1], 3))
 
# apply k-means using the specified number of clusters and
# then create the quantized image based on the predictions
clt = MiniBatchKMeans(n_clusters = args["clusters"])
labels = clt.fit_predict(image)
quant = clt.cluster_centers_.astype("uint8")[labels]
 
# reshape the feature vectors to images
quant = quant.reshape((h, w, 3))
image = image.reshape((h, w, 3))
 
# convert from L*a*b* to RGB
quant = cv2.cvtColor(quant, cv2.COLOR_LAB2BGR)
image = cv2.cvtColor(image, cv2.COLOR_LAB2BGR)
 
# display the images and wait for a keypress
cv2.imshow("image", np.hstack([image, quant]))
cv2.waitKey(0)
```

quant.cpp 

```

```

quant.ocl 

```

```

slic.py 

```
# creds: http://www.pyimagesearch.com/2014/07/28/a-slic-superpixel-tutorial-using-python/

# import the necessary packages
from skimage.segmentation import slic
from skimage.segmentation import mark_boundaries
from skimage.util import img_as_float
from skimage import io
import matplotlib.pyplot as plt
import argparse
 
# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())
 
# load the image and convert it to a floating point data type
image = img_as_float(io.imread(args["image"]))
 
numSegments = 100; 
# apply SLIC and extract (approximately) the supplied number
# of segments
segments = slic(image, n_segments = numSegments, sigma = 5)

# show the output of SLIC
fig = plt.figure("Superpixels -- %d segments" % (numSegments))
ax = fig.add_subplot(1, 1, 1)
ax.imshow(mark_boundaries(image, segments))
plt.axis("off")
 
# show the plots
plt.show()
```

slic.cpp 

```

```

slic.ocl 

```

```