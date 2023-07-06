module synchronizer_ff_r2 #(
    parameter WIDTH = 8
)(
    input din_clk,
    input [WIDTH-1:0] din,
    input dout_clk,
    output [WIDTH-1:0] dout
);

	reg [WIDTH-1:0] ff_launch = {WIDTH {1'b0}} 
    /* synthesis preserve dont_replicate */;
	always @(posedge din_clk) begin
		 ff_launch <= din;
	end

	reg [WIDTH-1:0] ff_meta = {WIDTH {1'b0}} 
    /* synthesis preserve dont_replicate */;
	always @(posedge dout_clk) begin
		 ff_meta <= ff_launch;
	end

	reg [WIDTH-1:0] ff_sync = {WIDTH {1'b0}} 
   /* synthesis preserve dont_replicate */;
	always @(posedge dout_clk) begin
		 ff_sync <= ff_meta;
	end

	assign dout = ff_sync;
endmodule
