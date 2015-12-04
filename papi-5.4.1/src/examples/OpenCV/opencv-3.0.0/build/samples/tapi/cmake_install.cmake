# Install script for directory: /home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/tapi" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/pyrlk_optical_flow.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/camshift.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/clahe.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/bgfg_segm.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/squares.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/tvl1_optical_flow.cpp"
    "/home/yingw787/Ying/ece552_computer_vision/papi-5.4.1/src/examples/OpenCV/opencv-3.0.0/samples/tapi/hog.cpp"
    )
endif()

