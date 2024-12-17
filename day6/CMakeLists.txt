cmake_minimum_required(VERSION 3.10.0)
project(day6 VERSION 0.1.0 LANGUAGES C)

add_executable(day6 main.c)

target_sources(day6 PUBLIC board.c)
target_include_directories(day6 PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
