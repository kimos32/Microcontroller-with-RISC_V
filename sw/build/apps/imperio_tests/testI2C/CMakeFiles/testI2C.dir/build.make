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

# Utility rule file for testI2C.

# Include any custom commands dependencies for this target.
include apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/progress.make

apps/imperio_tests/testI2C/CMakeFiles/testI2C:

testI2C: apps/imperio_tests/testI2C/CMakeFiles/testI2C
testI2C: apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/build.make
.PHONY : testI2C

# Rule to build all files generated by this target.
apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/build: testI2C
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/build

apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/imperio_tests/testI2C && $(CMAKE_COMMAND) -P CMakeFiles/testI2C.dir/cmake_clean.cmake
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/clean

apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/imperio_tests/testI2C /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/imperio_tests/testI2C /home/ahmed98/pulpino/sw/build/apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.dir/depend

