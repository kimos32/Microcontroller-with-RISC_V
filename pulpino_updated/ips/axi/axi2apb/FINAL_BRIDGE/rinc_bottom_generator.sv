module rinc_bottom_generator (
input   AXI_clk,
input 	read_data_ready,
input 	rempty_bottom,
output	rinc_bottom
//output reg read_data_valid
 );
 
 reg rinc_bottom_reg;
 
 always @ ( posedge AXI_clk )
begin 
// read_data_valid <= (!rempty_bottom); 
  
if (read_data_ready )
	rinc_bottom_reg <= 1;
else
	rinc_bottom_reg <= 0;	
end

assign rinc_bottom =  rinc_bottom_reg & (!rempty_bottom);

endmodule
