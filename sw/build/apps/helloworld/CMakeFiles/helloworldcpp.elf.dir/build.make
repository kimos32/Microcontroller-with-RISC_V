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
include apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/depend.make

# Include the progress variables for this target.
include apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/flags.make

apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.o: apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/flags.make
apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.o: ../apps/helloworld/helloworld.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.o"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.o -c /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/helloworld/helloworld.cpp

apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.i"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/helloworld/helloworld.cpp > CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.i

apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.s"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld && /home/nadeen/ri5cy_gnu_toolchain/install/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/helloworld/helloworld.cpp -o CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.s

# Object files for target helloworldcpp.elf
helloworldcpp_elf_OBJECTS = \
"CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.o"

# External object files for target helloworldcpp.elf
helloworldcpp_elf_EXTERNAL_OBJECTS = \
"/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/helloworldcpp/helloworldcpp.elf: apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/helloworld.cpp.o
apps/helloworldcpp/helloworldcpp.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/helloworldcpp/helloworldcpp.elf: apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/build.make
apps/helloworldcpp/helloworldcpp.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/helloworldcpp/helloworldcpp.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/helloworldcpp/helloworldcpp.elf: libs/bench_lib/libbench.a
apps/helloworldcpp/helloworldcpp.elf: libs/string_lib/libstring.a
apps/helloworldcpp/helloworldcpp.elf: libs/sys_lib/libsys.a
apps/helloworldcpp/helloworldcpp.elf: apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../helloworldcpp/helloworldcpp.elf"
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/helloworldcpp.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/build: apps/helloworldcpp/helloworldcpp.elf

.PHONY : apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/build

apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/clean:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld && $(CMAKE_COMMAND) -P CMakeFiles/helloworldcpp.elf.dir/cmake_clean.cmake
.PHONY : apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/clean

apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/depend:
	cd /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/helloworld /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/helloworld/CMakeFiles/helloworldcpp.elf.dir/depend

