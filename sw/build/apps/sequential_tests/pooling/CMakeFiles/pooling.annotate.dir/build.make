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

# Utility rule file for pooling.annotate.

# Include any custom commands dependencies for this target.
include apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/progress.make

pooling.annotate: apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/build.make
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling && /home/ahmed98/pulpino/sw/utils/annotate.py pooling.read
.PHONY : pooling.annotate

# Rule to build all files generated by this target.
apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/build: pooling.annotate
.PHONY : apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/build

apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling && $(CMAKE_COMMAND) -P CMakeFiles/pooling.annotate.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/clean

apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/sequential_tests/pooling /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/pooling/CMakeFiles/pooling.annotate.dir/depend

