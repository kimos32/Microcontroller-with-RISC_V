
(* altera_attribute = "-name SYNCHRONIZER_IDENTIFICATION OFF" *)
module generic_mlab_dc #(
    parameter WIDTH = 8,
    parameter ADDR_WIDTH = 5
)(
    input rclk,
    input wclk,
    input [WIDTH-1:0] din,
    input [ADDR_WIDTH-1:0] waddr,
    input we,
    input re,
    input [ADDR_WIDTH-1:0] raddr,
    output [WIDTH-1:0] dout
);

	localparam DEPTH = 1 << ADDR_WIDTH;
	(* ramstyle = "mlab" *) reg [WIDTH-1:0] mem[0:DEPTH-1];

	reg [WIDTH-1:0] dout_r;
	always @(posedge wclk) begin
		 if (we)
			  mem[waddr] <= din;
	end
	always @(posedge rclk) begin
		 if (re)
			  dout_r <= mem[raddr];
	end
	assign dout = dout_r;

endmodule