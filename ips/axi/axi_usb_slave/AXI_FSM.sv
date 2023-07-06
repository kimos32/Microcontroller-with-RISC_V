//////////////////////////////////////////////////////////////////////////////////////////  
// This module is responsible of:
// - taking the address and data "in writing operation" from the AXI core
// - send the data from the memory or register file " in reading operation"  to the AXI core and hold it until ready
// - send the adrress in reading operation to the MUX then to be sent to the decoder
// - send the address in writing operation to the FIFO address
// - send the data in writing operation to the FIFO data then to be sent to the selector
//////////////////////////////////////////////////////////////////////////////////////////

/*
   __________________
  |                  |  Read_Address_axi                          _____________
  |                  |  ---------------------------------------->|             |
  |                  |                                           |             |         __________
  |                  |  write_address_axi   _______________      |     MUX     |------->|          |
  |                  |  ------------------>|               |     |             |        | decoder  |
  |     AXI FSM      |                     |  FIFO_address |---->|             |        |__________|
  |                  |                     |_______________|     |_____________|
  |                  |  Write_Data_axi      _______________
  |                  |  ------------------>|               |      _____________
  |__________________|                     |  FIFO_data    |---->|             |
                                           |_______________|     |  selector   |
                                                                 |_____________|
                                                                 
*/
module AXI_FSM #(parameter ADDR_W = 32, parameter Data_W = 32, parameter usb_mem_W = 6)(
//////////////////////////////////////////////////////////////////////////////////////////  
///////////////////////////////////    INPUTS   //////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//_________________________________Slave core inputs______________________________________
input				                Clk, Rst,
input			           	    	R_Valid_Address, 
input                 	 	Read_Ready, 
input [ADDR_W-1:0]	     	Read_Address_axi, 
input [2:0]			          	R_Prot, 

input [ADDR_W-1:0]		    	Write_Address_axi, 
input [2:0]			          	W_Prot, 
input 				               Write_Valid, 
input [Data_W-1:0]		    	Write_Data_axi, 
input [3:0]		     	      Write_Strobe, 

//_________________________________UHCI inputs____________________________________________
input [Data_W-1:0]		    	r_data_mem,
input [7:0]			          	r_data_reg,
input                   	data_reg_toggle,data_mem_toggle,

//_________________________________FIFO inputs___________________________________________
input			                	empty,full,

//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////    OUTPUTS   /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//_________________________________Slave core outputs_____________________________________
output reg        			   	R_Ready_Address, Valid_Data_R, 
output reg			           	R_Error, Write_Ready, W_Error, 
output reg [Data_W-1:0]		Read_Data_axi, 

//_________________________________FIFO signals___________________________________________
output reg 			          	wr_en_fifo_data,wr_en_fifo_address,
output reg [ADDR_W-1:0]		w_address_FIFO,
output reg [Data_W-1:0]		w_data_FIFO,
output reg               clear,

//_________________________________MUX signals_____________________________________________ 
output reg [Data_W-1:0]		R_address_mux,
output reg [1:0]	     			Read_en//mux selector
);

//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////  FSM states  /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
localparam IDLE		            		= 3'b000;
localparam READ_DATA_ADDR_0		 	= 3'b001;
localparam READ_DATA_ADDR_1	 		= 3'b011;
localparam WRITE_DATA_ADDR  			= 3'b010;
localparam WAIT          			= 3'b100;


reg [2:0]       				C_S, N_S;

reg data_reg_toggle1, data_mem_toggle1;
reg mem_reg_select;
reg empty_reg;
reg [Data_W-1:0] Write_Data_axi_1;

////////////////////////////// state transition ///////////////////////////////////////////
always@(posedge Clk or negedge Rst) begin
if(!Rst) begin
	C_S 					<= IDLE;
end
else begin
	C_S 					<= N_S;
end
end 

////////////////////////////// next state logic ///////////////////////////////////////////
always@(*) begin
case(C_S)
IDLE: 		begin
			if (Write_Valid && !full && (Write_Strobe == 4'b1111)) begin 
				N_S 	= WRITE_DATA_ADDR;
			end
			else if (R_Valid_Address && empty) begin
				N_S 	= READ_DATA_ADDR_0;
			end
			else begin
				N_S 	= IDLE;
			end 
		end

// we jump to this state when there is valid read address 
// we jump from this state when there is valid data from memory or register file "when data_toggle flag vary"
READ_DATA_ADDR_0: 	begin
    if ( ((data_reg_toggle1 != data_reg_toggle) || (data_mem_toggle1 != data_mem_toggle))  && Read_Ready)
			  N_S = IDLE;
		else if  ( ((data_reg_toggle1 != data_reg_toggle) || (data_mem_toggle1 != data_mem_toggle))  && !Read_Ready)
			  N_S = READ_DATA_ADDR_1;
		else 
			  N_S = READ_DATA_ADDR_0;
		end

// we jump to this state when AXI core is not ready to catch the data 
// we jump from this state when AXI core is ready	
READ_DATA_ADDR_1: 	begin
    if (Read_Ready)
			  N_S = IDLE;
		else 
			  N_S = READ_DATA_ADDR_1;
		end

// we jump to this state whenever there is a valid write data and address
WRITE_DATA_ADDR: 	begin
			N_S = IDLE;
		end
		
WAIT: 	begin
			N_S = IDLE;
		end

default:
		 N_S = IDLE;
endcase
end
 
//////////////////////////////// output logic ///////////////////////////////////////////
always@(*) begin
			R_Ready_Address  = 1'b0;
			Valid_Data_R	= 1'b0;
			R_Error 	= 1'b0;
			Write_Ready 	= 1'b0;
			W_Error 	= 1'b0;
			Read_Data_axi 	= 'b0;
			R_address_mux	= 1'b0;
			wr_en_fifo_address = 1'b0;
			wr_en_fifo_data    = 1'b0;
			w_address_FIFO   = 'b0;
			Read_en		   = 2'b00;
			w_data_FIFO = 'b0;
			clear       = 1'b0;
case (C_S)
IDLE: 		begin
			Valid_Data_R	= 1'b0;
			R_Error 	= 1'b0;
			W_Error 	= 1'b0;
			Read_Data_axi 	= 'b0;
			R_address_mux	= 1'b0;
			wr_en_fifo_address = 1'b0;
			wr_en_fifo_data	= 1'b0;
			w_address_FIFO	= 'b0;
			clear       = 1'b0;
			
			// if FIFO is empty AXI interface is ready to take new write or read address
			// we clear the FIFO with positive edge of empty flag
			if(empty) begin
			  Read_en		= 2'b00;
				R_Ready_Address = 1'b1;
				Write_Ready 	= 1'b1;
				clear       = ( empty ^ empty_reg)?1'b1:1'b0;
			end
			// if FIFO is not full but not empty "e.g. it has data ", we are ready only to take write address
			else if (!full && !empty) begin
			  Read_en		= 2'b10;
				R_Ready_Address = 1'b0;
				Write_Ready 	= 1'b1;
				clear       = 1'b0;
			end
			// else if FIFO is full, we are not ready to write or read operation
			else begin
			  Read_en		= 2'b10;
				R_Ready_Address = 1'b0;
				Write_Ready 	= 1'b0;
			end
		end

READ_DATA_ADDR_0: 	begin
      Read_en		= 2'b01;
      Valid_Data_R = 1'b0;
      // we send the read address to the mux and the to be decoded and wait for the data
			R_address_mux = Read_Address_axi;
			
			// if it is a reading operation from the register, we wait until the data is valid and then put it in the AXI core data signal
			// data from the register is only 8 bits so we need to concatenate other 24 bits to be total 32 bits "AXI core signal"
			if(mem_reg_select) begin
				if (data_reg_toggle1 != data_reg_toggle) begin
					Read_Data_axi 	= { 24'b0,r_data_reg};
					Valid_Data_R = 1'b1;
				end
			end
			// else if it is reading from the memory, we wait until the data is valid and then put it in the AXI core data signal
			else begin
				if(data_mem_toggle1 != data_mem_toggle) begin
				  Read_Data_axi 	= r_data_mem;
				  Valid_Data_R = 1'b1;
				 end
			  end		
		end

READ_DATA_ADDR_1: 	begin
  Valid_Data_R = 1'b1;
  // we hold the data in the AXI core data signal until it becomes ready to take it
  if(mem_reg_select) begin
    Read_Data_axi 	= { 24'b0,r_data_reg};
  end
  else begin
    Read_Data_axi 	= r_data_mem;
  end
end

// we send the data and address to the FIFOs in the case of writing operation and assret the write enable to FIFOs
// in writing operations data need to be stored in the FIFOs because AXI core clock is faster than the UHCI
// no need for FIFOs in case of reading operation
WRITE_DATA_ADDR: 	begin
      Read_en		= 2'b10;
			Write_Ready = 1'b0;
			R_Ready_Address = 1'b0;
			w_data_FIFO = Write_Data_axi_1;
			wr_en_fifo_data = 1'b1;
			wr_en_fifo_address = 1'b1;
			w_address_FIFO = Write_Address_axi;
		end
WAIT: begin
			R_Ready_Address  = 1'b0;
			Valid_Data_R	= 1'b0;
			R_Error 	= 1'b0;
			Write_Ready 	= 1'b0;
			W_Error 	= 1'b0;
			Read_Data_axi 	= 'b0;
			R_address_mux	= 1'b0;
			wr_en_fifo_address = 1'b0;
			wr_en_fifo_data    = 1'b0;
			w_address_FIFO   = 'b0;
			Read_en		   = 2'b00;
			w_data_FIFO = 'b0;
			clear       = 1'b0;
end
		
default: begin
			R_Ready_Address  = 1'b0;
			Valid_Data_R	= 1'b0;
			R_Error 	= 1'b0;
			Write_Ready 	= 1'b0;
			W_Error 	= 1'b0;
			Read_Data_axi 	= 'b0;
			R_address_mux	= 1'b0;
			wr_en_fifo_address = 1'b0;
			wr_en_fifo_data    = 1'b0;
			w_address_FIFO   = 'b0;
			Read_en		   = 2'b00;
			w_data_FIFO = 'b0;
			clear       = 1'b0;
end

endcase
end

// in this always block, we store the old values of data_reg_toggle , data_mem_toggle 
//                       and empty_reg in order to detect any changes in thi signals
// we also store the value of Read_Address_axi[8] "bit that indicates we are writing or reading from memory or register"
always @(posedge Clk or negedge Rst)
begin
  if (!Rst) begin
                data_reg_toggle1 <= 1'b0;
		data_mem_toggle1 <= 1'b0;
		empty_reg <= 1'b0;
		mem_reg_select   <= 1'b0;
	end
	else begin
	        data_reg_toggle1 <= data_reg_toggle;
		data_mem_toggle1 <= data_mem_toggle;
		empty_reg <= empty;
		mem_reg_select <= Read_Address_axi[10];
	end
end 

always @(posedge Clk or negedge Rst)
begin
if(!Rst)
  Write_Data_axi_1 <= 'b0;
else
  Write_Data_axi_1 <= Write_Data_axi;
end

endmodule 
