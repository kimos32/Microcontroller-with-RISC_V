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

# Utility rule file for perfbench.keccak.read.

# Include the progress variables for this target.
include apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/progress.make

perfbench.keccak.read: apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/build.make
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-objdump -Mmarch=IMXpulpv2 -d /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak/perfbench.keccak.elf > perfbench.keccak.read
.PHONY : perfbench.keccak.read

# Rule to build all files generated by this target.
apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/build: perfbench.keccak.read

.PHONY : apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/build

apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.keccak.read.dir/cmake_clean.cmake
.PHONY : apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/clean

apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/bench/keccak /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/keccak/CMakeFiles/perfbench.keccak.read.dir/depend

