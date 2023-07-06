module deconcatenator#(parameter DATASIZE = 32,   
                       parameter ADDRSIZE = 32,
					   parameter TOP_FIFO_DATA_SIZE = (DATASIZE+ADDRSIZE+4+(DATASIZE/8))) 
(
input [TOP_FIFO_DATA_SIZE-1:0] conc_data_fifo,
input rempty,
// outputs from deconcatenator to APB master
output transfer,
output [ADDRSIZE-1:0] addr,
output [DATASIZE-1:0] wdata,
output [(DATASIZE/8)-1:0] strb,
output [2:0] pprot,
output write_read
);

assign transfer = (!rempty);
assign write_read = conc_data_fifo[0];
assign addr = (rempty)? 32'b0 : conc_data_fifo[ADDRSIZE:1]; 
assign pprot = (rempty)? 3'b0 : conc_data_fifo[(ADDRSIZE+3):(ADDRSIZE+1)];
assign strb = (rempty)? 4'b0 : conc_data_fifo[(ADDRSIZE+3+(DATASIZE/8)):(ADDRSIZE+4)];
assign wdata = (rempty)? 32'b0 : conc_data_fifo[(ADDRSIZE+3+(DATASIZE/8)+DATASIZE):(ADDRSIZE+4+(DATASIZE/8))];

endmodule