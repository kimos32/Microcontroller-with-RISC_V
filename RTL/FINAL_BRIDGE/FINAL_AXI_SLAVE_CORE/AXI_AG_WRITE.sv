//_____________________________________________________________WRITE ADDRESS GENERATOR (WAG)_____________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023





`timescale 1ns/1ps
`define DEPTH 8               //DEPTH = 8
`define LOCATIONS (1<<`DEPTH) //No. of locations = 256


module AXI_AG_WRITE(

input             clk,
input             reset,

input      [31:0] POPPED_ADDRESS_SA, //address popped from fifo
input      [3:0]  WSTRB,
input      [1:0]  AWBURST_FIFO,
input      [2:0]  AWSIZE_FIFO,
input      [7:0]  AWLEN_FIFO,
input      [2:0]  W_Prot_FIFO,

input             Write_Ready,
input             WVALID,
input      [31:0] WDATA,         //Write data   from master
input             WLAST,         //Last  signal from master
input      [`DEPTH - 1 : 0] rd_ptr,


output reg [31:0] Write_Address, //For Slave
output reg [31:0] Write_Data,    //For Slave
output reg        Write_Valid,   //For Slave
output            WREADY,        //For master
output            rd_en,         //For FIFO
output reg [3:0]  Write_Strobe,   //For Slave
output reg [2:0]  W_Prot,
output reg [`DEPTH - 1 : 0] rd_ptr_ff


);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////


//__________________________________________Internal Wires__________________________________________//
wire [7:0]   AWLEN_INC;
wire [31:0]  Next_Address; 
wire [31:0]  Address_FIXED;
wire [31:0]  Address_INCREMENT;
wire [31:0]  Address_WRAP;


reg  [31:0]  AG_WRITE;
reg  [7:0]   Beat_Count;
reg  [31:0]  A_M1;             // Output address of first mux which is input to the adder
reg  [31:0]  A_DM_F;           // Output address of DEMUX in case (FALSE)
reg  [31:0]  A_DM_T;           // Output address of DEMUX in case (TRUE)
reg  [31:0]  A_M3;             // Output address from third mux (Alignment Mux)
reg  [31:0]  A_M4;             // Output address to the slave which is input to the register
reg  [7:0]   Beat_Size;        // The Size of each beat after decoding AWSIZE
reg  [2:0]   Beat_Length;      // Number of beats in a single burst after encoding AWLEN_INC
reg  [7:0]   Total_Size;       // Total number of bytes of all beats in the whole burst

//////WRAP Wires//////
reg  [31:0]  SA_Aligned;       // The starting address after being aligned by the size of each beat (For WRAP)
reg  [31:0]  A_W_M1;
reg  [31:0]  Wrap_Boundary;
reg  [31:0]  A_W_M2;
reg  [31:0]  A_W_M3;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

localparam IDLE = 3'd0, SEND = 3'd1, END = 3'd2, HOLD = 3'd3, FIRST_END = 3'd4, FIRST_HOLD = 3'd5;
reg [2:0] PS, NS; //PS= Present State, NS= Next State



//Present State
always@(posedge clk, negedge reset)
begin
     if(~reset)

     PS <= IDLE;

     else
     PS <= NS;

end





// NEXT STATE LOGIC

always@(*)
begin

      case(PS)

      IDLE:
      begin
            if(!WVALID)
            begin
            NS          = IDLE;


            end

            else
            begin

                  if(WLAST)
                  begin
                        if(Write_Ready)
                        begin
                        NS = FIRST_END;

 
                        end

                        else
                        begin
                        NS = FIRST_HOLD;


                        end

                  end

                  else
                  begin
                        if(Write_Ready)
                        begin
                        NS = SEND;


                        end

                        else
                        begin
                        NS = HOLD;


 
                        end

                  end

            end


      end

      SEND:
      begin
            if(!WVALID)
            begin
            NS          = SEND;

            end

            else
            begin

                 if(WLAST)
                 begin

                      if(Write_Ready)
                      begin
                       NS           = END;

                      end

                      else
                      begin
                       NS          = HOLD;

                      end
       
                 end

                 else
                 begin
                      if(Write_Ready)
                      begin
                       NS          = SEND;

                      end

                      else
                      begin
                       NS          = HOLD;


                      end

                 end


            end


      end


      END:
      begin

            if(!WVALID)
            begin
            NS          = IDLE;

            end 



            else
            begin

                  if(WLAST)
                  begin
                        if(Write_Ready)

                        NS                = FIRST_END;


                        else

                        NS                = FIRST_HOLD;


                  end

                  else
                  begin
                        if(Write_Ready)
                        NS                = SEND;

                        else

                        NS                = HOLD;

                  end

            end




      end


      HOLD:
      begin 

            if(!WVALID)

            NS          = HOLD;



            else
            begin
                  if(WLAST)
                  begin
                        if(Write_Ready)

                        NS          = END;


                        else
                        NS          = HOLD;

                  end

                  else
                  begin
                        if(Write_Ready)

                        NS          = SEND;


                        else

                        NS          = HOLD;

                  end


            end



      end

      FIRST_END:
      begin 

            if(!WVALID)

            NS          = IDLE;


            else
            begin
                  if(WLAST)
                  begin
                        if(Write_Ready)

                        NS          = FIRST_END;


                        else

                        NS          = FIRST_HOLD;

                  end

                  else
                  begin
                        if(Write_Ready)

                        NS          = SEND;


                        else

                        NS          = HOLD;

                  end


            end



      end


      

      FIRST_HOLD:
      begin 

            if(!WVALID)

            NS          = IDLE;

            else
            begin
                  if(WLAST)
                  begin
                        if(Write_Ready)

                        NS          = IDLE;


                        else

                        NS          = FIRST_HOLD;
 
                  end

                  else
                  begin
                        if(Write_Ready)

                        NS          = SEND;


                        else

                        NS          = HOLD;

                  end


            end


      end
		
		default:
		NS          = IDLE;
		

      endcase


end



// OUTPUT LOGIC

always@(posedge clk , negedge reset)
begin

      if(~reset)
      begin
      Write_Valid   <= 0;
      Beat_Count    <= 0;

      end

      else
      begin

      case(NS)
      

      IDLE: //0
      begin

            if( (PS == FIRST_HOLD) || (PS == HOLD) )
            begin
            Beat_Count    <= 0;
            Write_Valid   <= 0;
            Write_Data    <= WDATA;
            Write_Strobe  <= WSTRB;
            W_Prot        <= W_Prot_FIFO;
            end

            else
            begin
            Beat_Count  <= 0;
            Write_Valid <= WVALID;
            Write_Data  <= WDATA;
            Write_Strobe  <= WSTRB;
            W_Prot        <= W_Prot_FIFO;
            end

      end


      SEND: //1
      begin

            if( PS==HOLD )
            begin

                 if(Write_Ready)
                 begin
                 Beat_Count    <= Beat_Count + 8'd1;
                 Write_Valid   <= 0;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end

                 else
                 begin
                 Beat_Count    <= Beat_Count;
                 Write_Valid   <= WVALID;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end
            end

            else
            begin
                 if(~Write_Valid)
                 begin
                 Beat_Count    <= Beat_Count + 8'd1;
                 Write_Valid   <= WVALID;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end

                 else
                 begin
                 Beat_Count    <= Beat_Count + 8'd1;
                 Write_Valid   <= WVALID;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end

            end

      end


      END: //2
      begin

            if( PS==HOLD )
            begin

                 if(Write_Ready)
                 begin
                 Beat_Count    <= Beat_Count;
                 Write_Valid   <= 0;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end

                 else
                 begin
                 Beat_Count    <= Beat_Count;
                 Write_Valid   <= WVALID;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end
            end

            else
            begin
            Beat_Count    <= Beat_Count + 8'd1;
            Write_Valid   <= WVALID;
            Write_Data    <= WDATA;
            Write_Strobe  <= WSTRB;
            W_Prot        <= W_Prot_FIFO;
            end
      end



      HOLD: //3
      begin

            if( PS ==!HOLD )
            begin

                 if(~Write_Ready && (PS == SEND) )
                 begin
                 Beat_Count    <= Beat_Count;
                 Write_Valid   <= WVALID;
                 Write_Data    <= Write_Data;
                 Write_Strobe  <= Write_Strobe;
                 W_Prot        <= W_Prot;
                 end

                 else
                 begin
                 Beat_Count    <= Beat_Count + 8'd1;
                 Write_Valid   <= WVALID;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end

            end

            else 
            begin
            Beat_Count    <= Beat_Count ;
            Write_Valid   <= WVALID;
            Write_Data    <= WDATA;
            Write_Strobe  <= WSTRB;
            W_Prot        <= W_Prot_FIFO;
            end

      end

      FIRST_END:
      begin

            if( PS==FIRST_HOLD )
            begin

                 if(Write_Ready)
                 begin
                 Beat_Count    <= 0;
                 Write_Valid   <= 0;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end

                 else
                 begin
                 Beat_Count    <= Beat_Count;
                 Write_Valid   <= WVALID;
                 Write_Data    <= WDATA;
                 Write_Strobe  <= WSTRB;
                 W_Prot        <= W_Prot_FIFO;
                 end
            end

            else 
            begin
            Beat_Count    <=  8'd1;
            Write_Valid   <= WVALID;
            Write_Data    <= WDATA;
            Write_Strobe  <= WSTRB;
            W_Prot        <= W_Prot_FIFO;
            end

      end
      


      FIRST_HOLD:
      begin
            Beat_Count    <=  8'd1;
            Write_Valid   <= WVALID;
            Write_Data    <= WDATA;
            Write_Strobe  <= WSTRB;
            W_Prot        <= W_Prot_FIFO;
      end

      endcase

      end

end





//////////////////////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk , negedge reset)
begin
     if(~reset)
     rd_ptr_ff <= 0;
     else
     rd_ptr_ff <= rd_ptr;

end
//////////////////////////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//_____________________________________________Continous Assignments_____________________________________________//

// WREADY is the same as Write_Ready
assign WREADY      = Write_Ready;

// Read enable is asserted when new address needs to get popped from fifo
assign rd_en = ( (Beat_Count == AWLEN_INC) && Write_Ready) ? 1'd1 : 1'd0; 

// Number of beats = AWLEN + 1
assign  AWLEN_INC = AWLEN_FIFO + 8'h01;

// Next beat address calculation
assign Next_Address = Beat_Size + Write_Address;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Decoding AWSIZE "Size of each beat"
always@(AWSIZE_FIFO)
begin
     case(AWSIZE_FIFO)
   
     3'b000 :  Beat_Size = 8'h01;
     3'b001 :  Beat_Size = 8'h02;
     3'b010 :  Beat_Size = 8'h04;
     3'b011 :  Beat_Size = 8'h08;
     3'b100 :  Beat_Size = 8'h10;
     3'b101 :  Beat_Size = 8'h20;
     3'b110 :  Beat_Size = 8'h40;
     3'b111 :  Beat_Size = 8'h80;
     default : Beat_Size = 8'h00;

     endcase 
      
end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Encoding AWLEN_INC "Number of beats"
always@(AWLEN_INC)
begin
     case(AWLEN_INC)
   
     8'h01  :  Beat_Length = 3'b000;
     8'h02  :  Beat_Length = 3'b001;
     8'h04  :  Beat_Length = 3'b010;
     8'h08  :  Beat_Length = 3'b011;
     8'h10  :  Beat_Length = 3'b100;
     8'h20  :  Beat_Length = 3'b101;
     8'h40  :  Beat_Length = 3'b110;
     8'h80  :  Beat_Length = 3'b111;
     default : Beat_Length = 3'b000;

     endcase 
      
end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
always@(*)
begin

     if( (Beat_Count == AWLEN_INC) && Write_Ready)
      A_M1 = POPPED_ADDRESS_SA;

     else if(PS == IDLE) 
      A_M1 = POPPED_ADDRESS_SA;
     else
      A_M1 = Next_Address;

end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//__________________________________________INCREMENT__________________________________________//


always@(*)
begin

// DEMUX selected by (Counter == 2)
      if( (Beat_Count == 8'd1) && (NS != IDLE) || ((Beat_Count == 8'd2) && (~Write_Ready)) )
      begin
      A_DM_F = 32'h0000;
      A_DM_T = A_M1;
      end

      else
      begin
      A_DM_F = A_M1;
      A_DM_T = 32'h0000;
      end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////==================================================================================================///////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//__________________________________________Alignment Process__________________________________________//

// (If size of each beat > 2 bytes "Eg: 4,8,16, ...") then Least significant 2 bits are set by 0.

      if( AWSIZE_FIFO > 3'b001)
      begin

      if( A_DM_T[1:0] == 2'b00 )
      A_M3 = A_DM_T;
      else
      A_M3 = {A_DM_T[31:2], 1'b0, 1'b0};

      end

//(If size of each beat = 2 bytes) then Least significant bit is set by 0.
      else if (AWSIZE_FIFO == 3'b001)
      begin
      if( A_DM_T[0] == 1'b0 )
      A_M3 = A_DM_T;
      else
      A_M3 = {A_DM_T[31:1], 1'b0};

      end

//(If size of each beat = 1 byte) then no alignment needed.
      else
      A_M3 = A_DM_T;

// Last mux in the Increment burst type (Fedback to the frist mux)
     if( ( (Beat_Count == 8'd1) && (NS != IDLE) ) || ((Beat_Count == 8'd2) && (~Write_Ready)) )
     A_M4 = A_M3;
     else
     A_M4 = A_DM_F;

end


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////==================================================================================================///////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//____________________________________________WRAP____________________________________________//


always@(*)
begin

// Alignment of starting address for wrap burst type

// (If size of each beat > 2 bytes "Eg: 4,8,16, ...") then Least significant 2 bits are set by 0.

      if( AWSIZE_FIFO > 3'b001)
      begin

      if( POPPED_ADDRESS_SA[1:0] == 2'b00 )
      SA_Aligned = POPPED_ADDRESS_SA;
      else
      SA_Aligned = {POPPED_ADDRESS_SA[31:2], 1'b0, 1'b0};

      end

//(If size of each beat = 2 bytes) then Least significant bit is set by 0.
      else if (AWSIZE_FIFO == 3'b001)
      begin
      if( POPPED_ADDRESS_SA[0] == 1'b0 )
      SA_Aligned = POPPED_ADDRESS_SA;
      else
      SA_Aligned = {POPPED_ADDRESS_SA[31:1], 1'b0};

      end

//(If size of each beat = 1 byte) then no alignment needed.
      else
      SA_Aligned = POPPED_ADDRESS_SA;


// First mux in WRAP burst (selects SA or Next address)
     if( (Beat_Count == 8'd0) && (NS != IDLE) )
       A_W_M1 = SA_Aligned;
       else
       A_W_M1 = Next_Address;



end



//__________________________________________WRAP BOUNDARY CALCULATION__________________________________________//
always@(*)
begin

      Total_Size    = Beat_Size << Beat_Length ;

      Wrap_Boundary = (SA_Aligned / Total_Size) * Total_Size;

end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////==================================================================================================///////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//____________________________________________ADDRESSES____________________________________________//
assign Address_FIXED     = POPPED_ADDRESS_SA;
assign Address_INCREMENT = A_M4;
assign Address_WRAP      = A_W_M1;




always@(posedge clk , negedge reset)

begin

  if(~reset)
  Write_Address <= 32'd0;

  else
  begin


//localparam IDLE = 3'd0, SEND = 3'd1, END = 3'd2, HOLD = 3'd3, FIRST_END = 3'd4, FIRST_HOLD = 3'd5;

     case(AWBURST_FIFO)

//_______________________________________FIXED_______________________________________//

     2'b00   :    
     begin
                       if( (PS != (HOLD || FIRST_HOLD) ) )
                       Write_Address <= Address_FIXED;   // FIXED
                       else
                       Write_Address <= Write_Address;
     end


//_____________________________________INCREMENT_____________________________________//

     2'b01   :       
     begin
                       if( (PS == HOLD) || (PS == FIRST_HOLD) )
                       Write_Address <= Write_Address;

                       else if(NS != IDLE)
                       Write_Address <= Address_INCREMENT;    // INCREMENT

                        else
                       Write_Address <= Write_Address;
     end
               

//_______________________________________WRAP_______________________________________//

     2'b10   :  
     

     begin
                       if( (PS == HOLD) || (PS == FIRST_HOLD) )
                       Write_Address <= Write_Address;

                       else if(NS != IDLE)
                       begin

                       if( Next_Address == (Wrap_Boundary + Total_Size) && ( (Beat_Count == 8'd1) && (NS != IDLE) ) )
                       Write_Address <= Wrap_Boundary;

                       else
                       Write_Address <= Address_WRAP;    // WRAP


                        end

                        else
                       Write_Address <= Write_Address;
     end




                    

     default :         Write_Address <= 32'h0000_0000;  //Reserved "Cannot be used"
     
     endcase

       
  end


end






endmodule

