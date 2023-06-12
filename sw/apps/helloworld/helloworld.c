// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.


#include <stdlib.h> 
#include "fpu.h"
#include "pulpino.h"
#include "utils.h"
#include "fpu.c"



int main() 
{

uint32_t num_1 = 0x40700000;
uint32_t *ptr_num_1 = &num_1;
uint32_t num_2 = 0x40900000;
uint32_t *ptr_num_2 = &num_2;
uint32_t num_3 = 0x00;
uint32_t *ptr_num_3 = &num_3;




// functions
fpu_send (ptr_num_1, ptr_num_2, ptr_num_3);


uint32_t result = fpu_getuint32();


printf("%lu", result);
 


}

