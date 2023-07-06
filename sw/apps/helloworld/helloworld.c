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
#include "fpu.c"
#include "pulpino.h"
#include "utils.h"
#include <stdio.h>
#include "usb.h"



int main() 
{




int number_1 = 0x40700000;
int *ptr_number_1 = &number_1;
int number_2 = 0x40900000;
int *ptr_number_2 = &number_2;
int number_3 = 0x00;
int *ptr_number_3 = &number_3;

int result;
int *ptr_number_4 = &result;

uint32_t num_1 = 0x40700000;
uint32_t *ptr_num_1 = &num_1;
uint32_t num_2 = 0x40900000;
uint32_t *ptr_num_2 = &num_2;
uint32_t num_3 = 0x00;
uint32_t *ptr_num_3 = &num_3;
uint32_t num_4 = 0x00;
uint32_t *ptr_num_4 = &num_4;
uint32_t arr[8];

uint32_t offset = 0;

///////////////////////////////////////////////////////////////////
////////////////////////test the uart//////////////////////////////
//////////////////////////////////////////////////////////////////

  printf("helloworld \n");



////////////////////////////////////////////////////////////////////////////////////////
//////////////////this code is used to test transactions on FPU////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
fpu_send (ptr_number_1, ptr_number_2, ptr_number_3);
result = fpu_getuint32();


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////USB Test////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

// functions
// usb functions 
num_1 = 0x100;
write_Frame_list(ptr_num_1, offset);

// Bulk out transaction 
// out
//TD 20 

 num_1= 0x181;
num_2= 0x800000;
num_3= 0x40A91E1;
num_4= 0x80;
write_TD(ptr_num_1, ptr_num_2, ptr_num_3 , ptr_num_4 , offset);

arr[0] = 0xB5BC3695;
arr[1] = 0x954BCA35;
arr[2] = 0x35B5BC36;
arr[3] = 0x36954BCA;
arr[4] = 0xCA35B5BC;
arr[5] = 0xBC36954C;
arr[6] = 0x4BCA35B5;
arr[7] = 0xB5BC3695;

write(arr , offset);

usb_start();

while ( *(volatile unsigned int*)(USB_REG_STS) != 0x00000004 ) {};

usb_stop();

while ( *(volatile unsigned int*)(USB_REG_STS) != 0x00000006 ) {};

num_1 = read_status(offset); 


  return 0;
 


}

