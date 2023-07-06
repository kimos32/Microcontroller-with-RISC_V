module R_crossbar #(parameter ID_width = 'd6, parameter DATA_width = 'd32, parameter mID_width = 'd2, parameter user_width = 'd6)(
    
    //Global Signals Definition
    input                        clk    ,
    input                        reset_n,

	  //Master Signals Definition  
	  output reg [mID_width-1:0]   m_RID   ,
    output reg [DATA_width-1:0]  m_RDATA ,
    output reg [1:0]             m_RRESP ,
    output reg                   m_RLAST ,
    output reg [user_width-1:0]  m_RUSER ,
    output reg                   m_RVALID,
    input                        m_RREADY,
                                 
    //Slave0 Signals Definition  
    input [ID_width-1:0]         s0_RID   ,
    input [DATA_width-1:0]       s0_RDATA ,
    input [1:0]                  s0_RRESP ,
    input                        s0_RLAST ,
    input [user_width-1:0]       s0_RUSER ,
    input                        s0_RVALID,
    output reg                   s0_RREADY,
                                 
    //Slave1 Signals Definition  
    input [ID_width-1:0]         s1_RID   ,
    input [DATA_width-1:0]       s1_RDATA ,
    input [1:0]                  s1_RRESP ,
    input                        s1_RLAST ,
    input [user_width-1:0]       s1_RUSER ,
    input                        s1_RVALID,
    output reg                   s1_RREADY,
                                 
    //Slave2 Signals Definition  
    input [ID_width-1:0]         s2_RID   ,
    input [DATA_width-1:0]       s2_RDATA ,
    input [1:0]                  s2_RRESP ,
    input                        s2_RLAST ,
    input [user_width-1:0]       s2_RUSER ,
    input                        s2_RVALID,
    output reg                   s2_RREADY,

    //Slave3 Signals Definition
    input [ID_width-1:0]         s3_RID   ,
    input [DATA_width-1:0]       s3_RDATA ,
    input [1:0]                  s3_RRESP ,
    input                        s3_RLAST ,
    input [user_width-1:0]       s3_RUSER ,
    input                        s3_RVALID,
    output reg                   s3_RREADY,

    //Slave4 Signals Definition
    input [ID_width-1:0]         s4_RID   ,
    input [DATA_width-1:0]       s4_RDATA ,
    input [1:0]                  s4_RRESP ,
    input                        s4_RLAST ,
    input [user_width-1:0]       s4_RUSER ,
    input                        s4_RVALID,
    output reg                   s4_RREADY,
                                 
    //Input Signals Definition -R_order_inter_cont. Signals
    input [2:0]                  R_SLV_sel,
    input                        R_hold
	);

////////////////////Internal Signals Definition///////////////////////
reg [mID_width-1:0]   m_RID_comb  ;
reg [DATA_width-1:0]  m_RDATA_comb;
reg [1:0]             m_RRESP_comb;
reg [user_width-1:0]  m_RUSER_comb;

reg                   m_RVALID_comb,
                      m_RLAST_comb ;

reg                   s0_RREADY_comb,
                      s1_RREADY_comb,
                      s2_RREADY_comb,
                      s3_RREADY_comb,
                      s4_RREADY_comb;

///////////////////Crossbar Decoding Slaves///////////////////////
always @(*)
  begin
    s0_RREADY_comb = 1'b0 ;
    s1_RREADY_comb = 1'b0 ;
    s2_RREADY_comb = 1'b0 ;
    s3_RREADY_comb = 1'b0 ;
    s4_RREADY_comb = 1'b0 ;
    m_RID_comb     = 'd0  ;
    m_RDATA_comb   = 'd0  ;
    m_RRESP_comb   = 2'b00;
    m_RLAST_comb   = 1'b0 ;
    m_RVALID_comb  = 1'b0 ;
    m_RUSER_comb   = 'd0  ;

    case(R_SLV_sel)
      3'b000: begin
               m_RID_comb   = s0_RID[mID_width-1:0];
               m_RDATA_comb = s0_RDATA;
               m_RRESP_comb = s0_RRESP;
               m_RLAST_comb = s0_RLAST;
               m_RUSER_comb = s0_RUSER;
               if(R_hold)
                 begin
                   s0_RREADY_comb = 1'b0;
                   m_RVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s0_RREADY_comb = m_RREADY ;
                   m_RVALID_comb  = s0_RVALID;
                 end
              end

      3'b001: begin
               m_RID_comb   = s1_RID[mID_width-1:0];
               m_RDATA_comb = s1_RDATA;
               m_RRESP_comb = s1_RRESP;
               m_RLAST_comb = s1_RLAST;
               m_RUSER_comb = s1_RUSER;
               if(R_hold)
                 begin
                   s1_RREADY_comb = 1'b0;
                   m_RVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s1_RREADY_comb = m_RREADY;
                   m_RVALID_comb  = s1_RVALID;
                 end
              end

      3'b010: begin
               m_RID_comb   = s2_RID[mID_width-1:0];
               m_RDATA_comb = s2_RDATA;
               m_RRESP_comb = s2_RRESP;
               m_RLAST_comb = s2_RLAST;
               m_RUSER_comb = s2_RUSER;
               if(R_hold)
                 begin
                   s2_RREADY_comb = 1'b0;
                   m_RVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s2_RREADY_comb = m_RREADY;
                   m_RVALID_comb  = s2_RVALID;
                 end
              end
      
      3'b011: begin
               m_RID_comb   = s3_RID[mID_width-1:0];
               m_RDATA_comb = s3_RDATA;
               m_RRESP_comb = s3_RRESP;
               m_RLAST_comb = s3_RLAST;
               m_RUSER_comb = s3_RUSER;
               if(R_hold)
                 begin
                   s3_RREADY_comb = 1'b0;
                   m_RVALID_comb  = 1'b0;
                 end
               else
                 begin
                   s3_RREADY_comb = m_RREADY;
                   m_RVALID_comb  = s3_RVALID;
                 end
              end
      
      3'b100: begin
               m_RID_comb   = s4_RID[mID_width-1:0];
               m_RDATA_comb = s4_RDATA;
               m_RRESP_comb = s4_RRESP;
               m_RLAST_comb = s4_RLAST;
               m_RUSER_comb = s4_RUSER;
               if(R_hold)
                 begin
                   s4_RREADY_comb = 1'b0;
                   m_RVALID_comb  = 1'b0;
                 end 
               else
                 begin
                   s4_RREADY_comb = m_RREADY;
                   m_RVALID_comb  = s4_RVALID;
                 end
              end
		
		default: begin
                 s0_RREADY_comb = 1'b0 ;
                 s1_RREADY_comb = 1'b0 ;
                 s2_RREADY_comb = 1'b0 ;
                 s3_RREADY_comb = 1'b0 ;
                 s4_RREADY_comb = 1'b0 ;
                 m_RID_comb     = 'd0  ;
                 m_RDATA_comb   = 'd0  ;
                 m_RRESP_comb   = 2'b00;
                 m_RLAST_comb   = 1'b0 ;
                 m_RVALID_comb  = 1'b0 ;
                 m_RUSER_comb   = 'd0  ;
               end

    endcase
  end

///////////////////////Registered Outputs//////////////////////////
always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        s0_RREADY <= 1'b0;
        s1_RREADY <= 1'b0;
        s2_RREADY <= 1'b0;
        s3_RREADY <= 1'b0;
        s4_RREADY <= 1'b0;
        m_RID     <= 'd0;
        m_RDATA   <= 'd0;
        m_RRESP   <= 2'b00;
        m_RLAST   <= 1'b0;
        m_RVALID  <= 1'b0;
        m_RUSER   <= 'd0;
      end
    else
      begin
        s0_RREADY <= s0_RREADY_comb;
        s1_RREADY <= s1_RREADY_comb;
        s2_RREADY <= s2_RREADY_comb;
        s3_RREADY <= s3_RREADY_comb;
        s4_RREADY <= s4_RREADY_comb;
        m_RID     <= m_RID_comb;
        m_RDATA   <= m_RDATA_comb;
        m_RRESP   <= m_RRESP_comb;
        m_RLAST   <= m_RLAST_comb;
        m_RVALID  <= m_RVALID_comb;
        m_RUSER   <= m_RUSER_comb;
    end
  end

endmodule