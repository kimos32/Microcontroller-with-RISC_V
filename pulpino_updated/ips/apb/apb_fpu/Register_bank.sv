module Register_Bank 
#(  parameter MEM_WIDTH = 32, parameter MEM_DEPTH = 8)

(
    input                        CLK,
    input                        RSTN,
    input        [2:0]           ADDR,


    input        [MEM_WIDTH-1:0] WDATA,
    input                        ENABLE,

    input                        write_enable,
    input                        read_enable,

    input        [MEM_WIDTH-1:0] Result_Fpu,
    input                        Result_FPU_valid,

    output  reg  [MEM_WIDTH-1:0] RDATA,

    output       [MEM_WIDTH-1:0] OP1,
    output       [MEM_WIDTH-1:0] OP2,
    output       [2:0]          OP_select                  
    );

localparam OP1_ADDR=3'b000;
localparam OP2_ADDR=3'b001;
localparam OpSelect_ADDR=3'b010;
localparam Flag_ADDR=3'b011;
localparam Result_ADDR=3'b100;


reg [MEM_WIDTH-1:0]   mem [MEM_DEPTH-1:0];

//////////the read and write ports for APB interface/////////
integer i;
always @(posedge CLK or negedge RSTN) begin
	if (!RSTN) begin
		// reset
	   for(i=0;i<MEM_DEPTH;i=i+1)begin
	   	mem[i]<=0;
	   end
	end
	else begin
    
        mem[Result_ADDR]<=Result_Fpu;
		mem[Flag_ADDR][0]<=Result_FPU_valid;

	        if (ENABLE) begin

	              if(write_enable)begin
	    	      mem[ADDR] <= WDATA;
	              end
		
	        end
	end 
 	
end



///////////combinational read/////////////
always@(*)begin

    if(ENABLE)begin
      if(read_enable&&!write_enable)begin
      	RDATA<=mem[ADDR];
      end
      else begin
        RDATA=mem[Result_ADDR];
      end

  end
    else begin
      RDATA=mem[Result_ADDR];
       
     end 
	
    end
        





assign OP1 = mem[OP1_ADDR] ;
assign OP2 = mem[OP2_ADDR] ;
assign OP_select = mem[OpSelect_ADDR][2:0] ;



endmodule 
