module gray_to_binary #(
    parameter WIDTH = 5
) (
    input clock,
    input aclr,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

	wire [WIDTH-1:0] dout_w;

	genvar i;
	generate
		 for (i = 0; i < WIDTH; i=i+1) begin : loop
			  assign dout_w[i] = ^(din[WIDTH-1:i]);
		 end
	endgenerate

	always @(posedge clock or posedge aclr) begin
		 if (aclr)
			  dout <= 0;
		 else
			  dout <= dout_w;
	end

endmodule

