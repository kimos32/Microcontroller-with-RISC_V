#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=axi_node

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
set IP_PATH="${IPS_PATH}/axi/axi_node"
set RTL_PATH="${RTL_PATH}"

echo "IP_PATH is = ${IP_PATH}"
echo "IPS_PATH is = ${IPS_PATH}"
echo "PULP_PATH is = ${PULP_PATH}"



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

echo "${Green}Compiling component: ${Brown} axi_node ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/AR_crossbar.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/AR_ID_generator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/AW_crossbar.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/AXI_interconnect.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/Bchannel_interconnect.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/B_crossbar.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/BIDs_trans_counter.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/B_order_inter_cont.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/B_round_robin_arbiter.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/fifo_controller.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/mux_for_valid_ready.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/Rchannel_interconnect.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/R_crossbar.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/RIDs_trans_counter.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/R_order_inter_cont.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/R_round_robin_arbiter.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/synch_fifo.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/W_crossbar.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/w_id_generator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/write_channel_delayer.sv || goto error
#vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_RR_Flag_Req.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
