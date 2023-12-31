#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=apb_fpu

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
set IP_PATH="${IPS_PATH}/apb/apb_fpu"
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

echo "${Green}Compiling component: ${Brown} apb_fpu_sv ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/APB_Slave.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/Floating_point_multiplication.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FPU.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/Fpu_add.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/FPU_apb.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/Normalize_add.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}     ${IP_PATH}/Register_bank.sv || goto error


echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
