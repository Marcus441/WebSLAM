cmake_minimum_required(VERSION 3.10)

project(WebSLAM LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable( ${PROJECT_NAME}
    src/hello-world.cpp
)

