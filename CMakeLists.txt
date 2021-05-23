cmake_minimum_required(VERSION 3.19)
include(vcpkg.cmake)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)

vcpkg_add_target_triplet(x64-mingw-static)

vcpkg_add_package(sqlite3:x64-mingw-static)

find_package(unofficial-sqlite3 CONFIG REQUIRED)

add_executable(main main.cpp)

target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)