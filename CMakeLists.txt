cmake_minimum_required(VERSION 3.14)

project(QuasiLinearEmbedder LANGUAGES CXX)

find_package(glog REQUIRED)
find_package(gflags REQUIRED)
find_package(GSL REQUIRED)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR})

# Sets Release build by default
if (NOT EXISTS ${CMAKE_BINARY_DIR}/CMakeCache.txt)
  if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE)
  endif()
endif()

add_library(qle hyperboliclinear.cpp hyperbolic.cpp graph.cpp random.cpp
                springembedder.cpp geometricds.cpp NLEHelper.cpp plfit/powerlawCommon.cpp)

add_executable(embedder main.cpp)
target_link_libraries(embedder qle glog gflags GSL::gsl)

add_executable(initialize initialize.cpp)
target_link_libraries(initialize qle glog gflags GSL::gsl)
