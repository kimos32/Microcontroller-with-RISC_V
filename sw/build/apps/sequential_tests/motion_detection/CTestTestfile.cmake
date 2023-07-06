# CMake generated Testfile for 
# Source directory: /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/motion_detection
# Build directory: /home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/motion_detection
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(motion_detection.test "tcsh" "-c" "env VSIM_DIR=/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/vsim USE_ZERO_RISCY=0 RISCY_RV32F=0 ZERO_RV32M=0 ZERO_RV32E=0 PL_NETLIST= TB_TEST=\"\" /home/nadeen/intelFPGA/20.1/modelsim_ase/bin/vsim  -c -64 -do 'source tcl_files/run.tcl; run_and_exit;'")
set_tests_properties(motion_detection.test PROPERTIES  LABELS "sequential_tests" WORKING_DIRECTORY "/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/build/apps/sequential_tests/motion_detection/" _BACKTRACE_TRIPLES "/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/CMakeSim.txt;245;add_test;/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/CMakeLists.txt;106;add_sim_targets;/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/motion_detection/CMakeLists.txt;2;add_application;/home/nadeen/Documents/home/ahmed98/pulpino_nadeen/sw/apps/sequential_tests/motion_detection/CMakeLists.txt;0;")
