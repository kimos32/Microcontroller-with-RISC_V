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

# Utility rule file for freertos.vsimc.spi.pl.

# Include the progress variables for this target.
include apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/progress.make

apps/freertos/CMakeFiles/freertos.vsimc.spi.pl:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running freertos in ModelSim (post layout)"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/freertos && /usr/local/bin/cmake -E remove stdout/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/freertos && /usr/local/bin/cmake -E remove FS/*
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/freertos && tcsh -c env\ VSIM_DIR=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /home/nadeen/intelFPGA/20.1/modelsim_ase/bin/vsim\ -c\ -64\ -do\ 'source\ tcl_files/run_spi_pl.tcl\;\ run\ -a\;\ exit'

freertos.vsimc.spi.pl: apps/freertos/CMakeFiles/freertos.vsimc.spi.pl
freertos.vsimc.spi.pl: apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/build.make

.PHONY : freertos.vsimc.spi.pl

# Rule to build all files generated by this target.
apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/build: freertos.vsimc.spi.pl

.PHONY : apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/build

apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/freertos && $(CMAKE_COMMAND) -P CMakeFiles/freertos.vsimc.spi.pl.dir/cmake_clean.cmake
.PHONY : apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/clean

apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/freertos /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/freertos /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/freertos/CMakeFiles/freertos.vsimc.spi.pl.dir/depend

