cmake_minimum_required(VERSION 3.19)

#todo: use VCPKG_OVERLAY_PORTS
file(COPY ports/platform-delegates-test DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/vcpkg/ports)
file(COPY ports/platform-exceptions-test DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/vcpkg/ports)

include(vcpkg.cmake)
project(vcpkg_sample)

set(CMAKE_CXX_STANDARD 20)

find_package(platform-exceptions-test CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC Platform.Exceptions)
