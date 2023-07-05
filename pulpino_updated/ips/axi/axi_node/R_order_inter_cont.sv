module R_order_inter_cont #(parameter sID_width = 'd6, parameter mID_width = 'd2, parameter seq_width = 'd4)(
  //Input Signals Definition
	input                     clk      ,
	input                     reset_n  ,
	input                     RREADY   ,
  input                     RLAST    ,

	input [sID_width-1:0]     s0_RID   ,
	input [sID_width-1:0]     s1_RID   ,
	input [sID_width-1:0]     s2_RID   ,
  input [sID_width-1:0]     s3_RID   ,
  input [sID_width-1:0]     s4_RID   ,

  input                     s0_RVALID,
  input                     s1_RVALID,
  input                     s2_RVALID,
  input                     s3_RVALID,
  input                     s4_RVALID,
  
  //Output Signals Definition
  output [2:0]              R_slv_sel,
  output reg                hold
  );

///////////////////Internal Sginals Definition//////////////////////
wire  [sID_width-1:0]   RID          ;
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
R_round_robin_arbiter #(.sID_width(sID_width))
                  U0(.clk(clk)                  ,
                     .reset_n(reset_n)          ,
                     .count_update(count_update),

                     .RVALID0(s0_RVALID)        ,
                     .RVALID1(s1_RVALID)        ,
                     .RVALID2(s2_RVALID)        ,
                     .RVALID3(s3_RVALID)        ,
                     .RVALID4(s4_RVALID)        ,

                     .RID0(s0_RID)              ,
                     .RID1(s1_RID)              ,
                     .RID2(s2_RID)              ,
                     .RID3(s3_RID)              ,
                     .RID4(s4_RID)              ,

                     .R_SLV_sel(R_slv_sel)      ,
                     .ID_valid(ID_valid)        ,
                     .ID(ID)
                    );

////////////////////////////Arrived Transactions IDs Counter Istantiaion/////////////////////////

//ID_00
RIDs_trans_counter  #(.ID(2'b00), .ID_width(mID_width), .seq_width(seq_width))
      ID0_counter (.RID(ID)           ,
                   .RREADY(RREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),
                   .RLAST(RLAST)      ,

                   .countn_update(count0_update)
	                );

//ID_01
RIDs_trans_counter  #(.ID(2'b01), .ID_width(mID_width), .seq_width(seq_width))
      ID1_counter (.RID(ID)           ,
                   .RREADY(RREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),
                   .RLAST(RLAST)      ,

                   .countn_update(count1_update)
	                );
//ID_10
RIDs_trans_counter  #(.ID(2'b10), .ID_width(mID_width), .seq_width(seq_width))
      ID2_counter (.RID(ID)            ,
                   .RREADY(RREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),
                   .RLAST(RLAST)      ,

                   .countn_update(count2_update)
	                );

//ID_11
RIDs_trans_counter  #(.ID(2'b11), .ID_width(mID_width), .seq_width(seq_width))
     ID3_counter  (.RID(ID)            ,
                   .RREADY(RREADY)    ,
                   .clk(clk)          ,
                   .reset_n(reset_n)  ,
                   .ID_valid(ID_valid),
                   .RLAST(RLAST)      ,

                   .countn_update(count3_update)
	                );

endmodule

