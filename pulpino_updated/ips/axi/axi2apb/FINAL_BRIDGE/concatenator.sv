module concatenator#(parameter DATASIZE = 32,   
                     parameter ADDRSIZE = 32,
					 parameter TOP_FIFO_DATA_SIZE = (DATASIZE+ADDRSIZE+4+(DATASIZE/8))
					 )
				
(
// inputs to concatenator from  AXI slave interface
//input  AXI_clk, AXI_rst_n,
input write_valid, 
input [DATASIZE-1:0] write_data,
input [ADDRSIZE-1:0] write_address,
input [(DATASIZE/8)-1:0] write_strobe,
input [2:0] write_pprot,
input [2:0] read_pprot,
input [ADDRSIZE-1:0] read_address,
input read_address_valid,
input read_data_ready,  ////
// inputs to concatenator from FIFOs
input wfull_top,
input wfull_bottom,

/////////
input rempty_bottom,

// outputs from concatenator to AXI slave interface
output write_ready,
output read_address_ready,
// outputs from concatenator to AXI_to_APB_FIFO
output [TOP_FIFO_DATA_SIZE -1 :0]  conc_data,
output winc_top
);
//wire [TOP_FIFO_DATA_SIZE-1 :0] conc_data;
wire [2:0] pprot;
wire [ADDRSIZE-1:0] address; 
wire write_read;
wire [ADDRSIZE-1:0] zero_address;

/*always @ ( posedge AXI_clk or negedge AXI_rst_n  )
begin 
if (!AXI_rst_n)  
  conc_data_reg <= 0 ;
else 
  conc_data_reg <= conc_data ;
end */
assign zero_address = 0;
assign pprot = (write_valid) ? write_pprot : (read_address_valid ? read_pprot : 3'b0);
assign address = (write_valid) ? write_address : (read_address_valid ? read_address : zero_address);
assign write_read = write_valid;

assign read_address_ready = (!wfull_top) & (!write_valid); //prioritizing write transactions
assign write_ready = write_valid & (!wfull_top);         
//assign write_ready =(!wfull_top);        
assign winc_top = (write_valid | read_address_valid) & (!wfull_top) ;
assign conc_data = {write_data , write_strobe, pprot, address, write_read};


/*assign conc_data[0] = write_read;
assign conc_data[ADDRSIZE:1]= address;
assign conc_data[(ADDRSIZE+3):(ADDRSIZE+1)] = pprot;
assign conc_data[(ADDRSIZE+3+(DATASIZE/8)):(ADDRSIZE+4)] = write_strobe;
assign conc_data[(ADDRSIZE+3+(DATASIZE/8)+DATASIZE):(ADDRSIZE+4+(DATASIZE/8))] = write_data; */

endmodule 
	
	

	