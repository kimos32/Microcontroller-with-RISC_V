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

# Utility rule file for pooling.fpga.

# Include any custom commands dependencies for this target.
include apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/progress.make

apps/sequential_tests/pooling/CMakeFiles/pooling.fpga:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running pooling on FPGA"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling && /home/ahmed98/pulpino/sw/utils/run-on-fpga.sh pooling

pooling.fpga: apps/sequential_tests/pooling/CMakeFiles/pooling.fpga
pooling.fpga: apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/build.make
.PHONY : pooling.fpga

# Rule to build all files generated by this target.
apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/build: pooling.fpga
.PHONY : apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/build

apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling && $(CMAKE_COMMAND) -P CMakeFiles/pooling.fpga.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/clean

apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/sequential_tests/pooling /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling /home/ahmed98/pulpino/sw/build/apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/pooling/CMakeFiles/pooling.fpga.dir/depend

