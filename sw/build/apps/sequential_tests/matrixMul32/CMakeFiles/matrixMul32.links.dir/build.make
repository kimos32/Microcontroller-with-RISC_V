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

# Utility rule file for matrixMul32.links.

# Include any custom commands dependencies for this target.
include apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/progress.make

apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links: apps/sequential_tests/matrixMul32/modelsim.ini
apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links: apps/sequential_tests/matrixMul32/work
apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links: apps/sequential_tests/matrixMul32/tcl_files
apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links: apps/sequential_tests/matrixMul32/waves

apps/sequential_tests/matrixMul32/modelsim.ini:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating modelsim.ini"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32 && /usr/local/bin/cmake -E create_symlink /home/ahmed98/pulpino/vsim/modelsim.ini /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32//modelsim.ini

apps/sequential_tests/matrixMul32/tcl_files:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating tcl_files"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32 && /usr/local/bin/cmake -E create_symlink /home/ahmed98/pulpino/vsim/tcl_files /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32//tcl_files

apps/sequential_tests/matrixMul32/waves:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating waves"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32 && /usr/local/bin/cmake -E create_symlink /home/ahmed98/pulpino/vsim/waves /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32//waves

apps/sequential_tests/matrixMul32/work:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating work"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32 && /usr/local/bin/cmake -E create_symlink /home/ahmed98/pulpino/vsim/work /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32//work

matrixMul32.links: apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links
matrixMul32.links: apps/sequential_tests/matrixMul32/modelsim.ini
matrixMul32.links: apps/sequential_tests/matrixMul32/tcl_files
matrixMul32.links: apps/sequential_tests/matrixMul32/waves
matrixMul32.links: apps/sequential_tests/matrixMul32/work
matrixMul32.links: apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/build.make
.PHONY : matrixMul32.links

# Rule to build all files generated by this target.
apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/build: matrixMul32.links
.PHONY : apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/build

apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32 && $(CMAKE_COMMAND) -P CMakeFiles/matrixMul32.links.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/clean

apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/sequential_tests/matrixMul32 /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32 /home/ahmed98/pulpino/sw/build/apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/matrixMul32/CMakeFiles/matrixMul32.links.dir/depend

