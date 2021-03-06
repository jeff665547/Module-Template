cmake_minimum_required(VERSION 3.15)

include(FetchContent)
FetchContent_Declare(
    spdlog 
    GIT_REPOSITORY https://github.com/gabime/spdlog.git # The link of the repository.
    GIT_TAG v1.9.2
)
set(SPDLOG_INSTALL OFF)
FetchContent_MakeAvailable(spdlog)

add_library(status INTERFACE)
target_link_libraries(status INTERFACE spdlog::spdlog)

target_include_directories(
    status
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

if(PKG_INSTALL)
    install(
        TARGETS status
        EXPORT maths
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
    install(
        FILES ${CMAKE_CURRENT_SOURCE_DIR}/calc_status.h
              ${CMAKE_CURRENT_SOURCE_DIR}/calc_log.hpp
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )
endif()
