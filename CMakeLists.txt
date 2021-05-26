cmake_minimum_required(VERSION 3.19)

#todo: use VCPKG_OVERLAY_PORTS (maybe)
file(COPY ports/platform-delegates DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/vcpkg/ports)
file(COPY ports/platform-exceptions DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/vcpkg/ports)

include(vcpkg.cmake)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)

find_package(platform-exceptions CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC Platform.Exceptions)
