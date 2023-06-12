module Register_Bank 
#(  parameter MEM_WIDTH = 32,
    parameter MEM_DEPTH = 3  
)
(
    input                        CLK,
    input                        RSTN,
    input        [1:0]           ADDR,


    input        [MEM_WIDTH-1:0] WDATA,
    input                        WRITE,
    input                        ENABLE,

    //input        [MEM_WIDTH-1:0] Result_Fpu,

    output  reg  [MEM_WIDTH-1:0] RDATA,

    output       [MEM_WIDTH-1:0] OP1,
    output       [MEM_WIDTH-1:0] OP2,
    output       [2:0]          OP_select                  
    );

localparam OP1_ADDR=3'b00;
localparam OP2_ADDR=3'b01;
localparam OpSelect_ADDR=3'b010;
//localparam Flag_ADDR=3'b011;
//localparam Result_ADDR=3'b100;


reg [MEM_WIDTH-1:0]   mem [MEM_DEPTH-1:0];


always @(posedge CLK or negedge RSTN) begin
	if (!RSTN) begin
		// reset
		RDATA<=0;
	end
	else if (ENABLE) begin

	    if(WRITE)begin
	    	mem[ADDR] <= WDATA;
	    end

	    else begin
	    	RDATA <= mem[ADDR];
	    end


		
	end
end

/*always@(*)begin

mem[Result_ADDR] = Result_Fpu;

end*/

assign OP1 = mem[OP1_ADDR] ;
assign OP2 = mem[OP2_ADDR] ;
assign OP_select = mem[OpSelect_ADDR][2:0] ;



endmodule 
