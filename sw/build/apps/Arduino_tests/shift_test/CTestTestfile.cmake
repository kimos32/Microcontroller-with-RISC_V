# CMake generated Testfile for 
# Source directory: /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/Arduino_tests/shift_test
# Build directory: /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(shift_test.test "tcsh" "-c" "env VSIM_DIR=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim USE_ZERO_RISCY=0 RISCY_RV32F=0 ZERO_RV32M=0 ZERO_RV32E=0 PL_NETLIST= TB_TEST=\"ARDUINO_SHIFT\" /home/nadeen/intelFPGA/20.1/modelsim_ase/bin/vsim  -c -64 -do 'source tcl_files/run.tcl; run_and_exit;'")
set_tests_properties(shift_test.test PROPERTIES  LABELS "arduino" WORKING_DIRECTORY "/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/Arduino_tests/shift_test/" _BACKTRACE_TRIPLES "/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/CMakeSim.txt;245;add_test;/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/CMakeLists.txt;106;add_sim_targets;/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/Arduino_tests/shift_test/CMakeLists.txt;1;add_application;/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/Arduino_tests/shift_test/CMakeLists.txt;0;")
