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

# Utility rule file for matrixMul8.powerc.

# Include the progress variables for this target.
include apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/progress.make

apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running matrixMul8 in ModelSim (post layout)"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixMul8 && /usr/local/bin/cmake -E remove stdout/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixMul8 && /usr/local/bin/cmake -E remove FS/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixMul8 && tcsh -c env\ VSIM_DIR=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /home/nadeen/intelFPGA/20.1/modelsim_ase/bin/vsim\ \ -c\ -64\ -do\ 'source\ tcl_files/run_power.tcl\;\ run\ -a\;\ exit'

matrixMul8.powerc: apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc
matrixMul8.powerc: apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/build.make

.PHONY : matrixMul8.powerc

# Rule to build all files generated by this target.
apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/build: matrixMul8.powerc

.PHONY : apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/build

apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixMul8 && $(CMAKE_COMMAND) -P CMakeFiles/matrixMul8.powerc.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/clean

apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/matrixMul8 /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixMul8 /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/matrixMul8/CMakeFiles/matrixMul8.powerc.dir/depend

