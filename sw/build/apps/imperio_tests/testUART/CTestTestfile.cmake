# CMake generated Testfile for 
# Source directory: /home/ahmed98/pulpino/sw/apps/imperio_tests/testUART
# Build directory: /home/ahmed98/pulpino/sw/build/apps/imperio_tests/testUART
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(testUART.test "tcsh" "-c" "env VSIM_DIR=/home/ahmed98/pulpino/vsim USE_ZERO_RISCY=0 RISCY_RV32F=0 ZERO_RV32M=0 ZERO_RV32E=0 PL_NETLIST= TB_TEST=\"\" /home/ahmed98/intelFPGA/20.1/modelsim_ase/bin/vsim  -c -64 -do 'source tcl_files/run.tcl; run_and_exit;'")
set_tests_properties(testUART.test PROPERTIES  LABELS "imperio_tests" WORKING_DIRECTORY "/home/ahmed98/pulpino/sw/build/apps/imperio_tests/testUART/" _BACKTRACE_TRIPLES "/home/ahmed98/pulpino/sw/apps/CMakeSim.txt;235;add_test;/home/ahmed98/pulpino/sw/apps/CMakeLists.txt;106;add_sim_targets;/home/ahmed98/pulpino/sw/apps/imperio_tests/testUART/CMakeLists.txt;1;add_application;/home/ahmed98/pulpino/sw/apps/imperio_tests/testUART/CMakeLists.txt;0;")
