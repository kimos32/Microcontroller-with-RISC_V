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

# Utility rule file for testEvents.vsimc.

# Include the progress variables for this target.
include apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/progress.make

apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running testEvents in ModelSim"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents && /usr/local/bin/cmake -E remove stdout/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents && /usr/local/bin/cmake -E remove FS/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents && tcsh -c env\ VSIM_DIR=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /home/nadeen/intelFPGA/20.1/modelsim_ase/bin/vsim\ \ -c\ -64\ -do\ 'source\ tcl_files/run.tcl\;\ run\ -a\;\ exit\;'\ >vsim.log
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents && tail -n +1 -- ./stdout/*

testEvents.vsimc: apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc
testEvents.vsimc: apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/build.make

.PHONY : testEvents.vsimc

# Rule to build all files generated by this target.
apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/build: testEvents.vsimc

.PHONY : apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/build

apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents && $(CMAKE_COMMAND) -P CMakeFiles/testEvents.vsimc.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/clean

apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/testEvents /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/testEvents/CMakeFiles/testEvents.vsimc.dir/depend

