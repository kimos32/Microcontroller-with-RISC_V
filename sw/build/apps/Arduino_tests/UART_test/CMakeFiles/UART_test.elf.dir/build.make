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
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/flags.make

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.o: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/flags.make
apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.o: /home/ahmed98/pulpino/sw/apps/Arduino_tests/UART_test/UART_test.cpp
apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.o: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.o"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.o -MF CMakeFiles/UART_test.elf.dir/UART_test.cpp.o.d -o CMakeFiles/UART_test.elf.dir/UART_test.cpp.o -c /home/ahmed98/pulpino/sw/apps/Arduino_tests/UART_test/UART_test.cpp

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UART_test.elf.dir/UART_test.cpp.i"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmed98/pulpino/sw/apps/Arduino_tests/UART_test/UART_test.cpp > CMakeFiles/UART_test.elf.dir/UART_test.cpp.i

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UART_test.elf.dir/UART_test.cpp.s"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && /home/ahmed98/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmed98/pulpino/sw/apps/Arduino_tests/UART_test/UART_test.cpp -o CMakeFiles/UART_test.elf.dir/UART_test.cpp.s

# Object files for target UART_test.elf
UART_test_elf_OBJECTS = \
"CMakeFiles/UART_test.elf.dir/UART_test.cpp.o"

# External object files for target UART_test.elf
UART_test_elf_EXTERNAL_OBJECTS = \
"/home/ahmed98/pulpino/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/Arduino_tests/UART_test/UART_test.elf: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/UART_test.cpp.o
apps/Arduino_tests/UART_test/UART_test.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/Arduino_tests/UART_test/UART_test.elf: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/build.make
apps/Arduino_tests/UART_test/UART_test.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/Arduino_tests/UART_test/UART_test.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/Arduino_tests/UART_test/UART_test.elf: libs/bench_lib/libbench.a
apps/Arduino_tests/UART_test/UART_test.elf: libs/string_lib/libstring.a
apps/Arduino_tests/UART_test/UART_test.elf: libs/sys_lib/libsys.a
apps/Arduino_tests/UART_test/UART_test.elf: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ahmed98/pulpino/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UART_test.elf"
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UART_test.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/build: apps/Arduino_tests/UART_test/UART_test.elf
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/build

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/clean:
	cd /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test && $(CMAKE_COMMAND) -P CMakeFiles/UART_test.elf.dir/cmake_clean.cmake
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/clean

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/depend:
	cd /home/ahmed98/pulpino/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmed98/pulpino/sw /home/ahmed98/pulpino/sw/apps/Arduino_tests/UART_test /home/ahmed98/pulpino/sw/build /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test /home/ahmed98/pulpino/sw/build/apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.elf.dir/depend

