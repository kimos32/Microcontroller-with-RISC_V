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

# Utility rule file for boot_code.install.

# Include any custom commands dependencies for this target.
include apps/boot_code/CMakeFiles/boot_code.install.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/boot_code/CMakeFiles/boot_code.install.dir/progress.make

apps/boot_code/CMakeFiles/boot_code.install: apps/boot_code/boot/boot_code.sv
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Copying boot code..."
	cd /home/ahmed98/pulpino/sw/build/apps/boot_code && cp boot/boot_code.sv /home/ahmed98/pulpino/sw/../rtl/

apps/boot_code/boot/boot_code.sv: apps/boot_code/boot_code.s19
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating boot/boot_code.sv"
	cd /home/ahmed98/pulpino/sw/build/apps/boot_code/boot && /home/ahmed98/pulpino/sw/utils/s19toboot.py ../boot_code.s19

apps/boot_code/boot_code.s19: apps/boot_code/boot_code.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating boot_code.s19"
	cd /home/ahmed98/pulpino/sw/build/apps/boot_code && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-objcopy --srec-len 1 --output-target=srec /home/ahmed98/pulpino/sw/build/apps/boot_code/boot_code.elf boot_code.s19

boot_code.install: apps/boot_code/CMakeFiles/boot_code.install
boot_code.install: apps/boot_code/boot/boot_code.sv
boot_code.install: apps/boot_code/boot_code.s19
boot_code.install: apps/boot_code/CMakeFiles/boot_code.install.dir/build.make
.PHONY : boot_code.install

# Rule to build all files generated by this target.
apps/boot_code/CMakeFiles/boot_code.install.dir/build: boot_code.install
.PHONY : apps/boot_code/CMakeFiles/boot_code.install.dir/build

apps/boot_code/CMakeFiles/boot_code.install.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/boot_code && $(CMAKE_COMMAND) -P CMakeFiles/boot_code.install.dir/cmake_clean.cmake
.PHONY : apps/boot_code/CMakeFiles/boot_code.install.dir/clean

apps/boot_code/CMakeFiles/boot_code.install.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/boot_code /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/boot_code /home/ahmed98/pulpino/sw/build/apps/boot_code/CMakeFiles/boot_code.install.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/boot_code/CMakeFiles/boot_code.install.dir/depend

