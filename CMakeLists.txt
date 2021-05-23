cmake_minimum_required(VERSION 3.19)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_CC_COMPILER gcc)

include(vcpkg.cmake)
project(vcpkg_sample)


message("CURRENT COMPILER IS ${CMAKE_CXX_COMPILER}")



message("CMAKE PREFIX ${CMAKE_PREFIX_PATH}")
message("CURRENT COMPILER IS ${CMAKE_CXX_COMPILER}")


vcpkg_add_package(sqlite3:x64-mingw-static)

find_package(unofficial-sqlite3 CONFIG REQUIRED)

add_executable(main main.cpp)

target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)
