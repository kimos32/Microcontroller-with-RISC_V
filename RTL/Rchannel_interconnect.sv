module Rchannel_interconnect #(parameter sID_width = 'd6, parameter mID_width = 'd2, parameter seq_width = 'd4,
	                           parameter DATA_width = 'd32, parameter user_width = 'd1)(
	//Global Signals Definition
	input                    clk    ,
	input                    reset_n,
                             
	//Master Signals Definition
	output [mID_width-1:0]   m_RID   ,
    output [DATA_width-1:0]  m_RDATA ,
    output [1:0]             m_RRESP ,
    output                   m_RLAST ,
    output [user_width-1:0]  m_RUSER ,
    output                   m_RVALID,
    input                    m_RREADY,
                             
    //Slave0 Signals Definition
    input [sID_width-1:0]    s0_RID   ,
    input [DATA_width-1:0]   s0_RDATA ,
    input [1:0]              s0_RRESP ,
    input                    s0_RLAST ,
    input [user_width-1:0]   s0_RUSER ,
    input                    s0_RVALID,
    output                   s0_RREADY,
                             
    //Slave1 Signals Definition
    input [sID_width-1:0]    s1_RID   ,
    input [DATA_width-1:0]   s1_RDATA ,
    input [1:0]              s1_RRESP ,
    input                    s1_RLAST ,
    input [user_width-1:0]   s1_RUSER ,
    input                    s1_RVALID,
    output                   s1_RREADY,

    //Slave2 Signals Definition
    input [sID_width-1:0]    s2_RID   ,
    input [DATA_width-1:0]   s2_RDATA ,
    input [1:0]              s2_RRESP ,
    input                    s2_RLAST ,
    input [user_width-1:0]   s2_RUSER ,
    input                    s2_RVALID,
    output                   s2_RREADY,

    //Slave3 Signals Definition
    input [sID_width-1:0]    s3_RID   ,
    input [DATA_width-1:0]   s3_RDATA ,
    input [1:0]              s3_RRESP ,
    input                    s3_RLAST ,
    input [user_width-1:0]   s3_RUSER ,
    input                    s3_RVALID,
    output                   s3_RREADY,

    //Slave4 Signals Definition
    input [sID_width-1:0]    s4_RID   ,
    input [DATA_width-1:0]   s4_RDATA ,
    input [1:0]              s4_RRESP ,
    input                    s4_RLAST ,
    input [user_width-1:0]   s4_RUSER ,
    input                    s4_RVALID,
    output                   s4_RREADY
	);

////////////Internal Signals Definition////////////////
wire [2:0]      R_SLV_sel;

wire            R_hold   ;
reg             RLAST    ;

///////////////RLAST Signal Assignment////////////////
always @(*)
  begin
    case(R_SLV_sel)
      3'b000: begin
               RLAST = s0_RLAST;
             end 

      3'b001: begin
               RLAST = s1_RLAST;
             end

      3'b010: begin
               RLAST = s2_RLAST;
             end
      
      3'b011: begin
               RLAST = s3_RLAST;
             end

      3'b100: begin
               RLAST = s4_RLAST;
             end

      default: begin
                 RLAST = 1'b0;
               end
    endcase
  end

/////////////////Crossbar Block Instance//////////////////////////
R_crossbar #(.ID_width(sID_width), .DATA_width(DATA_width), .mID_width(mID_width), .user_width(user_width))
           RU0(.clk(clk)          ,
               .reset_n(reset_n)  ,

               .m_RID(m_RID)      ,
               .m_RDATA(m_RDATA)  ,
               .m_RRESP(m_RRESP)  ,
               .m_RLAST(m_RLAST)  ,
               .m_RUSER(m_RUSER)  ,
               .m_RVALID(m_RVALID),
               .m_RREADY(m_RREADY),

               .s0_RID(s0_RID)      ,
               .s0_RDATA(s0_RDATA)  ,
               .s0_RRESP(s0_RRESP)  ,
               .s0_RLAST(s0_RLAST)  ,
               .s0_RUSER(s0_RUSER)  ,
               .s0_RVALID(s0_RVALID),
               .s0_RREADY(s0_RREADY),

               .s1_RID(s1_RID)      ,
               .s1_RDATA(s1_RDATA)  ,
               .s1_RRESP(s1_RRESP)  ,
               .s1_RLAST(s1_RLAST)  ,
               .s1_RUSER(s1_RUSER)  ,
               .s1_RVALID(s1_RVALID),
               .s1_RREADY(s1_RREADY),

               .s2_RID(s2_RID)      ,
               .s2_RDATA(s2_RDATA)  ,
               .s2_RRESP(s2_RRESP)  ,
               .s2_RLAST(s2_RLAST)  ,
               .s2_RUSER(s2_RUSER)  ,
               .s2_RVALID(s2_RVALID),
               .s2_RREADY(s2_RREADY),

               .s3_RID(s3_RID)      ,
               .s3_RDATA(s3_RDATA)  ,
               .s3_RRESP(s3_RRESP)  ,
               .s3_RLAST(s3_RLAST)  ,
               .s3_RUSER(s3_RUSER)  ,
               .s3_RVALID(s3_RVALID),
               .s3_RREADY(s3_RREADY),

               .s4_RID(s4_RID)      ,
               .s4_RDATA(s4_RDATA)  ,
               .s4_RRESP(s4_RRESP)  ,
               .s4_RLAST(s4_RLAST)  ,
               .s4_RUSER(s4_RUSER)  ,
               .s4_RVALID(s4_RVALID),
               .s4_RREADY(s4_RREADY),

               .R_SLV_sel(R_SLV_sel),
               .R_hold(R_hold)
	          );

///////////////////Ordering Control Unit Instance//////////////////////
R_order_inter_cont  #(.sID_width(sID_width), .mID_width(mID_width), .seq_width(seq_width))
                RU1(.clk(clk)            ,
                    .reset_n(reset_n)    ,
                    .RREADY(m_RREADY)    ,
                    .RLAST(RLAST)        ,

                    .s0_RID(s0_RID)      ,
                    .s1_RID(s1_RID)      ,
                    .s2_RID(s2_RID)      ,
                    .s3_RID(s3_RID)      ,
                    .s4_RID(s4_RID)      ,

                    .s0_RVALID(s0_RVALID),
                    .s1_RVALID(s1_RVALID),
                    .s2_RVALID(s2_RVALID),
                    .s3_RVALID(s3_RVALID),
                    .s4_RVALID(s4_RVALID),
                    
                    .R_slv_sel(R_SLV_sel),
                    .hold(R_hold)
                   );

endmodule
