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

# Utility rule file for boot_code.links.

# Include the progress variables for this target.
include apps/boot_code/CMakeFiles/boot_code.links.dir/progress.make

apps/boot_code/CMakeFiles/boot_code.links: apps/boot_code/modelsim.ini
apps/boot_code/CMakeFiles/boot_code.links: apps/boot_code/work
apps/boot_code/CMakeFiles/boot_code.links: apps/boot_code/tcl_files
apps/boot_code/CMakeFiles/boot_code.links: apps/boot_code/waves


apps/boot_code/modelsim.ini:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating modelsim.ini"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/modelsim.ini /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code//modelsim.ini

apps/boot_code/work:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating work"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/work /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code//work

apps/boot_code/tcl_files:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating tcl_files"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/tcl_files /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code//tcl_files

apps/boot_code/waves:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating waves"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code && /usr/local/bin/cmake -E create_symlink /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim/waves /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code//waves

boot_code.links: apps/boot_code/CMakeFiles/boot_code.links
boot_code.links: apps/boot_code/modelsim.ini
boot_code.links: apps/boot_code/work
boot_code.links: apps/boot_code/tcl_files
boot_code.links: apps/boot_code/waves
boot_code.links: apps/boot_code/CMakeFiles/boot_code.links.dir/build.make

.PHONY : boot_code.links

# Rule to build all files generated by this target.
apps/boot_code/CMakeFiles/boot_code.links.dir/build: boot_code.links

.PHONY : apps/boot_code/CMakeFiles/boot_code.links.dir/build

apps/boot_code/CMakeFiles/boot_code.links.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code && $(CMAKE_COMMAND) -P CMakeFiles/boot_code.links.dir/cmake_clean.cmake
.PHONY : apps/boot_code/CMakeFiles/boot_code.links.dir/clean

apps/boot_code/CMakeFiles/boot_code.links.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/boot_code /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/boot_code/CMakeFiles/boot_code.links.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/boot_code/CMakeFiles/boot_code.links.dir/depend

