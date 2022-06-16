cmake_minimum_required(VERSION 3.15)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(ProjectConfiguration INTERFACE)
target_compile_options(ProjectConfiguration 
    INTERFACE
        -O3 
        -Wall 
        -Wextra
        # $<$<COMPILE_LANGUAGE:CXX>:-Weffc++>  # Comments since spdlod has C code.
)
target_compile_features(ProjectConfiguration
    INTERFACE
        cxx_std_17  # for -std=c++17
)