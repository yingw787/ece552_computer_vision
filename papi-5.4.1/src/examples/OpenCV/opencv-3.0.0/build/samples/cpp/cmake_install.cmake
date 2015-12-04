# Install script for directory: /home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/cpp" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/stitching.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/em.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/stereo_match.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/videostab.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/laplace.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/shape_example.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/connected_components.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/points_classifier.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/3calibration.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/lsd_lines.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/starter_video.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/smiledetect.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/intelperc_capture.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/opencv_version.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/facial_features.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/fitellipse.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/cloning_gui.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/phase_corr.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/fback.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/stitching_detailed.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/mask_tmpl.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/edge.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/filestorage.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/kalman.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/houghlines.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/facedetect.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/houghcircles.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/image_sequence.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/calibration.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/starter_imagelist.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/bgfg_segm.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/imagelist_creator.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/delaunay2.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/ffilldemo.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/openni_capture.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/autofocus.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/squares.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/npr_demo.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/image.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/dft.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/ufacedetect.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/tvl1_optical_flow.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/drawing.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/segment_objects.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/stereo_calib.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/detect_mser.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/create_mask.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/matchmethod_orb_akaze_brisk.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/minarea.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/polar_transforms.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/demhist.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/morphology2.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/watershed.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/dbt_face_detection.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/pca.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/detect_blob.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/inpaint.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/letter_recog.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/image_alignment.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/distrans.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/logistic_regression.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/lkdemo.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/camshiftdemo.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/select3dobj.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/train_HOG.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/convexhull.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/grabcut.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/kmeans.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/cloning_demo.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/cout_mat.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/tree_engine.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/cpp/contours2.cpp"
    )
endif()

