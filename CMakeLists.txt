cmake_minimum_required(VERSION 3.19)

include(vcpkg.cmake)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)

find_package(platform-exceptions CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC Platform.Exceptions)
