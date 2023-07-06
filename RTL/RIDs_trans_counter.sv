module RIDs_trans_counter #(parameter ID = 2'b00, parameter ID_width = 'd2, parameter seq_width = 'd4)(
  //Input Signals Definition
	input [ID_width+seq_width-1:0]   RID         ,
	input                            RREADY      ,
	input                            clk         ,
	input                            reset_n     ,
	input                            ID_valid    ,
  input                            RLAST       ,
  
  //Output Signals Definition
	output                           countn_update
	);

///////////////////Internal Signals Definition//////////////////////
reg [seq_width-1:0]    count;
wire                   enable;
 
/////////////////////Combinational Ouputs//////////////////////////
assign enable             = ((RID[ID_width-1:0] == ID) && ID_valid)? 1'b1:1'b0;
assign countn_update = ((RID[seq_width+ID_width-1:ID_width] == count) && enable)? 1'b1:1'b0;

always @(posedge clk, negedge reset_n)
  begin 
    if(!reset_n)
      begin
        count <= 'b0;
      end
    else if(countn_update && RREADY && RLAST)
      begin
        count <= count + 1'b1;
      end
  end

endmodule 


