
#ifndef _USB_H
#define _USB_H

#include "pulpino.h"
#include <stdint.h>
#include "common_macros.h"

/* USB Address */
#define USB_BASE_ADDR		  0x00020000 

#define USB_REG_BASE_ADDR 	  ( USB_BASE_ADDR + 0x400 )
#define USB_FL_BASE_ADDR  	  ( USB_BASE_ADDR + 0x00  )
#define USB_CRL_MEM       	  ( USB_BASE_ADDR + 0x40  )
#define USB_DATA_BASE_ADDR        ( USB_BASE_ADDR + 0x200 ) 


#define USB_REG_PORT_STATUS       (USB_REG_BASE_ADDR  + 0x00)
#define USB_REG_SOF_MODIFY        (USB_REG_BASE_ADDR  + 0x04)
#define USB_REG_FL_BASE_ADD       (USB_REG_BASE_ADDR  + 0x08)
#define USB_REG_FR_NUM            (USB_REG_BASE_ADDR  + 0x0C)
#define USB_REG_STS               (USB_REG_BASE_ADDR  + 0x10)
#define USB_REG_CMD               (USB_REG_BASE_ADDR  + 0x14)


#define PORT_STATUS 		  REGP(USB_REG_PORT_STATUS)
#define SOF_MODIFY  		  REGP(USB_REG_SOF_MODIFY)
#define FL_BASE_ADD 		  REGP(USB_REG_FL_BASE_ADD)
#define FR_NUM      		  REGP(USB_REG_FR_NUM)
#define STS         		  REGP(USB_REG_STS)
#define CMD         		  REGP(USB_REG_CMD)

#define REG_BASE_ADDR 	          REGP(USB_REG_BASE_ADDR)
#define FL_BASE_ADDR      	  REGP(USB_FL_BASE_ADDR)
#define CRL_MEM           	  REGP(USB_CRL_MEM)
#define DATA_BASE_ADDR    	  REGP(USB_DATA_BASE_ADDR)


#define current_connect_status 1<<0
#define connect_status_change  1<<1
#define port_enabled_disabled  1<<2
#define port_EN_DS_change      1<<3
#define line_state             1<<4
#define port_Reset             1<<6


#define base_address           1<<4


#define host_process_error     1<<0
#define HC_halted              1<<1
#define terminate              1<<2


#define RS                     1<<0
#define CF                     1<<1
#define MAXP                   1<<3


#define active 55
#define stalled 54
#define toggle_error 53
#define babble 52
#define NAK 51
#define crctimeout 50
#define rxerror 49
#define SPerr 48 
#define HSerr 47
#define PIDerr 46

extern unsigned int read_data[8];

void usb_stop();
void usb_start();
void read( unsigned int offset);
unsigned int read_status(unsigned int offset) ;
void write_TD( const uint32_t* num_1, const uint32_t* num_2, const uint32_t* num_3, const uint32_t* num_4, unsigned int offset );
void write_Frame_list( const uint32_t* num_1, unsigned int offset );
void write(uint32_t arr[8] , unsigned int offset);


#endif

