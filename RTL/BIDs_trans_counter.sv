module BIDs_trans_counter #(parameter ID = 2'b00, parameter ID_width = 'd2, parameter seq_width = 'd4)(
  //Input Signals Definition
	input [ID_width+seq_width-1:0]   BID         ,
	input                            BREADY      ,
	input                            clk         ,
	input                            reset_n     ,
	input                            ID_valid    ,
  
  //Output Signals Definition
	output                           countn_update
	);

////////////////////Internal Signals Definition/////////////////////
reg [seq_width-1:0]    count ;
wire                   enable;

/////////////////////////Combinational Outputs/////////////////////
assign enable        = ((BID[ID_width-1:0] == ID) && ID_valid)? 1'b1:1'b0                  ;
assign countn_update = ((BID[seq_width+ID_width-1:ID_width] == count) && enable)? 1'b1:1'b0;

///////////////////Expected next transaction counter/////////////////
always @(posedge clk, negedge reset_n)
  begin 
    if(!reset_n)
      begin
        count <= 'b0;
      end
    else if(countn_update && BREADY)
      begin
        count <= count + 1'b1;
      end
  end

endmodule 


