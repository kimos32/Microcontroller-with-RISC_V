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

# Include any dependencies generated for this target.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/flags.make

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.o: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/flags.make
apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.o: /home/ahmed98/pulpino/sw/apps/sequential_tests/motion_detection/motion_detection.c
apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.o: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.o"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.o -MF CMakeFiles/motion_detection.elf.dir/motion_detection.c.o.d -o CMakeFiles/motion_detection.elf.dir/motion_detection.c.o -c /home/ahmed98/pulpino/sw/apps/sequential_tests/motion_detection/motion_detection.c

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/motion_detection.elf.dir/motion_detection.c.i"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ahmed98/pulpino/sw/apps/sequential_tests/motion_detection/motion_detection.c > CMakeFiles/motion_detection.elf.dir/motion_detection.c.i

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/motion_detection.elf.dir/motion_detection.c.s"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ahmed98/pulpino/sw/apps/sequential_tests/motion_detection/motion_detection.c -o CMakeFiles/motion_detection.elf.dir/motion_detection.c.s

# Object files for target motion_detection.elf
motion_detection_elf_OBJECTS = \
"CMakeFiles/motion_detection.elf.dir/motion_detection.c.o"

# External object files for target motion_detection.elf
motion_detection_elf_EXTERNAL_OBJECTS = \
"/home/ahmed98/pulpino/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/sequential_tests/motion_detection/motion_detection.elf: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/motion_detection.c.o
apps/sequential_tests/motion_detection/motion_detection.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/sequential_tests/motion_detection/motion_detection.elf: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/build.make
apps/sequential_tests/motion_detection/motion_detection.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/sequential_tests/motion_detection/motion_detection.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/sequential_tests/motion_detection/motion_detection.elf: libs/bench_lib/libbench.a
apps/sequential_tests/motion_detection/motion_detection.elf: libs/string_lib/libstring.a
apps/sequential_tests/motion_detection/motion_detection.elf: libs/sys_lib/libsys.a
apps/sequential_tests/motion_detection/motion_detection.elf: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable motion_detection.elf"
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/motion_detection.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/build: apps/sequential_tests/motion_detection/motion_detection.elf
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/build

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection && $(CMAKE_COMMAND) -P CMakeFiles/motion_detection.elf.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/clean

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/sequential_tests/motion_detection /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection /home/ahmed98/pulpino/sw/build/apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.elf.dir/depend

