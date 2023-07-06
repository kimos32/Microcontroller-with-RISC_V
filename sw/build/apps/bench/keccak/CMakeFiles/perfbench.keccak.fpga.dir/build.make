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

# Utility rule file for perfbench.keccak.fpga.

# Include the progress variables for this target.
include apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/progress.make

apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running perfbench.keccak on FPGA"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak && /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/utils/run-on-fpga.sh perfbench.keccak

perfbench.keccak.fpga: apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga
perfbench.keccak.fpga: apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/build.make

.PHONY : perfbench.keccak.fpga

# Rule to build all files generated by this target.
apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/build: perfbench.keccak.fpga

.PHONY : apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/build

apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.keccak.fpga.dir/cmake_clean.cmake
.PHONY : apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/clean

apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/bench/keccak /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/keccak/CMakeFiles/perfbench.keccak.fpga.dir/depend

