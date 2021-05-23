cmake_minimum_required(VERSION 3.19)
include(vcpkg.cmake)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)

message(${CMAKE_CXX_COMPILER})

find_package(unofficial-sqlite3 CONFIG REQUIRED)

add_executable(main main.cpp)

target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)
