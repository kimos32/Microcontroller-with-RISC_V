
module write_channel_delayer(

input empty , r_enable , clk , rst ,
input m_WVALID ,
input m_WREADY ,

output reg m_WVALID_out ,

output reg m_WREADY_out);



reg  empty_reg ;
reg  r_enable_reg ;

always @ ( posedge clk or negedge rst )
begin
if (!rst)
begin 
empty_reg <=  0 ;
r_enable_reg <= 0 ;  
end    
else  
begin
empty_reg <=  empty ;
r_enable_reg <= r_enable ;
end
end



always @ (*) 
begin
if ( empty )
begin
if(!empty_reg)
begin
m_WVALID_out = m_WVALID;
m_WREADY_out = m_WREADY;
end 
else
begin
m_WVALID_out = 0;
m_WREADY_out = 0;  
end
end
  
else if (r_enable_reg)
begin   
m_WVALID_out = 0;
m_WREADY_out = 0 ;
end
else begin
m_WVALID_out = m_WVALID;
m_WREADY_out = m_WREADY; 
end
end  

endmodule 
