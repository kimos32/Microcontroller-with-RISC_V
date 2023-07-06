//____________________________________________________________________READ FIFO____________________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023



`timescale 1ns / 1ps
`define DEPTH 8               //DEPTH = 8
`define LOCATIONS (1<<`DEPTH) //No. of locations = 256

module Read_FIFO
(
input         clk,
input         reset,
input         wr_en,                      // wr_en =  ARVALID    (wr_en is input from interconnect and = ARVALID in read or AWVALID in write)

input         RLAST,
input         RREADY,
input [7:0]   ARLEN, ARLEN_INC,
input [7:0]   Beat_Count,


input [2:0]            ARSIZE,
input [1:0]            ARBURST,
input [31:0]           ARADDR,
input [2:0]            ARPROT,             //ARPROT from master
input [5 :0]           ARID,


output reg [31:0]           ADDRESS_OUT,
output reg [5 :0]           R_ID_OUT,
output                      R_FULL,
output reg [2:0]            R_Prot_FIFO,
output reg                  R_EMPTY_ADDRESS,
output reg [`DEPTH - 1 : 0] rd_ptr_address,     //Pointers to write and read addresses
output reg [7:0]            ARLEN_FIFO,
output reg [2:0]            ARSIZE_FIFO,
output reg [1:0]            ARBURST_FIFO

);

wire rd_en_address;
wire rd_en_id;


reg [53:0] FIFO[`LOCATIONS - 1 : 0];  //Width = 54 bits, Depth = 8 Locations     ____0>>31:Address___32>>37:ID___38>>40:ARPROT___41>>48:ARLEN___49>>51:ARSIZE___52>>53:ARBURST

reg  R_FULL_ID;
reg  R_FULL_ADDRESS;
reg  R_EMPTY_ID;

reg [`DEPTH - 1 :0] fifo_counter_address;
reg [`DEPTH - 1 :0] fifo_counter_id;
reg [`DEPTH - 1 :0] wr_ptr;
reg [`DEPTH - 1 :0] rd_ptr_id;



assign  rd_en_address = ( (Beat_Count == ARLEN_INC)  && RREADY );
assign  rd_en_id      = RLAST && RREADY;
assign  R_FULL        = R_FULL_ADDRESS && R_FULL_ID;






always@(fifo_counter_address, fifo_counter_id)
begin
R_EMPTY_ADDRESS = (fifo_counter_address == 0);              //If address fifo counter = 0,       Address R_EMPTY = 1
R_EMPTY_ID      = (fifo_counter_id      == 0);              //If id fifo counter = 0,            ID R_EMPTY = 1
R_FULL_ID       = (fifo_counter_id      == `LOCATIONS);     //If id fifo counter       = Locations, R_FULL  = 1
R_FULL_ADDRESS  = (fifo_counter_address == `LOCATIONS);     //If address fifo counter  = Locations, R_FULL  = 1

end



//___________________________________________POP WHILE EMPTY FLAG___________________________________________//

reg POP_EMPTY_FLAG;

always@(posedge clk, negedge reset)
begin
      if(~reset)
      POP_EMPTY_FLAG <= 0;
 
      else if( (rd_en_address || rd_en_id) && (R_EMPTY_ADDRESS || R_EMPTY_ID) )
      POP_EMPTY_FLAG <= 1;

      else if(POP_EMPTY_FLAG && ( (fifo_counter_address && fifo_counter_id) != 0))
      POP_EMPTY_FLAG <= 0;

      else
      POP_EMPTY_FLAG <= POP_EMPTY_FLAG;

end







// Calculating ID FIFO COUNTER

always@(posedge clk, negedge reset)
begin
       if(~reset)
       fifo_counter_id      <=0;

       else if( (wr_en && ~R_FULL_ADDRESS && ~R_FULL_ID) && ( ( (rd_en_id || POP_EMPTY_FLAG)  && ~R_EMPTY_ID) || ( ((wr_ptr == 1)  && ~R_EMPTY_ID)) ) )
       fifo_counter_id      <= fifo_counter_id;

       else if(  wr_en && ~R_FULL_ADDRESS && ~R_FULL_ID)
       fifo_counter_id      <= fifo_counter_id + 8'd1;

       else if( (rd_en_id || POP_EMPTY_FLAG)  && ~R_EMPTY_ID)
       fifo_counter_id      <= fifo_counter_id - 8'd1;


       else if( (wr_ptr == 1)  && ~R_EMPTY_ID)
       fifo_counter_id      <= fifo_counter_id - 8'd1;

       else

       fifo_counter_id      <= fifo_counter_id;

end






// Calculating ADDRESS FIFO COUNTER
always@(posedge clk, negedge reset)
begin
       if(~reset)

       fifo_counter_address <= 0;

       else if( (wr_en && ~R_FULL_ADDRESS && ~R_FULL_ID) && ( ( (rd_en_address || POP_EMPTY_FLAG)  && ~R_EMPTY_ADDRESS) || ( ((wr_ptr == 1)  && ~R_EMPTY_ADDRESS)) ) )
       fifo_counter_address      <= fifo_counter_address;

       else if( wr_en && ~R_FULL_ADDRESS && ~R_FULL_ID )

       fifo_counter_address <= fifo_counter_address + 8'd1;
 
       else if( (rd_en_address || POP_EMPTY_FLAG) && ~R_EMPTY_ADDRESS)

       fifo_counter_address <= fifo_counter_address - 8'd1;


       else if( (wr_ptr == 1)  && ~R_EMPTY_ADDRESS)
 
       fifo_counter_address <= fifo_counter_address - 8'd1;

       else

       fifo_counter_address <= fifo_counter_address;

end

//Reading from FIFO
always@(posedge clk, negedge reset)
begin
      if(~reset)
      begin
      ADDRESS_OUT  <= 32'd0;
      R_Prot_FIFO  <= 3'b0;
      R_ID_OUT     <= 6'd0;
      ARLEN_FIFO   <= 8'd0;
      ARSIZE_FIFO  <= 3'd0;
      ARBURST_FIFO <= 2'd0;
      end

      else if( ((wr_ptr == 1) && ~R_EMPTY_ADDRESS) )
      begin
      ADDRESS_OUT  <= FIFO[rd_ptr_address][31:0];
      R_Prot_FIFO  <= FIFO[rd_ptr_address][40:38];
      ARLEN_FIFO   <= FIFO[rd_ptr_address][48:41];
      ARSIZE_FIFO  <= FIFO[rd_ptr_address][51:49];
      ARBURST_FIFO <= FIFO[rd_ptr_address][53:52];

      R_ID_OUT     <= FIFO[rd_ptr_id][37:32];

      end

    
      else if( ( (rd_en_address || POP_EMPTY_FLAG) && ~R_EMPTY_ADDRESS)  && ~( (rd_en_id || POP_EMPTY_FLAG) && ~R_EMPTY_ID))
      begin
      ADDRESS_OUT  <= FIFO[rd_ptr_address][31:0];
      R_Prot_FIFO  <= FIFO[rd_ptr_address][40:38];
      ARLEN_FIFO   <= FIFO[rd_ptr_address][48:41];
      ARSIZE_FIFO  <= FIFO[rd_ptr_address][51:49];
      ARBURST_FIFO <= FIFO[rd_ptr_address][53:52];
      end

      else if( ( (rd_en_address || POP_EMPTY_FLAG) && ~R_EMPTY_ADDRESS)  && ( (rd_en_id || POP_EMPTY_FLAG) && ~R_EMPTY_ID))
      begin
      ADDRESS_OUT  <= FIFO[rd_ptr_address][31:0];
      R_Prot_FIFO  <= FIFO[rd_ptr_address][40:38];
      ARLEN_FIFO   <= FIFO[rd_ptr_address][48:41];
      ARSIZE_FIFO  <= FIFO[rd_ptr_address][51:49];
      ARBURST_FIFO <= FIFO[rd_ptr_address][53:52];

      R_ID_OUT     <= FIFO[rd_ptr_id][37:32];

      end

      else if( ~( ( (rd_en_address || POP_EMPTY_FLAG) && ~R_EMPTY_ADDRESS) || (wr_ptr == 1) ) &&  ( (rd_en_id || POP_EMPTY_FLAG) && ~R_EMPTY_ID))
      R_ID_OUT     <= FIFO[rd_ptr_id][37:32];



      else
      begin
      ADDRESS_OUT  <= ADDRESS_OUT;
      R_Prot_FIFO  <= R_Prot_FIFO;
      ARLEN_FIFO   <= ARLEN_FIFO;
      ARSIZE_FIFO  <= ARSIZE_FIFO;
      ARBURST_FIFO <= ARBURST_FIFO;
      R_ID_OUT     <= R_ID_OUT;
      end

end




//Writing in FIFO
always@(posedge clk)
begin
      if( wr_en && ~R_FULL)
      begin
      FIFO[wr_ptr][31:0]  <= ARADDR;
      FIFO[wr_ptr][37:32] <= ARID;
      FIFO[wr_ptr][40:38] <= ARPROT;
      FIFO[wr_ptr][48:41] <= ARLEN;
      FIFO[wr_ptr][51:49] <= ARSIZE;
      FIFO[wr_ptr][53:52] <= ARBURST;
      end

      else
       FIFO[wr_ptr] <= FIFO[wr_ptr];
end

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
//___________________________________CALCULATING FIFO POINTERS___________________________________//
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////





//_________________________________________PUSH POINTER_________________________________________//
///////////////////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk, negedge reset)
begin

        if (~reset) // reset 
        wr_ptr <= 0;  // here we initializing write pointer and give it starting value  = 0


        else if (wr_en && !R_FULL)
        wr_ptr <= wr_ptr + 8'd1 ;  // On write operation, Write pointer points to next location
        else
        wr_ptr <= wr_ptr;
end
///////////////////////////////////////////////////////////////////////////////////////////////////





//_________________________________________POP ADDRESS POINTER_________________________________________//
///////////////////////////////////////////////////////////////////////////////////////////////////

always @(posedge clk, negedge reset)
begin

        if (~reset) // reset 
        rd_ptr_address <= 0;

        else if ( ( (rd_en_address || POP_EMPTY_FLAG)   && !R_EMPTY_ADDRESS) || ( (wr_ptr == 8'd1)   && !R_EMPTY_ADDRESS) )
        rd_ptr_address <= rd_ptr_address + 8'd1; // On read operation, read pointer points to next location to be read

        else
        rd_ptr_address <= rd_ptr_address;


		

end


//_________________________________________POP ID POINTER_________________________________________//
///////////////////////////////////////////////////////////////////////////////////////////////////


always @(posedge clk, negedge reset)
begin

        if (~reset) // reset 
        rd_ptr_id      <= 0;

        else if ( ( (rd_en_id || POP_EMPTY_FLAG)   && !R_EMPTY_ID) || ( (wr_ptr == 8'd1)   && !R_EMPTY_ID) )
        rd_ptr_id      <= rd_ptr_id + 8'd1;   

        else
        rd_ptr_id      <= rd_ptr_id;


		

end

endmodule
