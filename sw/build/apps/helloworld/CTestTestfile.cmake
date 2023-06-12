# CMake generated Testfile for 
# Source directory: /home/ahmed98/pulpino/sw/apps/helloworld
# Build directory: /home/ahmed98/pulpino/sw/build/apps/helloworld
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(helloworld.test "tcsh" "-c" "env VSIM_DIR=/home/ahmed98/pulpino/vsim USE_ZERO_RISCY=0 RISCY_RV32F=0 ZERO_RV32M=0 ZERO_RV32E=0 PL_NETLIST= TB_TEST=\"\" /home/ahmed98/intelFPGA/20.1/modelsim_ase/bin/vsim  -c -64 -do 'source tcl_files/run.tcl; run_and_exit;'")
set_tests_properties(helloworld.test PROPERTIES  WORKING_DIRECTORY "/home/ahmed98/pulpino/sw/build/apps/helloworld/" _BACKTRACE_TRIPLES "/home/ahmed98/pulpino/sw/apps/CMakeSim.txt;235;add_test;/home/ahmed98/pulpino/sw/apps/CMakeLists.txt;106;add_sim_targets;/home/ahmed98/pulpino/sw/apps/helloworld/CMakeLists.txt;1;add_application;/home/ahmed98/pulpino/sw/apps/helloworld/CMakeLists.txt;0;")
add_test(helloworldcpp.test "tcsh" "-c" "env VSIM_DIR=/home/ahmed98/pulpino/vsim USE_ZERO_RISCY=0 RISCY_RV32F=0 ZERO_RV32M=0 ZERO_RV32E=0 PL_NETLIST= TB_TEST=\"\" /home/ahmed98/intelFPGA/20.1/modelsim_ase/bin/vsim  -c -64 -do 'source tcl_files/run.tcl; run_and_exit;'")
set_tests_properties(helloworldcpp.test PROPERTIES  WORKING_DIRECTORY "/home/ahmed98/pulpino/sw/build/apps/helloworld/../helloworldcpp" _BACKTRACE_TRIPLES "/home/ahmed98/pulpino/sw/apps/CMakeSim.txt;235;add_test;/home/ahmed98/pulpino/sw/apps/CMakeLists.txt;106;add_sim_targets;/home/ahmed98/pulpino/sw/apps/helloworld/CMakeLists.txt;3;add_application;/home/ahmed98/pulpino/sw/apps/helloworld/CMakeLists.txt;0;")
