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

# Utility rule file for shift_test.links.

# Include the progress variables for this target.
include apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/progress.make

apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links: apps/Arduino_tests/shift_test/modelsim.ini
apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links: apps/Arduino_tests/shift_test/work
apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links: apps/Arduino_tests/shift_test/tcl_files
apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links: apps/Arduino_tests/shift_test/waves


apps/Arduino_tests/shift_test/modelsim.ini:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating modelsim.ini"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/modelsim.ini /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test//modelsim.ini

apps/Arduino_tests/shift_test/work:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating work"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/work /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test//work

apps/Arduino_tests/shift_test/tcl_files:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating tcl_files"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/tcl_files /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test//tcl_files

apps/Arduino_tests/shift_test/waves:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating waves"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/waves /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test//waves

shift_test.links: apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links
shift_test.links: apps/Arduino_tests/shift_test/modelsim.ini
shift_test.links: apps/Arduino_tests/shift_test/work
shift_test.links: apps/Arduino_tests/shift_test/tcl_files
shift_test.links: apps/Arduino_tests/shift_test/waves
shift_test.links: apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/build.make

.PHONY : shift_test.links

# Rule to build all files generated by this target.
apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/build: shift_test.links

.PHONY : apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/build

apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test && $(CMAKE_COMMAND) -P CMakeFiles/shift_test.links.dir/cmake_clean.cmake
.PHONY : apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/clean

apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/Arduino_tests/shift_test /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/Arduino_tests/shift_test/CMakeFiles/shift_test.links.dir/depend

