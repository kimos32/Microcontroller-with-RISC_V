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

# Utility rule file for UART_test.vsim.spi.

# Include any custom commands dependencies for this target.
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/progress.make

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running UART_test in ModelSim"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && /usr/local/bin/cmake -E remove stdout/*
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && /usr/local/bin/cmake -E remove FS/*
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && tcsh -c env\ VSIM_DIR=/home/ahmed98/pulpino/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST="ARDUINO_UART"\ /home/ahmed98/intelFPGA/20.1/modelsim_ase/bin/vsim\ \ -64\ -do\ 'source\ tcl_files/run_spi.tcl\;'

UART_test.vsim.spi: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi
UART_test.vsim.spi: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/build.make
.PHONY : UART_test.vsim.spi

# Rule to build all files generated by this target.
apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/build: UART_test.vsim.spi
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/build

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && $(CMAKE_COMMAND) -P CMakeFiles/UART_test.vsim.spi.dir/cmake_clean.cmake
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/clean

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/Arduino_tests/UART_test /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.vsim.spi.dir/depend

