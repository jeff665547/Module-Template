cmake_minimum_required(VERSION 3.15)

find_package(GTest REQUIRED)

add_executable(testMaths basic_math.cpp)

target_link_libraries(
    testMaths
    PRIVATE
        maths_library
        ProjectConfiguration
        GTest::gtest
        GTest::gtest_main
)

set(deps maths_library add_library subtract_library)

if(BUILD_SHARED_LIBS)
    foreach(elem ${deps})
        add_custom_command(
            TARGET testMaths 
            POST_BUILD 
            COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${elem}> ${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_FILE_NAME:${elem}>
        )
    endforeach()
endif()

include(GoogleTest)

gtest_discover_tests(testMaths)