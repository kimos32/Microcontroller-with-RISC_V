# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
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
CMAKE_SOURCE_DIR = /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build

# Utility rule file for testI2C.fpga.

# Include the progress variables for this target.
include apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/progress.make

apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running testI2C on FPGA"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/imperio_tests/testI2C && /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/utils/run-on-fpga.sh testI2C

testI2C.fpga: apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga
testI2C.fpga: apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/build.make

.PHONY : testI2C.fpga

# Rule to build all files generated by this target.
apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/build: testI2C.fpga

.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/build

apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/imperio_tests/testI2C && $(CMAKE_COMMAND) -P CMakeFiles/testI2C.fpga.dir/cmake_clean.cmake
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/clean

apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/imperio_tests/testI2C /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/imperio_tests/testI2C /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.fpga.dir/depend

