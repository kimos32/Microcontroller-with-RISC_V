# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ahmed98/pulpino/sw

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ahmed98/pulpino/sw/build

# Utility rule file for matrixAdd16.

# Include any custom commands dependencies for this target.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/progress.make

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16:

matrixAdd16: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16
matrixAdd16: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/build.make
.PHONY : matrixAdd16

# Rule to build all files generated by this target.
apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/build: matrixAdd16
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/build

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixAdd && $(CMAKE_COMMAND) -P CMakeFiles/matrixAdd16.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/clean

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/sequential_tests/matrixAdd /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixAdd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd16.dir/depend

