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
include apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/depend.make

# Include the progress variables for this target.
include apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/flags.make

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/test_print.c.o: apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/flags.make
apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/test_print.c.o: ../apps/riscv_tests/official/test_print.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/test_print.c.o"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rv_official.elf.dir/test_print.c.o   -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official/test_print.c

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/test_print.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rv_official.elf.dir/test_print.c.i"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official/test_print.c > CMakeFiles/rv_official.elf.dir/test_print.c.i

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/test_print.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rv_official.elf.dir/test_print.c.s"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official/test_print.c -o CMakeFiles/rv_official.elf.dir/test_print.c.s

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/tests.S.o: apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/flags.make
apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/tests.S.o: ../apps/riscv_tests/official/tests.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/tests.S.o"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rv_official.elf.dir/tests.S.o   -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official/tests.S

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/tests.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rv_official.elf.dir/tests.S.i"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official/tests.S > CMakeFiles/rv_official.elf.dir/tests.S.i

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/tests.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rv_official.elf.dir/tests.S.s"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official/tests.S -o CMakeFiles/rv_official.elf.dir/tests.S.s

# Object files for target rv_official.elf
rv_official_elf_OBJECTS = \
"CMakeFiles/rv_official.elf.dir/test_print.c.o" \
"CMakeFiles/rv_official.elf.dir/tests.S.o"

# External object files for target rv_official.elf
rv_official_elf_EXTERNAL_OBJECTS = \
"/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/riscv_tests/official/rv_official.elf: apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/test_print.c.o
apps/riscv_tests/official/rv_official.elf: apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/tests.S.o
apps/riscv_tests/official/rv_official.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/riscv_tests/official/rv_official.elf: apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/build.make
apps/riscv_tests/official/rv_official.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/riscv_tests/official/rv_official.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/riscv_tests/official/rv_official.elf: libs/bench_lib/libbench.a
apps/riscv_tests/official/rv_official.elf: libs/string_lib/libstring.a
apps/riscv_tests/official/rv_official.elf: libs/sys_lib/libsys.a
apps/riscv_tests/official/rv_official.elf: apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable rv_official.elf"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rv_official.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/build: apps/riscv_tests/official/rv_official.elf

.PHONY : apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/build

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official && $(CMAKE_COMMAND) -P CMakeFiles/rv_official.elf.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/clean

apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/riscv_tests/official /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/official/CMakeFiles/rv_official.elf.dir/depend

