
// Dual-Port BRAM with Byte Write/read EnaBle
// 1kB
//_____________________________Size Calculation Details_____________________________________// 
// Assumption 16 TD, 16 Frame , 32Byte Max. packet size
// 16 TD each one is 16Byte >> 16*16B
// 16 Frame each one is 32Bits >> 16 memory location
// two memory location for each TD data >>32
// Total size = 64*16Bytes = 1KByte
//_______________________________________Port A_____________________________________________// 

// connected to UHCI with clock 12MHz
// double word write enable using 4 bits write enable 
// w_A  0000 read all DWords
// w_A  0001 write first DWord
// w_A  0010 write seconed DWord
// w_A  0100 write third DWord
// w_A  1000 write fourth DWord
// w_A  1111 write all DWords
//_______________________________________Port B_____________________________________________// 

// connected to AXI slave 
// double word write enable using 4 bits write enable 
// w_B  0001 write first DWord
// w_B  0010 write seconed DWord
// w_B  0100 write third DWord
// w_B  1000 write fourth DWord
// double word read enable using 4 bits read enable 
// r_B  0001 read first DWord
// r_B  0010 read second DWord
// r_B  0100 read third DWord
// r_B  1000 read fourth DWord


module true_dual_port_ram_single_clock
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input      [(DATA_WIDTH-1):0] data_a, data_b,
	input      [(ADDR_WIDTH-1):0] addr_a, addr_b,
	input                         we_a, we_b, clk,
	output reg [(DATA_WIDTH-1):0] q_a, q_b
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	// Port A 
	always @ (posedge clk)
	begin
		if (we_a) 
		begin
			ram[addr_a] = data_a;
		end
		q_a <= ram[addr_a];
	end 

	// Port B 
	always @ (posedge clk)
	begin
		if (we_b) 
		begin
			ram[addr_b] = data_b;
		end
		q_b <= ram[addr_b];
	end

endmodule

