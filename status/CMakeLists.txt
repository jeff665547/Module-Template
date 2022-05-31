cmake_minimum_required(VERSION 3.15)

find_package(spdlog REQUIRED)

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
