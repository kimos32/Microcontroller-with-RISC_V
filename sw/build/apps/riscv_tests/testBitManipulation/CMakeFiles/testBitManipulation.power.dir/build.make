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

# Utility rule file for testBitManipulation.power.

# Include the progress variables for this target.
include apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/progress.make

apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running testBitManipulation in ModelSim (post layout)"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testBitManipulation && /usr/local/bin/cmake -E remove stdout/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testBitManipulation && /usr/local/bin/cmake -E remove FS/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testBitManipulation && tcsh -c env\ VSIM_DIR=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /home/nadeen/intelFPGA/20.1/modelsim_ase/bin/vsim\ \ -64\ -do\ 'source\ tcl_files/run_power.tcl\;'

testBitManipulation.power: apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power
testBitManipulation.power: apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/build.make

.PHONY : testBitManipulation.power

# Rule to build all files generated by this target.
apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/build: testBitManipulation.power

.PHONY : apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/build

apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testBitManipulation && $(CMAKE_COMMAND) -P CMakeFiles/testBitManipulation.power.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/clean

apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/testBitManipulation /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testBitManipulation /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/testBitManipulation/CMakeFiles/testBitManipulation.power.dir/depend

