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

# Utility rule file for motion_detection.bin.cmd.

# Include any custom commands dependencies for this target.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/progress.make

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd: apps/sequential_tests/motion_detection/motion_detection.bin

apps/sequential_tests/motion_detection/motion_detection.bin: apps/sequential_tests/motion_detection/motion_detection.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating motion_detection.bin"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-objcopy -R .debug_frame -R .comment -R .stack -R .heapsram -R .heapscm -R .scmlock -O binary /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection/motion_detection.elf motion_detection.bin

motion_detection.bin.cmd: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd
motion_detection.bin.cmd: apps/sequential_tests/motion_detection/motion_detection.bin
motion_detection.bin.cmd: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/build.make
.PHONY : motion_detection.bin.cmd

# Rule to build all files generated by this target.
apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/build: motion_detection.bin.cmd
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/build

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && $(CMAKE_COMMAND) -P CMakeFiles/motion_detection.bin.cmd.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/clean

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/sequential_tests/motion_detection /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.bin.cmd.dir/depend

