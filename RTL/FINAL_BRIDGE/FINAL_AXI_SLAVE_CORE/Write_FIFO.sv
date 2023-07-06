//____________________________________________________________________WRITE FIFO____________________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023



`timescale 1ns / 1ps
`define DEPTH 8               //DEPTH = 8
`define LOCATIONS (1<<`DEPTH) //No. of locations = 256



module Write_FIFO
(
input                       clk,
input                       reset,           //ACTIVE LOW
input                       wr_en,
input                       rd_en,           //comes from AG

input      [31:0]           AWADDR,          //AWADDR
input      [2:0]            AWPROT,          //AWPROT from master
input      [5 :0]           AWID,            //AWID
input      [7:0]            AWLEN,
input      [1:0]            AWBURST,
input      [2:0]            AWSIZE,


output reg [31:0]           POPPED_ADDRESS_SA,
output reg [5 :0]           W_ID_OUT,
output reg                  W_FULL,
output reg [2:0]            W_Prot_FIFO,
output reg [7:0]            AWLEN_FIFO,
output reg [2:0]            AWSIZE_FIFO,
output reg [1:0]            AWBURST_FIFO,
output reg [`DEPTH - 1 : 0] rd_ptr          //Pointers to write and read addresses


);
reg W_EMPTY;
reg [`DEPTH - 1 : 0] wr_ptr;                    //Pointers to write and read addresses
reg [53:0]           FIFO[`LOCATIONS - 1 : 0];  //Width = 54 bits, Depth = 8 Locations     ____0>>31:Address___32>>37:ID___38>>40:AWPROT___41>>48:AWLEN___49>>51:AWSIZE___52>>53:AWBURST
reg [`DEPTH -1  : 0] fifo_counter;



always@(fifo_counter)
begin
W_EMPTY = (fifo_counter == 0);               //if fifo counter = 0,         W_EMPTY = 1
W_FULL  = (fifo_counter == `LOCATIONS);      //if fifo counter = Locations, W_FULL  = 1

end


//___________________________________________POP WHILE EMPTY FLAG___________________________________________//

reg POP_EMPTY_FLAG;

always@(posedge clk, negedge reset)
begin
      if(~reset)
      POP_EMPTY_FLAG <= 0;
 
      else if(rd_en && W_EMPTY)
      POP_EMPTY_FLAG <= 1;

      else if(POP_EMPTY_FLAG && (fifo_counter != 0))
      POP_EMPTY_FLAG <= 0;

      else
      POP_EMPTY_FLAG <= POP_EMPTY_FLAG;

end



// Calculating fifo counter in all cases
always@(posedge clk, negedge reset)
begin
       if(~reset)
       fifo_counter <= 0;

       else if( wr_en && ~W_FULL && ( ((rd_en || POP_EMPTY_FLAG) && ~W_EMPTY) || (wr_ptr == 1) && ~W_EMPTY ) )
       fifo_counter <= fifo_counter;

       else if( wr_en && ~W_FULL)
       fifo_counter <= fifo_counter + 8'd1;

       else if( (rd_en || POP_EMPTY_FLAG) && ~W_EMPTY)
       fifo_counter <= fifo_counter - 8'd1;

       else if( (wr_ptr == 1) && ~W_EMPTY &&(FIFO[rd_ptr][53:0] !== 54'hxxxx_xxxx_xxxx_x))
       fifo_counter <= fifo_counter - 8'd1;

       else
       fifo_counter <= fifo_counter;
end




//Reading from FIFO
always@(posedge clk, negedge reset)
begin
      if(~reset)
      begin
      POPPED_ADDRESS_SA   <= 32'd0;
      W_ID_OUT            <= 6'd0;
      AWLEN_FIFO          <= 8'd0;
      AWSIZE_FIFO         <= 3'd0;
      AWBURST_FIFO        <= 2'd0;
      end

      else if( (rd_en || POP_EMPTY_FLAG) && ~W_EMPTY &&(FIFO[rd_ptr][53:0] !== 54'hxxxx_xxxx_xxxx_x))
      begin
      POPPED_ADDRESS_SA   <= FIFO[rd_ptr][31:0];
      W_ID_OUT            <= FIFO[rd_ptr][37:32];
      W_Prot_FIFO         <= FIFO[rd_ptr][40:38];
      AWLEN_FIFO          <= FIFO[rd_ptr][48:41];
      AWSIZE_FIFO         <= FIFO[rd_ptr][51:49];
      AWBURST_FIFO        <= FIFO[rd_ptr][53:52];
      end

      else if( (wr_ptr == rd_ptr ) && ~W_EMPTY &&(FIFO[rd_ptr][53:0] !== 54'hxxxx_xxxx_xxxx_x))
      begin
      POPPED_ADDRESS_SA   <= FIFO[rd_ptr][31:0];
      W_ID_OUT            <= FIFO[rd_ptr][37:32];
      W_Prot_FIFO         <= FIFO[rd_ptr][40:38];
      AWLEN_FIFO          <= FIFO[rd_ptr][48:41];
      AWSIZE_FIFO         <= FIFO[rd_ptr][51:49];
      AWBURST_FIFO        <= FIFO[rd_ptr][53:52];
      end

      else if( (wr_ptr == 1) && ~W_EMPTY &&(FIFO[rd_ptr][53:0] !== 54'hxxxx_xxxx_xxxx_x))
      begin
      POPPED_ADDRESS_SA   <= FIFO[rd_ptr][31:0];
      W_ID_OUT            <= FIFO[rd_ptr][37:32];
      W_Prot_FIFO         <= FIFO[rd_ptr][40:38];
      AWLEN_FIFO          <= FIFO[rd_ptr][48:41];
      AWSIZE_FIFO         <= FIFO[rd_ptr][51:49];
      AWBURST_FIFO        <= FIFO[rd_ptr][53:52];
      
      end

      else
      begin
      POPPED_ADDRESS_SA     <= POPPED_ADDRESS_SA;
      W_ID_OUT              <= W_ID_OUT;
      AWLEN_FIFO            <= AWLEN_FIFO;
      AWSIZE_FIFO           <= AWSIZE_FIFO;
      AWBURST_FIFO          <= AWBURST_FIFO;
      end

end

//Writing in FIFO
always@(posedge clk)
begin
      if( wr_en && ~W_FULL)
      begin
      FIFO[wr_ptr][31:0]  <= AWADDR;
      FIFO[wr_ptr][37:32] <= AWID;
      FIFO[wr_ptr][40:38] <= AWPROT;
      FIFO[wr_ptr][48:41] <= AWLEN;
      FIFO[wr_ptr][51:49] <= AWSIZE;
      FIFO[wr_ptr][53:52] <= AWBURST;
      end

      else
      FIFO[wr_ptr] <= FIFO[wr_ptr];
end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
//___________________________________CALCULATING FIFO POINTERS___________________________________//
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////





always @(posedge clk, negedge reset)
begin
        if (~reset) // reset
        begin  
        wr_ptr <= 0;  // Initializing write pointer with starting value  = 0
        rd_ptr <= 0; //  Initializing read  pointer with starting value  = 0
	end

	else

        begin

             if (wr_en && !W_FULL)
             wr_ptr <= wr_ptr + 8'd1 ;  // On write operation, Write pointer points to next location
             else
             wr_ptr <= wr_ptr;


             if ( ((rd_en || POP_EMPTY_FLAG) && !W_EMPTY) || ( (wr_ptr == 1) && !W_EMPTY ) ) 
             rd_ptr <= rd_ptr + 8'd1; // On read operation, read pointer points to next location to be read
             else
             rd_ptr <= rd_ptr;

        end	

		

end





endmodule

