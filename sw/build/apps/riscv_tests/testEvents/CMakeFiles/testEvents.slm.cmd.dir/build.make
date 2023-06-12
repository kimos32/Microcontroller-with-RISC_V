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

# Utility rule file for testEvents.slm.cmd.

# Include any custom commands dependencies for this target.
include apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/progress.make

apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd: apps/riscv_tests/testEvents/slm_files/l2_ram.slm

apps/riscv_tests/testEvents/slm_files/l2_ram.slm: apps/riscv_tests/testEvents/testEvents.s19
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating slm_files/l2_ram.slm"
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents/slm_files && /home/ahmed98/pulpino/sw/utils/s19toslm.py ../testEvents.s19
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents/slm_files && /usr/local/bin/cmake -E touch l2_ram.slm

apps/riscv_tests/testEvents/testEvents.s19: apps/riscv_tests/testEvents/testEvents.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating testEvents.s19"
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-objcopy --srec-len 1 --output-target=srec /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents/testEvents.elf testEvents.s19

testEvents.slm.cmd: apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd
testEvents.slm.cmd: apps/riscv_tests/testEvents/slm_files/l2_ram.slm
testEvents.slm.cmd: apps/riscv_tests/testEvents/testEvents.s19
testEvents.slm.cmd: apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/build.make
.PHONY : testEvents.slm.cmd

# Rule to build all files generated by this target.
apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/build: testEvents.slm.cmd
.PHONY : apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/build

apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents && $(CMAKE_COMMAND) -P CMakeFiles/testEvents.slm.cmd.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/clean

apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/riscv_tests/testEvents /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents /home/ahmed98/pulpino/sw/build/apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/testEvents/CMakeFiles/testEvents.slm.cmd.dir/depend

