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
include apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/depend.make

# Include the progress variables for this target.
include apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/flags.make

apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/testVecArith.c.o: apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/flags.make
apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/testVecArith.c.o: ../apps/riscv_tests/testVecArith/testVecArith.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/testVecArith.c.o"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testVecArith.elf.dir/testVecArith.c.o   -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/testVecArith/testVecArith.c

apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/testVecArith.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testVecArith.elf.dir/testVecArith.c.i"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/testVecArith/testVecArith.c > CMakeFiles/testVecArith.elf.dir/testVecArith.c.i

apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/testVecArith.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testVecArith.elf.dir/testVecArith.c.s"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/testVecArith/testVecArith.c -o CMakeFiles/testVecArith.elf.dir/testVecArith.c.s

# Object files for target testVecArith.elf
testVecArith_elf_OBJECTS = \
"CMakeFiles/testVecArith.elf.dir/testVecArith.c.o"

# External object files for target testVecArith.elf
testVecArith_elf_EXTERNAL_OBJECTS = \
"/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/riscv_tests/testVecArith/testVecArith.elf: apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/testVecArith.c.o
apps/riscv_tests/testVecArith/testVecArith.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/riscv_tests/testVecArith/testVecArith.elf: apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/build.make
apps/riscv_tests/testVecArith/testVecArith.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/riscv_tests/testVecArith/testVecArith.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/riscv_tests/testVecArith/testVecArith.elf: libs/bench_lib/libbench.a
apps/riscv_tests/testVecArith/testVecArith.elf: libs/string_lib/libstring.a
apps/riscv_tests/testVecArith/testVecArith.elf: libs/sys_lib/libsys.a
apps/riscv_tests/testVecArith/testVecArith.elf: apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable testVecArith.elf"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testVecArith.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/build: apps/riscv_tests/testVecArith/testVecArith.elf

.PHONY : apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/build

apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith && $(CMAKE_COMMAND) -P CMakeFiles/testVecArith.elf.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/clean

apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/testVecArith /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/testVecArith/CMakeFiles/testVecArith.elf.dir/depend

