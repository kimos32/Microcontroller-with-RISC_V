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

# Utility rule file for perfbench.sha.power.

# Include any custom commands dependencies for this target.
include apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/progress.make

apps/bench/sha/CMakeFiles/perfbench.sha.power:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running perfbench.sha in ModelSim (post layout)"
	cd /home/ahmed98/pulpino/sw/build/apps/bench/sha && /usr/local/bin/cmake -E remove stdout/*
	cd /home/ahmed98/pulpino/sw/build/apps/bench/sha && /usr/local/bin/cmake -E remove FS/*
	cd /home/ahmed98/pulpino/sw/build/apps/bench/sha && tcsh -c env\ VSIM_DIR=/home/ahmed98/pulpino/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /home/ahmed98/intelFPGA/20.1/modelsim_ase/bin/vsim\ \ -64\ -do\ 'source\ tcl_files/run_power.tcl\;'

perfbench.sha.power: apps/bench/sha/CMakeFiles/perfbench.sha.power
perfbench.sha.power: apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/build.make
.PHONY : perfbench.sha.power

# Rule to build all files generated by this target.
apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/build: perfbench.sha.power
.PHONY : apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/build

apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/bench/sha && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.sha.power.dir/cmake_clean.cmake
.PHONY : apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/clean

apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/bench/sha /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/bench/sha /home/ahmed98/pulpino/sw/build/apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/sha/CMakeFiles/perfbench.sha.power.dir/depend

