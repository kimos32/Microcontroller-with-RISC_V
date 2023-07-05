//____________________________________________________________WRITE RESPONSE GENERATOR (WRG)____________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023




`timescale 1ns / 1ps



module AXI_RG_WRITE
( 
input              clk,
input              reset,
input       [5:0]  FIFO_ID_W, // mapped to W_ID_OUT from fifo
input              Write_Valid,
input              Write_Ready,
input              rd_en,
input              BREADY,


output  reg    [5:0]  BID,
output  reg           BRESP,
output  reg           BVALID


);


parameter SLVERR = 1'b1, OKAY = 1'b0;

 
always@(posedge clk, negedge reset)
begin

// If W_Error = 1 >> "SLAVE HAS ERROR IN TRANSACTION" >> BRESP = SLVERR = 1


      if(~reset)
      begin
      BVALID <= 1'b0;
      BRESP  <= 1'b0;
      BID    <= 6'b0;
      end

      
      else if( Write_Valid && Write_Ready && rd_en)

      begin
      BVALID <= 1'b1;
      BRESP  <= OKAY; 
      BID    <= FIFO_ID_W;
      end

      else if(BREADY)
      BVALID <= 1'b0;

      else
      begin
      BVALID <= BVALID;
      BRESP  <= BRESP;
      BID    <= BID;
      end
     
end

endmodule

