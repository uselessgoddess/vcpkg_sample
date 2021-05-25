vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/linksplatform/Exceptions/archive/refs/heads/master.zip"
        FILENAME "platform-exceptions-test.zip"
        SHA512 2dc213a276774ea812643a09efe69ff42dbe367d101646d4cc8b86609557a1beec656ec3b6e192c80ee8d9313bf965d9d3a67f15ccb02b2f26e7f161b2893a24
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE ${ARCHIVE}
)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${SOURCE_PATH}/cpp/Platform.Exceptions DESTINATION ${CURRENT_PACKAGES_DIR}/include/)


set(DEPENDENCIES_PACKAGE_LIST)
set(DEPENDENCIES_LIBRARY_LIST)

list(APPEND DEPENDENCIES_PACKAGE_LIST platform-delegates-test)
list(APPEND DEPENDENCIES_LIBRARY_LIST Platform.Delegates)


file(WRITE ${CURRENT_PACKAGES_DIR}/share/${PORT}/platform-exceptions-test-config.cmake

        "find_package("${DEPENDENCIES_PACKAGE_LIST}" CONFIG REQUIRED)\n"
        "\n"
        "add_library(Platform.Exceptions INTERFACE)\n"
        "set_target_properties(Platform.Exceptions PROPERTIES CXX_STANDARD 20)\n"
        "\n"
        "target_link_libraries(Platform.Exceptions INTERFACE "${DEPENDENCIES_LIBRARY_LIST}")\n"
        "target_include_directories(Platform.Exceptions INTERFACE "${CURRENT_INSTALLED_DIR}/include/Platform.Exceptions")\n"
        )

# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   CURRENT_INSTALLED_DIR     = ${VCPKG_ROOT_DIR}\installed\${TRIPLET}
#   DOWNLOADS                 = ${VCPKG_ROOT_DIR}\downloads
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#   VCPKG_TOOLCHAIN           = ON OFF
#   TRIPLET_SYSTEM_ARCH       = arm x86 x64
#   BUILD_ARCH                = "Win32" "x64" "ARM"
#   MSBUILD_PLATFORM          = "Win32"/"x64"/${TRIPLET_SYSTEM_ARCH}
#   DEBUG_CONFIG              = "Debug Static" "Debug Dll"
#   RELEASE_CONFIG            = "Release Static"" "Release DLL"
#   VCPKG_TARGET_IS_WINDOWS
#   VCPKG_TARGET_IS_UWP
#   VCPKG_TARGET_IS_LINUX
#   VCPKG_TARGET_IS_OSX
#   VCPKG_TARGET_IS_FREEBSD
#   VCPKG_TARGET_IS_ANDROID
#   VCPKG_TARGET_IS_MINGW
#   VCPKG_TARGET_EXECUTABLE_SUFFIX
#   VCPKG_TARGET_STATIC_LIBRARY_SUFFIX
#   VCPKG_TARGET_SHARED_LIBRARY_SUFFIX
