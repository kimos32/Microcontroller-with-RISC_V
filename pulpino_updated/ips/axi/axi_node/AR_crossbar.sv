module AR_crossbar #(parameter ID_width = 'd6, parameter ADDR_width = 'd32)(
	////////MASTER//////////
	input [ID_width-1:0]       m_ARID,
    input [ADDR_width-1:0]     m_ARADDR,
    input [7:0]                m_ARLEN,
    input [2:0]                m_ARSIZE,
    input [1:0]                m_ARBURST,
    input [3:0]                m_ARCACHE,
    input [1:0]                m_ARLOCK,
    input [2:0]                m_ARPROT,
    input [3:0]              m_ARQOS,
    input [3:0]              m_ARREGION,
    input                    m_ARUSER,
    input                    m_ARVALID,
    output  reg                 m_ARREADY,

    ////////////SLAVE 0///////////////
    output reg [ID_width-1:0]       s0_ARID,
    output reg [ADDR_width-1:0]     s0_ARADDR,
    output reg [7:0]                s0_ARLEN,
    output reg [2:0]                s0_ARSIZE,
    output reg [1:0]                s0_ARBURST,
    output reg [3:0]                s0_ARCACHE,
    output reg [1:0]                s0_ARLOCK,
    output reg [2:0]                s0_ARPROT,
    output reg [3:0]                s0_ARQOS,
    output reg [3:0]                s0_ARREGION,
    output reg                     s0_ARUSER,
    output reg                     s0_ARVALID,
    input                       s0_ARREADY,

    ///////////SLAVE 1/////////////////
    output reg [ID_width-1:0]       s1_ARID,
    output reg  [ADDR_width-1:0]     s1_ARADDR,
    output reg [7:0]                s1_ARLEN,
    output reg [2:0]                s1_ARSIZE,
    output reg [1:0]                s1_ARBURST,
    output reg [3:0]                s1_ARCACHE,
    output reg [1:0]                s1_ARLOCK,
    output reg [2:0]                s1_ARPROT,
    output reg [3:0]                s1_ARQOS,
    output reg [3:0]                s1_ARREGION,
    output reg                     s1_ARUSER,
    output reg                     s1_ARVALID,
    input                       s1_ARREADY,

    ///////////////SLAVE 2////////////////
    output reg [ID_width-1:0]       s2_ARID,
    output reg [ADDR_width-1:0]     s2_ARADDR,
    output reg [7:0]                s2_ARLEN,
    output reg [2:0]                s2_ARSIZE,
    output reg [1:0]                s2_ARBURST,
    output reg [3:0]                s2_ARCACHE,
    output reg [1:0]                s2_ARLOCK,
    output reg [2:0]                s2_ARPROT,
    output reg [3:0]                s2_ARQOS,
    output reg [3:0]                s2_ARREGION,
    output reg                     s2_ARUSER,
    output reg                     s2_ARVALID,
    input                       s2_ARREADY,
    ///////////////SLAVE 3////////////////
    output reg [ID_width-1:0]       s3_ARID,
    output reg [ADDR_width-1:0]     s3_ARADDR,
    output reg [7:0]                s3_ARLEN,
    output reg [2:0]                s3_ARSIZE,
    output reg [1:0]                s3_ARBURST,
    output reg [3:0]                s3_ARCACHE,
    output reg [1:0]                s3_ARLOCK,
    output reg [2:0]                s3_ARPROT,
    output reg [3:0]                s3_ARQOS,
    output reg [3:0]                s3_ARREGION,
    output reg                     s3_ARUSER,
    output reg                     s3_ARVALID,
    input                       s3_ARREADY,
    
    ///////////////SLAVE 4////////////////
    output reg [ID_width-1:0]       s4_ARID,
    output reg [ADDR_width-1:0]     s4_ARADDR,
    output reg [7:0]                s4_ARLEN,
    output reg [2:0]                s4_ARSIZE,
    output reg [1:0]                s4_ARBURST,
    output reg [3:0]                s4_ARCACHE,
    output reg [1:0]                s4_ARLOCK,
    output reg [2:0]                s4_ARPROT,
    output reg [3:0]                s4_ARQOS,
    output reg [3:0]                s4_ARREGION,
    output reg                     s4_ARUSER,
    output reg                     s4_ARVALID,
    input                       s4_ARREADY, 
    
    
    ///////////////SLAVE 5////////////////
    output reg [ID_width-1:0]       s5_ARID,
    output reg [ADDR_width-1:0]     s5_ARADDR,
    output reg [7:0]                s5_ARLEN,
    output reg [2:0]                s5_ARSIZE,
    output reg [1:0]                s5_ARBURST,
    output reg [3:0]                s5_ARCACHE,
    output reg [1:0]                s5_ARLOCK,
    output reg [2:0]                s5_ARPROT,
    output reg [3:0]                s5_ARQOS,
    output reg [3:0]                s5_ARREGION,
    output reg                     s5_ARUSER,
    output reg                     s5_ARVALID,
    input                       s5_ARREADY );
	
	
	
	
always @(*)
begin
  
///////////////inialize ready value
m_ARREADY	= 0 ;  
//////////////////initialize s0 vlaues	 
s0_ARADDR = 0 ;
s0_ARLEN = 0 ;
s0_ARSIZE = 0 ;
s0_ARBURST = 0 ;
s0_ARCACHE = 0 ;
s0_ARLOCK = 0 ;
s0_ARPROT = 0 ;
s0_ARQOS = 0 ;
s0_ARREGION = 0 ;
s0_ARUSER = 0 ;
s0_ARVALID = 0 ;
s0_ARID = 0 ;
////////////////////initialize s1 values
s1_ARID = 0 ;
s1_ARADDR = 0 ;
s1_ARLEN = 0 ;
s1_ARSIZE = 0 ;
s1_ARBURST = 0 ;
s1_ARCACHE = 0 ;
s1_ARLOCK = 0 ;
s1_ARPROT = 0 ;
s1_ARQOS = 0 ;
s1_ARREGION = 0 ;
s1_ARUSER = 0 ;
s1_ARVALID = 0 ;
////////////////////// intialize s2 values
s2_ARID = 0 ;
s2_ARADDR = 0 ;
s2_ARLEN = 0 ;
s2_ARSIZE = 0 ;
s2_ARBURST = 0 ;
s2_ARCACHE = 0 ;
s2_ARLOCK = 0 ;
s2_ARPROT = 0 ;
s2_ARQOS = 0 ;
s2_ARREGION = 0 ;
s2_ARUSER = 0 ;
s2_ARVALID = 0 ;

/////////////////// intialize s3 values
s3_ARID = 0 ;
s3_ARADDR = 0 ;
s3_ARLEN = 0 ;
s3_ARSIZE = 0 ;
s3_ARBURST = 0 ;
s3_ARCACHE = 0 ;
s3_ARLOCK = 0 ;
s3_ARPROT = 0 ;
s3_ARQOS = 0 ;
s3_ARREGION = 0 ;
s3_ARUSER = 0 ;
s3_ARVALID = 0 ;



/////////////////// intialize s4 values
s4_ARID = 0 ;
s4_ARADDR = 0 ;
s4_ARLEN = 0 ;
s4_ARSIZE = 0 ;
s4_ARBURST = 0 ;
s4_ARCACHE = 0 ;
s4_ARLOCK = 0 ;
s4_ARPROT = 0 ;
s4_ARQOS = 0 ;
s4_ARREGION = 0 ;
s4_ARUSER = 0 ;
s4_ARVALID = 0 ;


/////////////////// intialize s5 values
s5_ARADDR = 0 ;
s5_ARLEN = 0 ;
s5_ARSIZE = 0 ;
s5_ARBURST = 0 ;
s5_ARCACHE = 0 ;
s5_ARLOCK = 0 ;
s5_ARPROT = 0 ;
s5_ARQOS = 0 ;
s5_ARREGION = 0 ;
s5_ARUSER = 0 ;
s5_ARVALID = 0 ;
s5_ARID = 0 ;










case(m_ARADDR[ADDR_width-1:ADDR_width/2])
  
16'h0000: begin
if ( m_ARADDR[(ADDR_width/2)-1:0] < 16'h8000)
begin
s0_ARID = m_ARID  ; 
s0_ARADDR = m_ARADDR  ;
s0_ARLEN = m_ARLEN ;
s0_ARSIZE = m_ARSIZE  ;
s0_ARBURST = m_ARBURST;
s0_ARCACHE = m_ARCACHE ;
s0_ARLOCK = m_ARLOCK ;
s0_ARPROT = m_ARPROT ;
s0_ARQOS = m_ARQOS ;
s0_ARREGION = m_ARREGION ;
s0_ARUSER = m_ARUSER 	;
s0_ARVALID = m_ARVALID ;
m_ARREADY = s0_ARREADY ;	
end	
else 
begin
s5_ARID = m_ARID  ; 
s5_ARADDR = m_ARADDR  ;
s5_ARLEN = m_ARLEN ;
s5_ARSIZE = m_ARSIZE  ;
s5_ARBURST = m_ARBURST;
s5_ARCACHE = m_ARCACHE ;
s5_ARLOCK = m_ARLOCK ;
s5_ARPROT = m_ARPROT ;
s5_ARQOS = m_ARQOS ;
s5_ARREGION = m_ARREGION ;
s5_ARUSER = m_ARUSER 	;
s5_ARVALID = m_ARVALID ;
m_ARREADY = s5_ARREADY ;	
end	
end	
		
16'h0008: begin
if ( m_ARADDR[(ADDR_width/2)-1:0] < 16'h0200 )
begin
s1_ARID = m_ARID ;
s1_ARADDR = m_ARADDR  ;
s1_ARLEN = m_ARLEN ;
s1_ARSIZE = m_ARSIZE  ;
s1_ARBURST = m_ARBURST;
s1_ARCACHE = m_ARCACHE ;
s1_ARLOCK = m_ARLOCK ;
s1_ARPROT = m_ARPROT  ;
s1_ARQOS = m_ARQOS ;
s1_ARREGION = m_ARREGION ;
s1_ARUSER = m_ARUSER ;
s1_ARVALID = m_ARVALID ;
m_ARREADY = s1_ARREADY ;
end

else 
begin
s5_ARID = m_ARID ;
s5_ARADDR = m_ARADDR  ;
s5_ARLEN = m_ARLEN ;
s5_ARSIZE = m_ARSIZE  ;
s5_ARBURST = m_ARBURST;
s5_ARCACHE = m_ARCACHE ;
s5_ARLOCK = m_ARLOCK ;
s5_ARPROT = m_ARPROT ;
s5_ARQOS = m_ARQOS ;
s5_ARREGION = m_ARREGION ;
s5_ARUSER = m_ARUSER 	;
s5_ARVALID = m_ARVALID ;
m_ARREADY = s5_ARREADY ;	
end		
end


16'h0010:
begin	
if (m_ARADDR[(ADDR_width/2)-1:0] < 16'h8000 )
begin
s2_ARID = m_ARID ;
s2_ARADDR = m_ARADDR  ;
s2_ARLEN = m_ARLEN ;
s2_ARSIZE = m_ARSIZE  ;
s2_ARBURST = m_ARBURST;
s2_ARCACHE = m_ARCACHE ;
s2_ARLOCK = m_ARLOCK ;
s2_ARPROT = m_ARPROT  ;
s2_ARQOS = m_ARQOS ;
s2_ARREGION = m_ARREGION ;
s2_ARUSER = m_ARUSER ;
s2_ARVALID = m_ARVALID ;
m_ARREADY = s2_ARREADY ;			
end
else 
begin
s5_ARID = m_ARID ;
s5_ARADDR = m_ARADDR  ;
s5_ARLEN = m_ARLEN ;
s5_ARSIZE = m_ARSIZE  ;
s5_ARBURST = m_ARBURST;
s5_ARCACHE = m_ARCACHE ;
s5_ARLOCK = m_ARLOCK ;
s5_ARPROT = m_ARPROT ;
s5_ARQOS = m_ARQOS ;
s5_ARREGION = m_ARREGION ;
s5_ARUSER = m_ARUSER 	;
s5_ARVALID = m_ARVALID ;
m_ARREADY = s5_ARREADY ;	
end	
end	
		
16'h1A10:
begin	
s3_ARID = m_ARID ;
s3_ARADDR = m_ARADDR  ;
s3_ARLEN = m_ARLEN ;
s3_ARSIZE = m_ARSIZE  ;
s3_ARBURST = m_ARBURST;
s3_ARCACHE = m_ARCACHE ;
s3_ARLOCK = m_ARLOCK ;
s3_ARPROT = m_ARPROT  ;
s3_ARQOS = m_ARQOS ;
s3_ARREGION = m_ARREGION ;
s3_ARUSER = m_ARUSER ;
s3_ARVALID = m_ARVALID ;
m_ARREADY = s3_ARREADY ;			
end

16'h1A11:
begin	
s3_ARID = m_ARID ;
s3_ARADDR = m_ARADDR  ;
s3_ARLEN = m_ARLEN ;
s3_ARSIZE = m_ARSIZE  ;
s3_ARBURST = m_ARBURST;
s3_ARCACHE = m_ARCACHE ;
s3_ARLOCK = m_ARLOCK ;
s3_ARPROT = m_ARPROT  ;
s3_ARQOS = m_ARQOS ;
s3_ARREGION = m_ARREGION ;
s3_ARUSER = m_ARUSER ;
s3_ARVALID = m_ARVALID ;
m_ARREADY = s3_ARREADY ;			
end				


16'h0002:
begin	
if (m_ARADDR[(ADDR_width/2)-1:0] < 16'h1000 )
begin  
s4_ARID = m_ARID ;
s4_ARADDR = m_ARADDR  ;
s4_ARLEN = m_ARLEN ;
s4_ARSIZE = m_ARSIZE  ;
s4_ARBURST = m_ARBURST;
s4_ARCACHE = m_ARCACHE ;
s4_ARLOCK = m_ARLOCK ;
s4_ARPROT = m_ARPROT  ;
s4_ARQOS = m_ARQOS ;
s4_ARREGION = m_ARREGION ;
s4_ARUSER = m_ARUSER ;
s4_ARVALID = m_ARVALID ;
m_ARREADY = s4_ARREADY ;			
end
else
begin
s5_ARID = m_ARID ;
s5_ARADDR = m_ARADDR ;
s5_ARLEN = m_ARLEN ;
s5_ARSIZE = m_ARSIZE ;
s5_ARBURST = m_ARBURST;
s5_ARCACHE = m_ARCACHE ;
s5_ARLOCK = m_ARLOCK;
s5_ARPROT = m_ARPROT;
s5_ARQOS = m_ARQOS;
s5_ARREGION = m_ARREGION ;
s5_ARUSER = m_ARUSER ;
s5_ARVALID = m_ARVALID ;
m_ARREADY = s5_ARREADY ;	
end

end	

default : begin
s5_ARID = m_ARID ;
s5_ARADDR = m_ARADDR ;
s5_ARLEN = m_ARLEN ;
s5_ARSIZE = m_ARSIZE ;
s5_ARBURST = m_ARBURST;
s5_ARCACHE = m_ARCACHE ;
s5_ARLOCK = m_ARLOCK;
s5_ARPROT = m_ARPROT;
s5_ARQOS = m_ARQOS;
s5_ARREGION = m_ARREGION ;
s5_ARUSER = m_ARUSER ;
s5_ARVALID = m_ARVALID ;
m_ARREADY = s5_ARREADY ;	
end
		
endcase	

end	
	
endmodule 	
	
	
