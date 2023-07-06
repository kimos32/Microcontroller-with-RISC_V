//____________________________________________________________READ RESPONSE GENERATOR (RRG)____________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023




`timescale 1ns / 1ps



module AXI_RG_READ
( 
input              clk,
input              reset,

input       [5:0]  R_ID_OUT,
input              Valid_Data_R,
input              RREADY,
input              RLAST,         //Comes from AG
input       [31:0] Read_Data,


output reg  [5:0]  RID,
output reg         RRESP,
output reg         RVALID,      // = Valid_Data_R
output             Read_Ready,
output reg  [31:0] RDATA,        // = Read_Data
output reg  [7:0]   Beat_Count
 

);

assign Read_Ready = RREADY;



parameter  OKAY = 1'b0;

localparam IDLE = 3'd0, HOLD = 3'd1, SEND = 3'd2;
reg [1:0] PS, NS; //PS= Present State, NS= Next State





//Present State
always@(posedge clk, negedge reset)
begin
     if(~reset)
     PS         <= IDLE;

     else
     PS         <= NS;

end



always@(*)
begin

                NS      = IDLE;

      case(PS)

      IDLE:
      begin
           if (!Valid_Data_R) 
           begin

                NS      = IDLE;
           end

           else if ( Valid_Data_R && ~RREADY )
                
                NS      = HOLD;   

           else if ( Valid_Data_R && RREADY )
                
                NS      = SEND;   


      end




      HOLD:
      begin
           if (!RREADY) 
           begin

                NS     = HOLD;

              
           end

           else
           begin

                if (Valid_Data_R && ~RLAST)
                NS      = SEND;

                else
                NS      = IDLE;


           end
      end


      SEND:
      begin
           if (~RREADY)

                NS       = HOLD;

           else if(RREADY && Valid_Data_R &&RLAST)

                NS       = IDLE;

           else if(RREADY && Valid_Data_R &&~RLAST)

                NS       = SEND;

           else if(RREADY && ~Valid_Data_R)

                NS       = IDLE;
          
      end
		
		default
		          NS       = IDLE;
		
endcase

end




always@(posedge clk)
begin

      case(PS)

      IDLE:
      begin

           if (!Valid_Data_R) 
           begin

                RVALID  <= 0;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= 0;
           end

           else if ( Valid_Data_R && ~RREADY )
           begin
                RVALID  <= Valid_Data_R;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= Beat_Count + 8'd1;
           end

           else if ( Valid_Data_R && RREADY )
           begin
                RVALID  <= Valid_Data_R;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <=  8'd1;
           end   






      end

      HOLD:
      begin
           if (!RREADY) 
           begin

                RVALID  <= Valid_Data_R;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= Beat_Count;
              
           end

           else
           begin

                if (Valid_Data_R && ~RLAST)
                begin

                RVALID  <= 0;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= Beat_Count;
              
                end

                else
                begin

                RVALID  <= 0;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= 0;
              
                end


           end
      end


      SEND:
      begin
           if (~RREADY)
                begin

                RVALID  <= Valid_Data_R;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= Beat_Count ;
              
                end

           else if(RREADY && Valid_Data_R )

                begin

                RVALID  <= Valid_Data_R;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= Beat_Count + 8'd1;
              
                end


           else if(RREADY && ~Valid_Data_R)

                begin

                RVALID  <= Valid_Data_R;
                RDATA   <= Read_Data ;
                RID     <= R_ID_OUT;
                RRESP   <= OKAY;
                Beat_Count <= 0;
              
                end
          
      end




      default:
      begin
                RVALID     <= 0;
                RDATA      <= 0 ;
                RID        <= 0;
                RRESP      <= OKAY;
                Beat_Count <= 0;



      end

endcase


end



endmodule

