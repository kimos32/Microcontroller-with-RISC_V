//_____________________________________________________________READ ADDRESS GENERATOR (RAG)_____________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023





`timescale 1ns/1ps
`define DEPTH 8               //DEPTH = 8
`define LOCATIONS (1<<`DEPTH) //No. of locations = 256


module AXI_AG_READ
(
input             clk,
input             reset,

input      [31:0] POPPED_ADDRESS_SA, //address popped from fifo
input      [1:0]  ARBURST_FIFO,
input      [2:0]  ARSIZE_FIFO,
input      [7:0]  ARLEN_FIFO,
input      [2:0]  R_Prot_FIFO,


input             R_Ready_Address,

input      [`DEPTH - 1 : 0] rd_ptr_address,
input      [7:0]   Beat_Count,


output reg [31:0] Read_Address,       //output address from AG to slave
output reg [2:0]  R_Prot,
output reg        RLAST,
output reg        R_Valid_Address,    //For Slave
output     [7:0]  ARLEN_INC,
output reg [7:0]  Address_counter,
output reg [`DEPTH - 1 : 0] rd_ptr_address_ff //to b3sa_fifo
//output reg [7:0]   Beat_Count
);


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//__________________________________________Internal Wires__________________________________________//

reg  [7:0]   Beat_Size;        // The Size of each beat after decoding ARSIZE
reg  [2:0]   Beat_Length;      // Number of beats in a single burst after encoding ARLEN_INC
reg  [7:0]   Total_Size;       // Total number of bytes of all beats in the whole burst


//////Increment Wires//////
reg  [31:0]  A_M1;             // Output address of first mux which is input to the adder
reg  [31:0]  A_DM_F;           // Output address of DEMUX in case (FALSE)
reg  [31:0]  A_DM_T;           // Output address of DEMUX in case (TRUE)
reg  [31:0]  A_M3;             // Output address from third mux (Alignment Mux)
reg  [31:0]  A_M4;             // Output address to the slave which is input to the register
reg  [31:0]  AG_READ;

wire [31:0]  Next_Address;      //Next address calculation for increment burst



//////WRAP Wires//////
reg  [31:0]  SA_Aligned;       // The starting address after being aligned by the size of each beat (For WRAP)
reg  [31:0]  A_W_M1;
reg  [31:0]  Wrap_Boundary;
reg  [31:0]  A_W_M2;
reg  [31:0]  A_W_M3;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Number of beats = AWLEN + 1
// Used for setting RLAST = 1
assign  ARLEN_INC = ARLEN_FIFO + 8'd1;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////



// RLAST = 1 when last beat exists at the condition (Beat length = Beat count).
always@(*)
RLAST = (Beat_Count == ARLEN_INC) ? 1'd1 : 1'd0 ;





// Decoding ARSIZE "Size of each beat"
always@(ARSIZE_FIFO)
begin
     case(ARSIZE_FIFO)
   
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

// Encoding ARLEN_INC "Number of beats"
always@(ARLEN_INC)
begin
     case(ARLEN_INC)
   
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


always@(posedge clk, negedge reset)
     if(~reset)
     rd_ptr_address_ff <= 0;
     else
     rd_ptr_address_ff <= rd_ptr_address;



// Valid Address generation//  ________The Valid going for the slave________ //

always@(posedge clk, negedge reset)
begin
     if(~reset)
      R_Valid_Address <= 0;

// hatnzl b 0 lama el address counter == arleninc && valid && ready 
//hytl3 b 1 law el rd_ptr != rd_ptr_ff

     else if((Address_counter == ARLEN_INC) && R_Valid_Address && R_Ready_Address)
      R_Valid_Address <= 0;

     else if( rd_ptr_address != rd_ptr_address_ff )
      R_Valid_Address <= 1;

     else
      R_Valid_Address <= R_Valid_Address;
end


//////////////////////////////////////////////////////////////////////

// Next beat address calculation

assign  Next_Address = Beat_Size + Read_Address;

/////////////////////////////////////////////////////////////////////

// Calculating number of addresses to be sent for the slave
always@(posedge clk, negedge reset)
begin

     if(~reset)
      Address_counter <= 8'd0;

     else if( (R_Valid_Address && R_Ready_Address  && (Address_counter != ARLEN_INC) ) || ( rd_ptr_address != rd_ptr_address_ff ) )
      Address_counter <= Address_counter + 8'd1 ;

     else if(R_Valid_Address && R_Ready_Address  &&  (Address_counter == ARLEN_INC) )
      Address_counter <= 8'd0;

     else
      Address_counter <= Address_counter;

end

//__________________________________________INCREMENT__________________________________________//

always@(*)
begin

     if( (Address_counter == 8'd0) && ~R_Valid_Address)
     A_M1 <= POPPED_ADDRESS_SA;
     
     else
     A_M1 <= Next_Address;

end


always@(*)
begin

// DEMUX selected by (Counter == 2)
      if( (Address_counter == 8'd1) && R_Valid_Address && R_Ready_Address)
      begin
      A_DM_F <= 32'h0000;
      A_DM_T <= A_M1;
      end

      else
      begin
      A_DM_F <= A_M1;
      A_DM_T <= 32'h0000;
      end





//__________________________________________Alignment Process__________________________________________//

// (If size of each beat > 2 bytes "Eg: 4,8,16, ...") then Least significant 2 bits are set by 0.

      if( ARSIZE_FIFO > 3'b001)
      begin

      if( A_DM_T[1:0] == 2'b00 )
      A_M3 = A_DM_T;
      else
      A_M3 = {A_DM_T[31:2], 1'b0, 1'b0};

      end

//(If size of each beat = 2 bytes) then Least significant bit is set by 0.
      else if (ARSIZE_FIFO == 3'b001)
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
      if( (Address_counter == 8'd1) && R_Valid_Address && R_Ready_Address)
      A_M4 = A_M3;
      else
      A_M4 = A_DM_F;

end




//____________________________________________WRAP____________________________________________//


always@(*)
begin

// Alignment of starting address for wrap burst type

// (If size of each beat > 2 bytes "Eg: 4,8,16, ...") then Least significant 2 bits are set by 0.

      if( ARSIZE_FIFO > 3'b001)
      begin

      if( POPPED_ADDRESS_SA[1:0] == 2'b00 )
      SA_Aligned = POPPED_ADDRESS_SA;
      else
      SA_Aligned = {POPPED_ADDRESS_SA[31:2], 1'b0, 1'b0};

      end

//(If size of each beat = 2 bytes) then Least significant bit is set by 0.
      else if (ARSIZE_FIFO == 3'b001)
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
     if( (Address_counter == 8'd0) && ~R_Valid_Address)
       A_W_M1 <= SA_Aligned;
       else
       A_W_M1 <= Next_Address;



end




always@(*)
begin

      Total_Size = Beat_Size << Beat_Length ;
      Wrap_Boundary = (SA_Aligned / Total_Size) * Total_Size;


end







// LAST MUX IN ADDRESS GENERATOR
wire [31:0] Address_FIXED;
wire [31:0] Address_INCREMENT;
wire [31:0] Address_WRAP;

assign Address_FIXED     = POPPED_ADDRESS_SA;
assign Address_INCREMENT = A_M4;
assign Address_WRAP      = A_W_M1;





always@(posedge clk)
begin

     case(ARBURST_FIFO)
     2'b00   :       
                     if (~( ( ~R_Ready_Address && R_Valid_Address) 
                      || ( (Address_counter == ARLEN_INC) && R_Valid_Address && R_Ready_Address )
                      || ( (Address_counter == 8'd0) && (rd_ptr_address == rd_ptr_address_ff) && ~R_Valid_Address ) ) )

                     begin
                     Read_Address <= Address_FIXED; // FIXED
                     R_Prot       <= R_Prot_FIFO;
                     end

                     else
                     begin
                     Read_Address <= Read_Address;
                     R_Prot       <= R_Prot;
                     end

     2'b01   : 
                     if (~( ( ~R_Ready_Address && R_Valid_Address) 
                      || ( (Address_counter == ARLEN_INC) && R_Valid_Address && R_Ready_Address )
                      || ( (Address_counter == 8'd0) && (rd_ptr_address == rd_ptr_address_ff) && ~R_Valid_Address ) ) )

                     begin
                     Read_Address <= Address_INCREMENT; // Increment
                     R_Prot       <= R_Prot_FIFO;
                     end


                     else
                     begin
                     Read_Address <= Read_Address;
                     R_Prot       <= R_Prot;
                     end

     2'b10   :       
                     if (~( ( ~R_Ready_Address && R_Valid_Address) 
                      || ( (Address_counter == ARLEN_INC) && R_Valid_Address && R_Ready_Address )
                      || ( (Address_counter == 8'd0) && (rd_ptr_address == rd_ptr_address_ff) && ~R_Valid_Address ) ) )

                     begin

                         if( (Next_Address == (Wrap_Boundary + Total_Size)) && (Address_counter != ARLEN_INC) )
                         begin
                         Read_Address <= Wrap_Boundary;
                         R_Prot       <= R_Prot_FIFO;
                         end

                         else
                         begin
                         Read_Address <= Address_WRAP;      // WRAP
                         R_Prot       <= R_Prot_FIFO;
                         end

                     end


                     else
                     begin
                     Read_Address <= Read_Address;
                     R_Prot       <= R_Prot;
                     end


     default :       Read_Address <= 32'hffff;  //Reserved "Cannot be used"
     
     endcase
end




endmodule

