module B_crossbar #(parameter mID_width = 'd2, parameter ID_width = 'd6, parameter user_width = 'd6)(
    
    //Global Signals Definition
    input                          clk    ,
    input                          reset_n,
	                                 
    //Master Signals Definition            
	  output reg [mID_width-1:0]     m_BID   ,
    output reg [1:0]               m_BRESP ,
    output reg                     m_BVALID,
    output reg [user_width-1:0]    m_BUSER ,
    input                          m_BREADY,

    //Slave0 Signals Definition
    input [ID_width-1:0]           s0_BID   ,
    input [1:0]                    s0_BRESP ,
    input                          s0_BVALID,
    input [user_width-1:0]         s0_BUSER ,
    output reg                     s0_BREADY, 

    //Slave1 Signals Definition
    input [ID_width-1:0]           s1_BID   ,
    input [1:0]                    s1_BRESP ,
    input                          s1_BVALID,
    input [user_width-1:0]         s1_BUSER ,
    output reg                     s1_BREADY,

    //Slave2 Signals Definition
    input [ID_width-1:0]           s2_BID   ,
    input [1:0]                    s2_BRESP ,
    input                          s2_BVALID,
    input [user_width-1:0]         s2_BUSER ,
    output reg                     s2_BREADY,

    //Slave3 Signals Definition
    input [ID_width-1:0]           s3_BID   ,
    input [1:0]                    s3_BRESP ,
    input                          s3_BVALID,
    input [user_width-1:0]         s3_BUSER ,
    output reg                     s3_BREADY,

    //Slave4 Signals Definition
    input [ID_width-1:0]           s4_BID   ,
    input [1:0]                    s4_BRESP ,
    input                          s4_BVALID,
    input [user_width-1:0]         s4_BUSER ,
    output reg                     s4_BREADY,

    //Input Signals Definition -B_order_inter_cont. Signals
    input [2:0]                    B_SLV_sel,
    input                          B_hold
	);

////////////////////Internal Signals Definition///////////////////////
reg [user_width-1:0]  m_BUSER_comb;
reg [mID_width-1:0]   m_BID_comb  ;
reg [1:0]             m_BRESP_comb;

reg                   m_BVALID_comb ,
                      s0_BREADY_comb,
                      s1_BREADY_comb,
                      s2_BREADY_comb,
                      s3_BREADY_comb,
                      s4_BREADY_comb;
              

///////////////////Crossbar Decoding Slaves///////////////////////
always @(*)
  begin
    s0_BREADY_comb = 1'b0 ;
    s1_BREADY_comb = 1'b0 ;
    s2_BREADY_comb = 1'b0 ;
    s3_BREADY_comb = 1'b0 ;
    s4_BREADY_comb = 1'b0 ;
    m_BID_comb     = 'd0  ;
    m_BRESP_comb   = 2'b00;
    m_BVALID_comb  = 1'b0 ;
    m_BUSER_comb   = 'd0  ;

    case(B_SLV_sel)
      3'b000: begin
               m_BID_comb   = s0_BID[mID_width-1:0];
               m_BRESP_comb = s0_BRESP;
               m_BUSER_comb = s0_BUSER;
               if(B_hold)
                 begin
                   s0_BREADY_comb = 1'b0;
                   m_BVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s0_BREADY_comb = m_BREADY;
                   m_BVALID_comb  = s0_BVALID;
                 end
              end

      3'b001: begin
               m_BID_comb   = s1_BID[mID_width-1:0];
               m_BRESP_comb = s1_BRESP;
               m_BUSER_comb = s1_BUSER;
               if(B_hold)
                 begin
                   s1_BREADY_comb = 1'b0;
                   m_BVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s1_BREADY_comb = m_BREADY;
                   m_BVALID_comb  = s1_BVALID;
                 end
              end

      3'b010: begin
               m_BID_comb   = s2_BID[mID_width-1:0];
               m_BRESP_comb = s2_BRESP;
               m_BUSER_comb = s2_BUSER;
               if(B_hold)
                 begin
                   s2_BREADY_comb = 1'b0;
                   m_BVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s2_BREADY_comb = m_BREADY;
                   m_BVALID_comb  = s2_BVALID;
                 end
              end
      
      3'b011: begin
               m_BID_comb   = s3_BID[mID_width-1:0];
               m_BRESP_comb = s3_BRESP;
               m_BUSER_comb = s3_BUSER;
               if(B_hold)
                 begin
                   s3_BREADY_comb = 1'b0;
                   m_BVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s3_BREADY_comb = m_BREADY;
                   m_BVALID_comb  = s3_BVALID;
                 end
              end
      
      3'b100: begin
               m_BID_comb   = s4_BID[mID_width-1:0];
               m_BRESP_comb = s4_BRESP;
               m_BUSER_comb = s4_BUSER;
               if(B_hold)
                 begin
                   s4_BREADY_comb = 1'b0;
                   m_BVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s4_BREADY_comb = m_BREADY;
                   m_BVALID_comb  = s4_BVALID;
                 end
              end

      default: begin
                 s0_BREADY_comb = 1'b0 ;
                 s1_BREADY_comb = 1'b0 ;
                 s2_BREADY_comb = 1'b0 ;
                 s3_BREADY_comb = 1'b0 ;
                 s4_BREADY_comb = 1'b0 ;
                 m_BID_comb     = 'd0  ;
                 m_BRESP_comb   = 2'b00;
                 m_BVALID_comb  = 1'b0 ;
                 m_BUSER_comb   = 'd0  ;
               end
    endcase
  end

///////////////////////Registered Outputs//////////////////////////
always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        s0_BREADY <= 1'b0;
        s1_BREADY <= 1'b0;
        s2_BREADY <= 1'b0;
        s3_BREADY <= 1'b0;
        s4_BREADY <= 1'b0;
        m_BID     <= 'd0;
        m_BRESP   <= 2'b00;
        m_BVALID  <= 1'b0;
        m_BUSER   <= 'd0;
      end
    else
      begin
        s0_BREADY <= s0_BREADY_comb;
        s1_BREADY <= s1_BREADY_comb;
        s2_BREADY <= s2_BREADY_comb;
        s3_BREADY <= s3_BREADY_comb;
        s4_BREADY <= s4_BREADY_comb;
        m_BID     <= m_BID_comb;
        m_BRESP   <= m_BRESP_comb;
        m_BVALID  <= m_BVALID_comb;
        m_BUSER   <= m_BUSER_comb;
      end
  end
endmodule


