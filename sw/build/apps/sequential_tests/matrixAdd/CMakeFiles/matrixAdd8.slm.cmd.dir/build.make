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

# Utility rule file for matrixAdd8.slm.cmd.

# Include the progress variables for this target.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/progress.make

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd: apps/sequential_tests/matrixAdd/matrixAdd8/slm_files/l2_ram.slm


apps/sequential_tests/matrixAdd/matrixAdd8/slm_files/l2_ram.slm: apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.s19
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating matrixAdd8/slm_files/l2_ram.slm"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd/matrixAdd8/slm_files && /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/utils/s19toslm.py ../matrixAdd8.s19
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd/matrixAdd8/slm_files && /usr/local/bin/cmake -E touch l2_ram.slm

apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.s19: apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating matrixAdd8/matrixAdd8.s19"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd/matrixAdd8 && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-objcopy --srec-len 1 --output-target=srec /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf matrixAdd8.s19

matrixAdd8.slm.cmd: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd
matrixAdd8.slm.cmd: apps/sequential_tests/matrixAdd/matrixAdd8/slm_files/l2_ram.slm
matrixAdd8.slm.cmd: apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.s19
matrixAdd8.slm.cmd: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/build.make

.PHONY : matrixAdd8.slm.cmd

# Rule to build all files generated by this target.
apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/build: matrixAdd8.slm.cmd

.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/build

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd && $(CMAKE_COMMAND) -P CMakeFiles/matrixAdd8.slm.cmd.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/clean

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/matrixAdd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.slm.cmd.dir/depend

