cmake_minimum_required(VERSION 3.19)

set(VCPKG_FEATURE_FLAGS manifests)
set(VCPKG_OVERLAY_PORTS ${CMAKE_CURRENT_LIST_DIR}/ports)

#include(vcpkg.cmake)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)

find_package(platform-exceptions CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC Platform.Exceptions)
