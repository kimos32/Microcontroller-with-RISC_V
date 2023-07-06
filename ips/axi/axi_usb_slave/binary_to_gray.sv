module binary_to_gray #(
    parameter WIDTH = 5
) (
    input clock,
    input aclr,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

	always @(posedge clock or posedge aclr) begin
		 if (aclr)
			  dout <= 0;
		 else
			  dout <= din ^ (din >> 1);
	end

endmodule
