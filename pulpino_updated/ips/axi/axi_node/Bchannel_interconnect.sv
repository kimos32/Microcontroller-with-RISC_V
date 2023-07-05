module Bchannel_interconnect #(parameter sID_width = 'd6, parameter mID_width = 'd2, parameter seq_width = 'd4, user_width = 'd1)(
	//Global Signals Definition
	input                      clk    ,
	input                      reset_n,
    
    //Master Signals Definition
	output [mID_width-1:0]     m_BID   ,
    output [1:0]               m_BRESP ,
    output                     m_BVALID,
    output [user_width-1:0]    m_BUSER ,
    input                      m_BREADY,

    //Slave0 Signals Definition
    input [sID_width-1:0]      s0_BID   ,
    input [1:0]                s0_BRESP ,
    input                      s0_BVALID,
    input [user_width-1:0]     s0_BUSER ,
    output                     s0_BREADY, 

    //Slave1 Signals Definition
    input [sID_width-1:0]      s1_BID   ,
    input [1:0]                s1_BRESP ,
    input                      s1_BVALID,
    input [user_width-1:0]     s1_BUSER ,
    output                     s1_BREADY,

    //Slave2 Signals Definition
    input [sID_width-1:0]      s2_BID   ,
    input [1:0]                s2_BRESP ,
    input                      s2_BVALID,
    input [user_width-1:0]     s2_BUSER ,
    output                     s2_BREADY,
                               
    //Slave3 Signals Definition
    input [sID_width-1:0]      s3_BID   ,
    input [1:0]                s3_BRESP ,
    input                      s3_BVALID,
    input [user_width-1:0]     s3_BUSER ,
    output                     s3_BREADY,

    //Slave4 Signals Definition
    input [sID_width-1:0]      s4_BID   ,
    input [1:0]                s4_BRESP ,
    input                      s4_BVALID,
    input [user_width-1:0]     s4_BUSER ,
    output                     s4_BREADY
	);

////////////Internal Signals Definition////////////////
wire [2:0]      B_SLV_sel;

wire            B_hold;

/////////////////Crossbar Block Instance//////////////////////////
B_crossbar #(.mID_width(mID_width), .ID_width(sID_width), .user_width(user_width))
                 BU0(.clk(clk)          , 
                     .reset_n(reset_n)  ,
                     
                     .m_BID(m_BID)      ,
                     .m_BRESP(m_BRESP)  ,
                     .m_BVALID(m_BVALID),
                     .m_BUSER(m_BUSER)  ,
                     .m_BREADY(m_BREADY),

                     .s0_BID(s0_BID)      ,
                     .s0_BRESP(s0_BRESP)  ,
                     .s0_BVALID(s0_BVALID),
                     .s0_BUSER(s0_BUSER)  ,
                     .s0_BREADY(s0_BREADY), 

                     .s1_BID(s1_BID)      ,
                     .s1_BRESP(s1_BRESP)  ,
                     .s1_BVALID(s1_BVALID),
                     .s1_BUSER(s1_BUSER)  ,
                     .s1_BREADY(s1_BREADY),

                     .s2_BID(s2_BID)      ,
                     .s2_BRESP(s2_BRESP)  ,
                     .s2_BVALID(s2_BVALID),
                     .s2_BUSER(s2_BUSER)  ,
                     .s2_BREADY(s2_BREADY),

                     .s3_BID(s3_BID)      ,
                     .s3_BRESP(s3_BRESP)  ,
                     .s3_BVALID(s3_BVALID),
                     .s3_BUSER(s3_BUSER)  ,
                     .s3_BREADY(s3_BREADY),

                     .s4_BID(s4_BID)      ,
                     .s4_BRESP(s4_BRESP)  ,
                     .s4_BVALID(s4_BVALID),
                     .s4_BUSER(s4_BUSER)  ,
                     .s4_BREADY(s4_BREADY),

                     .B_SLV_sel(B_SLV_sel),
                     .B_hold(B_hold)
	                );

///////////////////Ordering Control Unit Instance//////////////////////
B_order_inter_cont  #(.sID_width(sID_width), .mID_width(mID_width), .seq_width(seq_width))
                BU1(.clk(clk)            ,
                    .reset_n(reset_n)    ,
                    .BREADY(m_BREADY)    ,
                    .s0_BID(s0_BID)      ,
                    .s1_BID(s1_BID)      ,
                    .s2_BID(s2_BID)      ,
                    .s3_BID(s3_BID)      ,
                    .s4_BID(s4_BID)      ,
                    .s0_BVALID(s0_BVALID),
                    .s1_BVALID(s1_BVALID),
                    .s2_BVALID(s2_BVALID),
                    .s3_BVALID(s3_BVALID),
                    .s4_BVALID(s4_BVALID),
                    
                    .B_slv_sel(B_SLV_sel),
                    .hold(B_hold)
                   );

endmodule


