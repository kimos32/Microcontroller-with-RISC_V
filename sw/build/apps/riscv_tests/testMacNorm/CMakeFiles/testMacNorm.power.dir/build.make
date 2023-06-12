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

# Utility rule file for testMacNorm.power.

# Include any custom commands dependencies for this target.
include apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/progress.make

apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running testMacNorm in ModelSim (post layout)"
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testMacNorm && /usr/local/bin/cmake -E remove stdout/*
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testMacNorm && /usr/local/bin/cmake -E remove FS/*
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testMacNorm && tcsh -c env\ VSIM_DIR=/home/ahmed98/pulpino/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /home/ahmed98/intelFPGA/20.1/modelsim_ase/bin/vsim\ \ -64\ -do\ 'source\ tcl_files/run_power.tcl\;'

testMacNorm.power: apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power
testMacNorm.power: apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/build.make
.PHONY : testMacNorm.power

# Rule to build all files generated by this target.
apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/build: testMacNorm.power
.PHONY : apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/build

apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testMacNorm && $(CMAKE_COMMAND) -P CMakeFiles/testMacNorm.power.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/clean

apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/riscv_tests/testMacNorm /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testMacNorm /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/testMacNorm/CMakeFiles/testMacNorm.power.dir/depend

