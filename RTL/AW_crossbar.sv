module AW_crossbar #(parameter ID_width = 'd6, parameter ADDR_width = 'd32)(
	////////////MASTER///////
	input                    clk,
	input                    reset_n,
	output reg                   m_AWREADY,
	input                    m_AWVALID,
	input [ID_width-1:0]     m_AWID,
    input [ADDR_width-1:0]   m_AWADDR,
    input [7:0]              m_AWLEN,
    input [2:0]              m_AWSIZE,
    input [1:0]              m_AWBURST,
    input [3:0]              m_AWCACHE,
    input [1:0]              m_AWLOCK,
    input [2:0]              m_AWPROT,
    input [3:0]              m_AWQOS,
    input [3:0]              m_AWREGION,
    input                    m_AWUSER,

    ///////////SLAVE 0///////////////
    input                    s0_AWREADY,
	output reg                  s0_AWVALID,
	output reg [ID_width-1:0]     s0_AWID,
    output reg [ADDR_width-1:0]   s0_AWADDR,
    output reg [7:0]              s0_AWLEN,
    output reg [2:0]              s0_AWSIZE,
    output reg [1:0]              s0_AWBURST,
    output reg [3:0]              s0_AWCACHE,
    output reg [1:0]              s0_AWLOCK,
    output reg [2:0]              s0_AWPROT,
    output reg [3:0]              s0_AWQOS,
    output reg [3:0]              s0_AWREGION,
    output reg                    s0_AWUSER,
    
    ///////////////SLAVE 1//////////////////
    input                    s1_AWREADY,
	output reg                   s1_AWVALID,
	output reg [ID_width-1:0]     s1_AWID,
    output reg [ADDR_width-1:0]   s1_AWADDR,
    output reg [7:0]              s1_AWLEN,
    output reg [2:0]              s1_AWSIZE,
    output reg [1:0]              s1_AWBURST,
    output reg [3:0]              s1_AWCACHE,
    output reg [1:0]              s1_AWLOCK,
    output reg [2:0]              s1_AWPROT,
    output reg [3:0]              s1_AWQOS,
    output reg[3:0]              s1_AWREGION,
    output reg                   s1_AWUSER,

    ////////////////SLAVE 2/////////////////////
    input                    s2_AWREADY,
	output reg                   s2_AWVALID,
	output reg [ID_width-1:0]     s2_AWID,
    output reg [ADDR_width-1:0]   s2_AWADDR,
    output reg [7:0]              s2_AWLEN,
    output reg [2:0]              s2_AWSIZE,
    output reg [1:0]              s2_AWBURST,
    output reg [3:0]              s2_AWCACHE,
    output reg [1:0]              s2_AWLOCK,
    output reg [2:0]              s2_AWPROT,
    output reg [3:0]              s2_AWQOS,
    output reg [3:0]              s2_AWREGION,
    output reg                   s2_AWUSER,
    
    
    
    
    
    
  ////////////////SLAVE 3/////////////////////
    input                    s3_AWREADY,
	output reg                   s3_AWVALID,
	output reg [ID_width-1:0]     s3_AWID,
    output reg [ADDR_width-1:0]   s3_AWADDR,
    output reg [7:0]              s3_AWLEN,
    output reg [2:0]              s3_AWSIZE,
    output reg [1:0]              s3_AWBURST,
    output reg [3:0]              s3_AWCACHE,
    output reg [1:0]              s3_AWLOCK,
    output reg [2:0]              s3_AWPROT,
    output reg [3:0]              s3_AWQOS,
    output reg [3:0]              s3_AWREGION,
    output reg                   s3_AWUSER,
    
    
  ////////////////SLAVE 4/////////////////////
    input                    s4_AWREADY,
	output reg                   s4_AWVALID,
	output reg [ID_width-1:0]     s4_AWID,
    output reg [ADDR_width-1:0]   s4_AWADDR,
    output reg [7:0]              s4_AWLEN,
    output reg [2:0]              s4_AWSIZE,
    output reg [1:0]              s4_AWBURST,
    output reg [3:0]              s4_AWCACHE,
    output reg [1:0]              s4_AWLOCK,
    output reg [2:0]              s4_AWPROT,
    output reg [3:0]              s4_AWQOS,
    output reg [3:0]              s4_AWREGION,
    output reg                   s4_AWUSER,
    
////////////////SLAVE 4/////////////////////
    input                    s5_AWREADY,
	output reg                   s5_AWVALID,
	output reg [ID_width-1:0]     s5_AWID,
    output reg [ADDR_width-1:0]   s5_AWADDR,
    output reg [7:0]              s5_AWLEN,
    output reg [2:0]              s5_AWSIZE,
    output reg [1:0]              s5_AWBURST,
    output reg [3:0]              s5_AWCACHE,
    output reg [1:0]              s5_AWLOCK,
    output reg [2:0]              s5_AWPROT,
    output reg [3:0]              s5_AWQOS,
    output reg [3:0]              s5_AWREGION,
    output reg                   s5_AWUSER );




always @ (*)
begin 
  
m_AWREADY = 0 ;
s1_AWVALID = 0 ;
s1_AWID = 0 ;
s1_AWADDR = 0 ;
s1_AWLEN = 0 ;
s1_AWSIZE = 0 ;
s1_AWBURST = 0 ;
s1_AWCACHE = 0 ;
s1_AWLOCK = 0 ;
s1_AWPROT = 0 ;
s1_AWQOS = 0 ;
s1_AWREGION = 0 ;
s1_AWUSER = 0 ;


s0_AWVALID = 0 ;
s0_AWID = 0 ;
s0_AWADDR = 0 ;
s0_AWLEN = 0 ;
s0_AWSIZE = 0 ;
s0_AWBURST = 0 ;
s0_AWCACHE = 0 ;
s0_AWLOCK = 0 ;
s0_AWPROT = 0 ;
s0_AWQOS = 0 ;
s0_AWREGION = 0 ;
s0_AWUSER = 0 ;


s2_AWVALID = 0 ;
s2_AWID = 0 ;
s2_AWADDR = 0 ;
s2_AWLEN = 0 ;
s2_AWSIZE = 0 ;
s2_AWBURST = 0 ;
s2_AWCACHE = 0 ;
s2_AWLOCK = 0 ;
s2_AWPROT = 0 ;
s2_AWQOS = 0 ;
s2_AWREGION = 0 ;
s2_AWUSER = 0 ;




s3_AWVALID = 0 ;
s3_AWID = 0 ;
s3_AWADDR = 0 ;
s3_AWLEN = 0 ;
s3_AWSIZE = 0 ;
s3_AWBURST = 0 ;
s3_AWCACHE = 0 ;
s3_AWLOCK = 0 ;
s3_AWPROT = 0 ;
s3_AWQOS = 0 ;
s3_AWREGION = 0 ;
s3_AWUSER = 0 ;




s4_AWVALID = 0 ;
s4_AWID = 0 ;
s4_AWADDR = 0 ;
s4_AWLEN = 0 ;
s4_AWSIZE = 0 ;
s4_AWBURST = 0 ;
s4_AWCACHE = 0 ;
s4_AWLOCK = 0 ;
s4_AWPROT = 0 ;
s4_AWQOS = 0 ;
s4_AWREGION = 0 ;
s4_AWUSER = 0 ;




s5_AWVALID = 0 ;
s5_AWID = 0 ;
s5_AWADDR = 0 ;
s5_AWLEN = 0 ;
s5_AWSIZE = 0 ;
s5_AWBURST = 0 ;
s5_AWCACHE = 0 ;
s5_AWLOCK = 0 ;
s5_AWPROT = 0 ;
s5_AWQOS = 0 ;
s5_AWREGION = 0 ;
s5_AWUSER = 0 ;




case (m_AWADDR[ADDR_width-1:ADDR_width/2])
 

16'h0000: begin
if ( m_AWADDR[(ADDR_width/2)-1:0] < 16'h8000)
begin
m_AWREADY = s0_AWREADY ;
s0_AWVALID = m_AWVALID ;
s0_AWID = m_AWID;
s0_AWADDR = m_AWADDR;
s0_AWLEN = m_AWLEN;
s0_AWSIZE = m_AWSIZE;
s0_AWBURST = m_AWBURST;
s0_AWCACHE = m_AWCACHE ;
s0_AWLOCK = m_AWLOCK ;
s0_AWPROT = m_AWPROT ;
s0_AWQOS = m_AWQOS ;
s0_AWREGION = m_AWREGION ;
s0_AWUSER = m_AWUSER ;  
end
else 
begin
m_AWREADY = s5_AWREADY ;
s5_AWVALID = m_AWVALID ;
s5_AWID = m_AWID;
s5_AWADDR = m_AWADDR;
s5_AWLEN = m_AWLEN;
s5_AWSIZE = m_AWSIZE;
s5_AWBURST = m_AWBURST;
s5_AWCACHE = m_AWCACHE ;
s5_AWLOCK = m_AWLOCK ;
s5_AWPROT = m_AWPROT ;
s5_AWQOS = m_AWQOS ;
s5_AWREGION = m_AWREGION ;
s5_AWUSER = m_AWUSER ;  
end
end

16'h0008: begin
if ( m_AWADDR[(ADDR_width/2)-1:0] < 16'h0200 )
begin
m_AWREADY = s1_AWREADY ;
s1_AWVALID = m_AWVALID ;
s1_AWID = m_AWID;
s1_AWADDR = m_AWADDR;
s1_AWLEN = m_AWLEN;
s1_AWSIZE = m_AWSIZE;
s1_AWBURST = m_AWBURST;
s1_AWCACHE = m_AWCACHE ;
s1_AWLOCK = m_AWLOCK ;
s1_AWPROT = m_AWPROT ;
s1_AWQOS = m_AWQOS ;
s1_AWREGION = m_AWREGION ;
s1_AWUSER = m_AWUSER ;  
end
else 
begin
m_AWREADY = s5_AWREADY ;
s5_AWVALID = m_AWVALID ;
s5_AWID = m_AWID;
s5_AWADDR = m_AWADDR;
s5_AWLEN = m_AWLEN;
s5_AWSIZE = m_AWSIZE;
s5_AWBURST = m_AWBURST;
s5_AWCACHE = m_AWCACHE ;
s5_AWLOCK = m_AWLOCK ;
s5_AWPROT = m_AWPROT ;
s5_AWQOS = m_AWQOS ;
s5_AWREGION = m_AWREGION ;
s5_AWUSER = m_AWUSER ;  
end  

end

16'h0010: begin	
if (m_AWADDR[(ADDR_width/2)-1:0] < 16'h8000 )
begin
m_AWREADY = s2_AWREADY ;
s2_AWVALID = m_AWVALID ;
s2_AWID = m_AWID;
s2_AWADDR = m_AWADDR;
s2_AWLEN = m_AWLEN;
s2_AWSIZE = m_AWSIZE;
s2_AWBURST = m_AWBURST;
s2_AWCACHE = m_AWCACHE ;
s2_AWLOCK = m_AWLOCK ;
s2_AWPROT = m_AWPROT ;
s2_AWQOS = m_AWQOS ;
s2_AWREGION = m_AWREGION ;
s2_AWUSER = m_AWUSER ;  
end
else 
begin
m_AWREADY = s5_AWREADY ;
s5_AWVALID = m_AWVALID ;
s5_AWID = m_AWID;
s5_AWADDR = m_AWADDR;
s5_AWLEN = m_AWLEN;
s5_AWSIZE = m_AWSIZE;
s5_AWBURST = m_AWBURST;
s5_AWCACHE = m_AWCACHE ;
s5_AWLOCK = m_AWLOCK ;
s5_AWPROT = m_AWPROT ;
s5_AWQOS = m_AWQOS ;
s5_AWREGION = m_AWREGION ;
s5_AWUSER = m_AWUSER ;  
end  
end
16'h1A10: begin
m_AWREADY = s3_AWREADY ;
s3_AWVALID = m_AWVALID ;
s3_AWID = m_AWID;
s3_AWADDR = m_AWADDR;
s3_AWLEN = m_AWLEN;
s3_AWSIZE = m_AWSIZE;
s3_AWBURST = m_AWBURST;
s3_AWCACHE = m_AWCACHE ;
s3_AWLOCK = m_AWLOCK ;
s3_AWPROT = m_AWPROT ;
s3_AWQOS = m_AWQOS ;
s3_AWREGION = m_AWREGION ;
s3_AWUSER = m_AWUSER ;  
end

16'h1A11: begin
m_AWREADY = s3_AWREADY ;
s3_AWVALID = m_AWVALID ;
s3_AWID = m_AWID;
s3_AWADDR = m_AWADDR;
s3_AWLEN = m_AWLEN;
s3_AWSIZE = m_AWSIZE;
s3_AWBURST = m_AWBURST;
s3_AWCACHE = m_AWCACHE ;
s3_AWLOCK = m_AWLOCK ;
s3_AWPROT = m_AWPROT ;
s3_AWQOS = m_AWQOS ;
s3_AWREGION = m_AWREGION ;
s3_AWUSER = m_AWUSER ;  
end

16'h0002: begin	
if (m_AWADDR[(ADDR_width/2)-1:0] < 16'h1000 )
begin  
m_AWREADY = s4_AWREADY ;
s4_AWVALID = m_AWVALID ;
s4_AWID = m_AWID;
s4_AWADDR = m_AWADDR;
s4_AWLEN = m_AWLEN;
s4_AWSIZE = m_AWSIZE;
s4_AWBURST = m_AWBURST;
s4_AWCACHE = m_AWCACHE ;
s4_AWLOCK = m_AWLOCK ;
s4_AWPROT = m_AWPROT ;
s4_AWQOS = m_AWQOS ;
s4_AWREGION = m_AWREGION ;
s4_AWUSER = m_AWUSER ;  
end
else 
begin
m_AWREADY = s5_AWREADY ;
s5_AWVALID = m_AWVALID ;
s5_AWID = m_AWID;
s5_AWADDR = m_AWADDR;
s5_AWLEN = m_AWLEN;
s5_AWSIZE = m_AWSIZE;
s5_AWBURST = m_AWBURST;
s5_AWCACHE = m_AWCACHE ;
s5_AWLOCK = m_AWLOCK ;
s5_AWPROT = m_AWPROT ;
s5_AWQOS = m_AWQOS ;
s5_AWREGION = m_AWREGION ;
s5_AWUSER = m_AWUSER ;  
end  
end

default: 
begin
m_AWREADY = s5_AWREADY ;
s5_AWVALID = m_AWVALID ;
s5_AWID = m_AWID;
s5_AWADDR = m_AWADDR;
s5_AWLEN = m_AWLEN;
s5_AWSIZE = m_AWSIZE;
s5_AWBURST = m_AWBURST;
s5_AWCACHE = m_AWCACHE ;
s5_AWLOCK = m_AWLOCK ;
s5_AWPROT = m_AWPROT ;
s5_AWQOS = m_AWQOS ;
s5_AWREGION = m_AWREGION ;
s5_AWUSER = m_AWUSER ;  
end  

endcase
end
endmodule 
