cmake_minimum_required(VERSION 3.19)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_CC_COMPILER gcc)

message("CURRENT COMPILER IS ${CMAKE_CXX_COMPILER}")

include(vcpkg.cmake)

message("CURRENT COMPILER IS ${CMAKE_CXX_COMPILER}")

vcpkg_add_package(sqlite3)

find_package(unofficial-sqlite3 CONFIG REQUIRED)

add_executable(main main.cpp)

target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)
