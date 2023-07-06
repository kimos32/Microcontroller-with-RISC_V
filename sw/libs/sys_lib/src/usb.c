#include "usb.h"
#include "pulpino.h"

unsigned int read_data[8];

void usb_stop()
{
	*(volatile unsigned int*)(USB_REG_CMD ) = 0x00000000;
	//CLEAR_BIT((*CMD),RS);
}

void usb_start()
{
  *(volatile unsigned int*)(USB_REG_STS ) = 0x00000002;
  *(volatile unsigned int*)(USB_REG_CMD ) = 0x00000001;
 //CLEAR_BIT((*STS),host_process_error);
 //SET_BIT((*CMD),RS);
 

}


void read( unsigned int offset)
{
	for (int i = 0; i<8; i++)
	{
		read_data[i] = *(DATA_BASE_ADDR + offset + i);
	}
}

unsigned int read_status(unsigned int offset)
{
	return (*(volatile unsigned int*)(USB_CRL_MEM + offset + 4));
}

void write_TD( const uint32_t* num_1, const uint32_t* num_2, const uint32_t* num_3, const uint32_t* num_4, unsigned int offset )
{
	*(volatile unsigned int*)(USB_CRL_MEM + offset)      = *num_1;
        *(volatile unsigned int*)(USB_CRL_MEM + offset + 4)  = *num_2;
        *(volatile unsigned int*)(USB_CRL_MEM + offset + 8)  = *num_3;
        *(volatile unsigned int*)(USB_CRL_MEM + offset + 12) = *num_4;
}

void write_Frame_list( const uint32_t* num_1, unsigned int offset )
{
	*(volatile unsigned int*)(USB_BASE_ADDR + offset)  = *num_1;

}

void write(uint32_t arr[8] , unsigned int offset)
{
        *(volatile unsigned int*)(DATA_BASE_ADDR + offset )     = arr[0];
        *(volatile unsigned int*)(DATA_BASE_ADDR + offset + 1)  = arr[1];
	*(volatile unsigned int*)(DATA_BASE_ADDR + offset + 2)  = arr[2];
	*(volatile unsigned int*)(DATA_BASE_ADDR + offset + 3)  = arr[3];
	*(volatile unsigned int*)(DATA_BASE_ADDR + offset + 4)  = arr[4];
	*(volatile unsigned int*)(DATA_BASE_ADDR + offset + 5)  = arr[5];
	*(volatile unsigned int*)(DATA_BASE_ADDR + offset + 6)  = arr[6];
	*(volatile unsigned int*)(DATA_BASE_ADDR + offset + 7)  = arr[7];
}

