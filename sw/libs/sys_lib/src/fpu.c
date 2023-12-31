// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include "fpu.h"
#include "pulpino.h"
#include "utils.h"

void fpu_send(const int* num_1, const int* num_2, const int* num_3){

*(volatile unsigned int*)(FPU_REG_OP_A) = *num_1;
*(volatile unsigned int*)(FPU_REG_OP_B) = *num_2;
*(volatile unsigned int*)(FPU_REG_OP_SEL) = *num_3;
};


int fpu_getuint32(){

return *(volatile int*) FPU_REG_RESULT;

};


