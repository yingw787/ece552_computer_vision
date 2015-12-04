# Install script for directory: /home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libs")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/haarcascades" TYPE FILE FILES
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_frontalface_alt.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_frontalface_default.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_frontalcatface.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_eye_tree_eyeglasses.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_upperbody.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_eye.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_lefteye_2splits.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_lowerbody.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_profileface.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_frontalcatface_extended.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_smile.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_fullbody.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_licence_plate_rus_16stages.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_frontalface_alt2.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_righteye_2splits.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_russian_plate_number.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/haarcascades/haarcascade_frontalface_alt_tree.xml"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libs")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/lbpcascades" TYPE FILE FILES
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/lbpcascades/lbpcascade_profileface.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/lbpcascades/lbpcascade_frontalcatface.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/lbpcascades/lbpcascade_frontalface.xml"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/data/lbpcascades/lbpcascade_silverware.xml"
    )
endif()

