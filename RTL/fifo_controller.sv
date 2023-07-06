module address_controller (
input AW_valid ,
input AW_ready ,
input w_last  ,
input w_ready ,
output reg read_enable , write_enable ) ;



//////////////////////////// read_enable generation 
always @ (*)
begin 
  if (w_last && w_ready )
  read_enable = 1 ;
  else
  read_enable =  0;   
end
  
////////////////////////// write_enable geneation    
always @ (*)
begin 
  if (AW_valid && AW_ready)
  write_enable = 1 ;
  else  
  write_enable = 0 ;
end  
endmodule   
  
  
  
  