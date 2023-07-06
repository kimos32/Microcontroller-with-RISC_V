//////////////////////////////////////////////////////////////////////////////////////////  
// This module is responsible of sending the address to the decoder depending on the current operation "Read_en"
// - if Read_en = 01 -----> this is reading operation from UHCI so the output from mux is the input from the FSM
// - if Read_en = 10 -----> this is writing operation to UHCI so the output from muc is the input from the FIFO
//////////////////////////////////////////////////////////////////////////////////////////

module MUX (
input wire	[1:0]  Read_en, 
input wire        empty,
input wire [31:0]	R_address, W_address,
output reg [31:0]	address_mux_o
);
always@(*) begin
if( Read_en == 2'b01 ) begin 
	address_mux_o = R_address;
end
else if (Read_en == 2'b10) begin 
	address_mux_o = W_address;
end
else 
  address_mux_o = 32'b0;
end
endmodule

