# cmake_minimum_required(VERSION 3.10)
cmake_minimum_required(VERSION 3.4.1)

# TODO: Specify API version and commit hash in a file shared with all build build scripts?
set(API_VERSION "v1.0.4-beta")
set(COMMIT "371595d6c")
set(DOWNLOAD_URL "https://github.com/KomodoPlatform/atomicDEX-API/releases/download")

# find_library(log-lib log)
# find_package(ZLIB)

# set(IMPORT_DIR ${CMAKE_SOURCE_DIR}/libs)

# # add_library(mm2-lib
# #             SHARED
# #             mm2_native.cpp
# # )

# add_library(mm2-api
#             STATIC
#             IMPORTED
# )

# set_target_properties(mm2-api
#                       PROPERTIES IMPORTED_LOCATION
#                       ${IMPORT_DIR}/${ANDROID_ABI}/libmm2.a
# )

# target_link_libraries(mm2-lib
#                       mm2-api
#                       ${log-lib}
#                       ZLIB::ZLIB
# )


set(LibRoot "${CMAKE_CURRENT_SOURCE_DIR}/src/main/cpp/libs")

# Define a function to download and extract libraries
function(download_and_extract version commit arch outDir expectedHash)
  set(DownloadURL "${DOWNLOAD_URL}/${version}/mm2-${commit}-android-${arch}-CI.zip")
  set(ArchivePath "${CMAKE_CURRENT_SOURCE_DIR}/${arch}.zip")

  # Download the ZIP file if it doesn't exist
  if(NOT EXISTS ${ArchivePath})
    file(DOWNLOAD
      ${DownloadURL}
      ${ArchivePath}
      TLS_VERIFY ON
    )
  else()
    file(SHA256 ${ArchivePath} actualHash)
    if(NOT "${actualHash}" STREQUAL "${expectedHash}")
      message(FATAL_ERROR "Hash mismatch for ${ArchivePath}")
    endif()
  endif()

  # Extract the ZIP file
  file(REMOVE_RECURSE ${outDir})
  file(MAKE_DIRECTORY ${outDir})
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E tar xzf ${ArchivePath}
    WORKING_DIRECTORY ${outDir}
  )

  # Delete the ZIP file
  file(REMOVE ${ArchivePath})
endfunction()

download_and_extract(${API_VERSION} ${COMMIT} "aarch64" "${LibRoot}/arm64-v8a" "<expected_hash_for_aarch64>")
download_and_extract(${API_VERSION} ${COMMIT} "armv7" "${LibRoot}/armeabi-v7a" "<expected_hash_for_armv7>")
