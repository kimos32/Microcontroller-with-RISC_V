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

# Utility rule file for perfbench.conv2d.kcg.

# Include the progress variables for this target.
include apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/progress.make

apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/conv2d && pulp-pc-analyze --rtl --input=trace_core_00.log --binary=perfbench.conv2d.elf
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/conv2d && kcachegrind kcg.txt

perfbench.conv2d.kcg: apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg
perfbench.conv2d.kcg: apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/build.make

.PHONY : perfbench.conv2d.kcg

# Rule to build all files generated by this target.
apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/build: perfbench.conv2d.kcg

.PHONY : apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/build

apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/conv2d && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.conv2d.kcg.dir/cmake_clean.cmake
.PHONY : apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/clean

apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/bench/conv2d /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/conv2d /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/conv2d/CMakeFiles/perfbench.conv2d.kcg.dir/depend

