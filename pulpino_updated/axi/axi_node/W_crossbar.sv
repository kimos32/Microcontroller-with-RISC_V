module W_crossbar #(parameter DATA_width = 'd32 , Address_decode_width = 'd32 )(
	/////////////MASTER///////////////
	
	  input [Address_decode_width-1:0] Address_decode ,
	  input [DATA_width-1:0]     m_WDATA,
    input [(DATA_width/8)-1:0] m_WSTRB,
    input                      m_WLAST,
    input                      m_WUSER,
    input                      m_WVALID,
    output reg                     m_WREADY,
    
    //////////////SLAVE 0//////////////
    output reg [DATA_width-1:0]     s0_WDATA,
    output reg [(DATA_width/8)-1:0] s0_WSTRB,
    output reg                     s0_WLAST,
    output reg                     s0_WUSER,
    output reg                    s0_WVALID,
    input                      s0_WREADY,

    ///////////SLAVE 1//////////////////
    output reg [DATA_width-1:0]     s1_WDATA,
    output reg [(DATA_width/8)-1:0] s1_WSTRB,
    output reg                     s1_WLAST,
    output reg                     s1_WUSER,
    output reg                    s1_WVALID,
    input                      s1_WREADY,

    /////////////SLAVE 2////////////////
    output reg [DATA_width-1:0]     s2_WDATA,
    output reg [(DATA_width/8)-1:0] s2_WSTRB,
    output reg                     s2_WLAST,
    output reg                     s2_WUSER,
    output reg                    s2_WVALID,
    input                      s2_WREADY ,
    
    
    
    
     /////////////SLAVE 3////////////////
    output reg [DATA_width-1:0]     s3_WDATA,
    output reg [(DATA_width/8)-1:0] s3_WSTRB,
    output reg                     s3_WLAST,
    output reg                     s3_WUSER,
    output reg                    s3_WVALID,
    input                      s3_WREADY ,
    
     /////////////SLAVE 4////////////////
    output reg [DATA_width-1:0]     s4_WDATA,
    output reg [(DATA_width/8)-1:0] s4_WSTRB,
    output reg                     s4_WLAST,
    output reg                     s4_WUSER,
    output reg                    s4_WVALID,
    input                      s4_WREADY ,
    
     /////////////SLAVE 5////////////////
    output reg [DATA_width-1:0]     s5_WDATA,
    output reg [(DATA_width/8)-1:0] s5_WSTRB,
    output reg                     s5_WLAST,
    output reg                     s5_WUSER,
    output reg                    s5_WVALID,
    input                      s5_WREADY );



always @ (*)
begin
////////////////////// initialize output signals  
s0_WDATA = 0 ;
s0_WSTRB = 0 ;
s0_WLAST = 0 ;
s0_WUSER = 0 ;
s0_WVALID = 0 ;
m_WREADY = 0 ;


s1_WDATA = 0 ;
s1_WSTRB = 0 ;
s1_WLAST = 0 ;
s1_WUSER = 0 ;
s1_WVALID = 0 ;


s2_WDATA = 0 ;
s2_WSTRB = 0 ;
s2_WLAST = 0 ;
s2_WUSER = 0 ;
s2_WVALID = 0 ;



s3_WDATA = 0 ;
s3_WSTRB = 0 ;
s3_WLAST = 0 ;
s3_WUSER = 0 ;
s3_WVALID = 0 ;



s4_WDATA = 0 ;
s4_WSTRB = 0 ;
s4_WLAST = 0 ;
s4_WUSER = 0 ;
s4_WVALID = 0 ;



s5_WDATA = 0 ;
s5_WSTRB = 0 ;
s5_WLAST = 0 ;
s5_WUSER = 0 ;
s5_WVALID = 0 ;











case(Address_decode[Address_decode_width-1:Address_decode_width/2])
16'h0000: begin
if ( Address_decode[(Address_decode_width/2)-1:0] < 16'h8000)
begin
s0_WDATA = m_WDATA ;
s0_WSTRB = m_WSTRB ;
s0_WLAST = m_WLAST ;
s0_WUSER = m_WUSER  ;
s0_WVALID = m_WVALID ;
m_WREADY = s0_WREADY ;
end
else 
begin
s5_WDATA = m_WDATA ;
s5_WSTRB = m_WSTRB ;
s5_WLAST = m_WLAST ;
s5_WUSER = m_WUSER  ;
s5_WVALID = m_WVALID ;
m_WREADY = s5_WREADY ;  
end
end


16'h0008: begin
if ( Address_decode[(Address_decode_width/2)-1:0] < 16'h0200)
begin
s1_WDATA = m_WDATA ;
s1_WSTRB = m_WSTRB ;
s1_WLAST = m_WLAST ;
s1_WUSER = m_WUSER  ;
s1_WVALID = m_WVALID ;
m_WREADY = s1_WREADY ;
end
else 
begin
s5_WDATA = m_WDATA ;
s5_WSTRB = m_WSTRB ;
s5_WLAST = m_WLAST ;
s5_WUSER = m_WUSER  ;
s5_WVALID = m_WVALID ;
m_WREADY = s5_WREADY ;  
end
end




16'h0010: begin
if ( Address_decode[(Address_decode_width/2)-1:0] < 16'h8000)
begin
s2_WDATA = m_WDATA ;
s2_WSTRB = m_WSTRB ;
s2_WLAST = m_WLAST ;
s2_WUSER = m_WUSER  ;
s2_WVALID = m_WVALID ;
m_WREADY = s2_WREADY ;
end
else 
begin
s5_WDATA = m_WDATA ;
s5_WSTRB = m_WSTRB ;
s5_WLAST = m_WLAST ;
s5_WUSER = m_WUSER  ;
s5_WVALID = m_WVALID ;
m_WREADY = s5_WREADY ;  
end
end




16'h1A10: begin
s3_WDATA = m_WDATA ;
s3_WSTRB = m_WSTRB ;
s3_WLAST = m_WLAST ;
s3_WUSER = m_WUSER  ;
s3_WVALID = m_WVALID ;
m_WREADY = s3_WREADY ;
end

16'h1A11: begin
s3_WDATA = m_WDATA ;
s3_WSTRB = m_WSTRB ;
s3_WLAST = m_WLAST ;
s3_WUSER = m_WUSER  ;
s3_WVALID = m_WVALID ;
m_WREADY = s3_WREADY ;
end


16'h0002: begin
if ( Address_decode[(Address_decode_width/2)-1:0] < 16'h1000 )
begin
s4_WDATA = m_WDATA ;
s4_WSTRB = m_WSTRB ;
s4_WLAST = m_WLAST ;
s4_WUSER = m_WUSER  ;
s4_WVALID = m_WVALID ;
m_WREADY = s4_WREADY ;
end
else 
begin
s5_WDATA = m_WDATA ;
s5_WSTRB = m_WSTRB ;
s5_WLAST = m_WLAST ;
s5_WUSER = m_WUSER  ;
s5_WVALID = m_WVALID ;
m_WREADY = s5_WREADY ;  
end
end


default : begin 
s5_WDATA = m_WDATA ;
s5_WSTRB = m_WSTRB ;
s5_WLAST = m_WLAST ;
s5_WUSER = m_WUSER  ;
s5_WVALID = m_WVALID ;
m_WREADY = s5_WREADY ;  
end



endcase
end
endmodule 

