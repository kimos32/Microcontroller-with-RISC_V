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

# Include any dependencies generated for this target.
include CMakeFiles/crt0.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/crt0.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/crt0.dir/flags.make

CMakeFiles/crt0.dir/ref/crt0.riscv.S.o: CMakeFiles/crt0.dir/flags.make
CMakeFiles/crt0.dir/ref/crt0.riscv.S.o: ../ref/crt0.riscv.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"
	/home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/crt0.dir/ref/crt0.riscv.S.o   -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/ref/crt0.riscv.S

CMakeFiles/crt0.dir/ref/crt0.riscv.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/crt0.dir/ref/crt0.riscv.S.i"
	/home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/ref/crt0.riscv.S > CMakeFiles/crt0.dir/ref/crt0.riscv.S.i

CMakeFiles/crt0.dir/ref/crt0.riscv.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/crt0.dir/ref/crt0.riscv.S.s"
	/home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/ref/crt0.riscv.S -o CMakeFiles/crt0.dir/ref/crt0.riscv.S.s

crt0: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
crt0: CMakeFiles/crt0.dir/build.make

.PHONY : crt0

# Rule to build all files generated by this target.
CMakeFiles/crt0.dir/build: crt0

.PHONY : CMakeFiles/crt0.dir/build

CMakeFiles/crt0.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/crt0.dir/cmake_clean.cmake
.PHONY : CMakeFiles/crt0.dir/clean

CMakeFiles/crt0.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles/crt0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/crt0.dir/depend

