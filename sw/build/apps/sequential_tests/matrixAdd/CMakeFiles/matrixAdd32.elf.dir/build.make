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
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/depend.make

# Include the progress variables for this target.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/flags.make

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.o: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/flags.make
apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.o: ../apps/sequential_tests/matrixAdd/matrixAdd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.o"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.o   -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/matrixAdd/matrixAdd.c

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.i"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/matrixAdd/matrixAdd.c > CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.i

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.s"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/matrixAdd/matrixAdd.c -o CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.s

# Object files for target matrixAdd32.elf
matrixAdd32_elf_OBJECTS = \
"CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.o"

# External object files for target matrixAdd32.elf
matrixAdd32_elf_EXTERNAL_OBJECTS = \
"/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/matrixAdd.c.o
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/build.make
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: libs/bench_lib/libbench.a
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: libs/string_lib/libstring.a
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: libs/sys_lib/libsys.a
apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable matrixAdd32/matrixAdd32.elf"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matrixAdd32.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/build: apps/sequential_tests/matrixAdd/matrixAdd32/matrixAdd32.elf

.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/build

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd && $(CMAKE_COMMAND) -P CMakeFiles/matrixAdd32.elf.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/clean

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/matrixAdd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd32.elf.dir/depend

