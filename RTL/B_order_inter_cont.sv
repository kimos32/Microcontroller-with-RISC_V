module B_order_inter_cont #(parameter sID_width = 'd6, parameter mID_width = 'd2, parameter seq_width = 'd4)(
  //Input Signals Definition
	input                     clk      ,
	input                     reset_n  ,
	input                     BREADY   ,

	input [sID_width-1:0]     s0_BID   ,
	input [sID_width-1:0]     s1_BID   ,
	input [sID_width-1:0]     s2_BID   ,
  input [sID_width-1:0]     s3_BID   ,
  input [sID_width-1:0]     s4_BID   ,

  input                     s0_BVALID,
  input                     s1_BVALID,
  input                     s2_BVALID,
  input                     s3_BVALID,
  input                     s4_BVALID,

  //Output Signals Definition
  output [2:0]              B_slv_sel,
  output reg                hold
  );

///////////////////Internal Sginals Definition//////////////////////
wire  [sID_width-1:0]   BID          ;
wire                    ID_valid     ;

wire                    count0_update,
                        count1_update,
                        count2_update,
                        count3_update;

wire  [sID_width-1:0]   ID           ;

wire                    count_update ;

///////////////////////Combinational Internal Signal Logic/////////////////////////
assign count_update = count0_update || count1_update || count2_update || count3_update;

///////////////////////Registered Output////////////////////////
always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        hold <= 1'b0;
      end
    else
      begin
        hold <= ~count_update;
      end
  end

/////////////////////////////Arbiter Instantiation//////////////////////////
B_round_robin_arbiter #(.sID_width(sID_width))
                  U0(.clk(clk)                  ,
                     .reset_n(reset_n)          ,
                     .count_update(count_update),

                     .BVALID0(s0_BVALID)        ,
                     .BVALID1(s1_BVALID)        ,
                     .BVALID2(s2_BVALID)        ,
                     .BVALID3(s3_BVALID)        ,
                     .BVALID4(s4_BVALID)        ,

                     .BID0(s0_BID)              ,
                     .BID1(s1_BID)              ,
                     .BID2(s2_BID)              ,
                     .BID3(s3_BID)              ,
                     .BID4(s4_BID)              ,

                     .B_SLV_sel(B_slv_sel)      ,
                     .ID_valid(ID_valid)        ,
                     .ID(ID)
                    );

////////////////////////////Arrived Transactions IDs Counter Istantiaion/////////////////////////

//ID_00
BIDs_trans_counter  #(.ID(2'b00), .ID_width(mID_width), .seq_width(seq_width))
      ID0_counter (.BID(ID)           ,
                   .BREADY(BREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),

                   .countn_update(count0_update)
	                );

//ID_01
BIDs_trans_counter  #(.ID(2'b01), .ID_width(mID_width), .seq_width(seq_width))
      ID1_counter (.BID(ID)           ,
                   .BREADY(BREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),

                   .countn_update(count1_update)
	                );

//ID_10
BIDs_trans_counter  #(.ID(2'b10), .ID_width(mID_width), .seq_width(seq_width))
      ID2_counter (.BID(ID)           ,
                   .BREADY(BREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),

                   .countn_update(count2_update)
	                );

//ID_11
BIDs_trans_counter  #(.ID(2'b11), .ID_width(mID_width), .seq_width(seq_width))
     ID3_counter  (.BID(ID)           ,
                   .BREADY(BREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),

                   .countn_update(count3_update)
	                );

endmodule

