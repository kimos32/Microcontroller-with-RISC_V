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
include apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/depend.make

# Include the progress variables for this target.
include apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/flags.make

apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/fibonacci.c.o: apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/flags.make
apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/fibonacci.c.o: ../apps/sequential_tests/fibonacci/fibonacci.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/fibonacci.c.o"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fibonacci.elf.dir/fibonacci.c.o   -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/fibonacci/fibonacci.c

apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/fibonacci.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fibonacci.elf.dir/fibonacci.c.i"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/fibonacci/fibonacci.c > CMakeFiles/fibonacci.elf.dir/fibonacci.c.i

apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/fibonacci.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fibonacci.elf.dir/fibonacci.c.s"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/fibonacci/fibonacci.c -o CMakeFiles/fibonacci.elf.dir/fibonacci.c.s

# Object files for target fibonacci.elf
fibonacci_elf_OBJECTS = \
"CMakeFiles/fibonacci.elf.dir/fibonacci.c.o"

# External object files for target fibonacci.elf
fibonacci_elf_EXTERNAL_OBJECTS = \
"/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/sequential_tests/fibonacci/fibonacci.elf: apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/fibonacci.c.o
apps/sequential_tests/fibonacci/fibonacci.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/sequential_tests/fibonacci/fibonacci.elf: apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/build.make
apps/sequential_tests/fibonacci/fibonacci.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/sequential_tests/fibonacci/fibonacci.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/sequential_tests/fibonacci/fibonacci.elf: libs/bench_lib/libbench.a
apps/sequential_tests/fibonacci/fibonacci.elf: libs/string_lib/libstring.a
apps/sequential_tests/fibonacci/fibonacci.elf: libs/sys_lib/libsys.a
apps/sequential_tests/fibonacci/fibonacci.elf: apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fibonacci.elf"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fibonacci.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/build: apps/sequential_tests/fibonacci/fibonacci.elf

.PHONY : apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/build

apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci && $(CMAKE_COMMAND) -P CMakeFiles/fibonacci.elf.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/clean

apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/fibonacci /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/fibonacci/CMakeFiles/fibonacci.elf.dir/depend

