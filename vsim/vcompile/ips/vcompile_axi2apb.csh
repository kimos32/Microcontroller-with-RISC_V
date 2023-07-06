#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=axi2apb

##############################################################################
# Check settings
##############################################################################

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif

set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"
set IP_PATH="${IPS_PATH}/axi/axi2apb"
set RTL_PATH="${RTL_PATH}"

##############################################################################
# Preparing library
##############################################################################

echo "${Green}--> Compiling ${IP}... ${NC}"

rm -rf $LIB_PATH

vlib $LIB_PATH
vmap $LIB_NAME $LIB_PATH

##############################################################################
# Compiling RTL
##############################################################################

echo "${Green}Compiling component: ${Brown} axi2apb ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/AXI_2_APB.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/AXI_2_APB_32.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/axi2apb.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/axi2apb32.sv || goto error

vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/bridge.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/AXI_to_APB_bridge.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/concatenator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/deconcatenator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/fifo_top.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/MUXs.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/APB_master.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/rinc_bottom_generator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/fifomem.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/rptr_empty.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/sync_r2w.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/sync_w2r.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/wptr_full.sv || goto error

vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/AXI_RG_READ.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/AXI_RG_WRITE.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/AXI_AG_READ.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/AXI_AG_WRITE.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/Read_FIFO.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/Write_FIFO.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FINAL_BRIDGE/FINAL_AXI_SLAVE_CORE/top_module.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
