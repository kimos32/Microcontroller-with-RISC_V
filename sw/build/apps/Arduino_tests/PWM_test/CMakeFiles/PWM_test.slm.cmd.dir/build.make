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

# Utility rule file for PWM_test.slm.cmd.

# Include any custom commands dependencies for this target.
include apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/progress.make

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd: apps/Arduino_tests/PWM_test/slm_files/l2_ram.slm

apps/Arduino_tests/PWM_test/slm_files/l2_ram.slm: apps/Arduino_tests/PWM_test/PWM_test.s19
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating slm_files/l2_ram.slm"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test/slm_files && /home/ahmed98/pulpino/sw/utils/s19toslm.py ../PWM_test.s19
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test/slm_files && /usr/local/bin/cmake -E touch l2_ram.slm

apps/Arduino_tests/PWM_test/PWM_test.s19: apps/Arduino_tests/PWM_test/PWM_test.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating PWM_test.s19"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-objcopy --srec-len 1 --output-target=srec /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test/PWM_test.elf PWM_test.s19

PWM_test.slm.cmd: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd
PWM_test.slm.cmd: apps/Arduino_tests/PWM_test/PWM_test.s19
PWM_test.slm.cmd: apps/Arduino_tests/PWM_test/slm_files/l2_ram.slm
PWM_test.slm.cmd: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/build.make
.PHONY : PWM_test.slm.cmd

# Rule to build all files generated by this target.
apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/build: PWM_test.slm.cmd
.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/build

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test && $(CMAKE_COMMAND) -P CMakeFiles/PWM_test.slm.cmd.dir/cmake_clean.cmake
.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/clean

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/Arduino_tests/PWM_test /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.slm.cmd.dir/depend

