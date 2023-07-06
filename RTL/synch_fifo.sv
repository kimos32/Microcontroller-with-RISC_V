module synnch_fifo #(parameter data_width =  32 , depth = 16 , pointer_width = 5 )(
 
input wr_enable,r_enable ,
input [data_width-1:0]  AW_address ,
input clk , rst , 
output reg [data_width-1:0]   out_data , 
output empty, full ) ;



///////////////////memory 

reg [data_width-1:0] mem [depth-1:0] ;
reg [pointer_width-1:0] write_pointer ;
reg [pointer_width-1:0] read_pointer ;


always @(posedge clk or negedge rst)
begin 

if (!rst)
out_data=0;
else 
 out_data = mem[read_pointer[pointer_width-2:0]] ;
end 



integer i ;
always @ (posedge clk or negedge rst)
begin 
  if (!rst)
    begin
    for (i=0 ; i<depth ; i=i+1)
    begin 
      mem[i] <= 32'hffffffff ;
    end 
  end
  else if ( wr_enable && !full ) 
  mem[write_pointer[pointer_width-2:0]] <= AW_address ;
end



////////////////// read_pointer

always @ (posedge clk or negedge rst)
begin 
  if(!rst) 
   read_pointer <= 0 ;
  else if ( !empty && r_enable  )
    read_pointer <= read_pointer + 5'b1 ;  
end       
  


///////////////// write_pointer 



always @ (posedge clk or negedge rst)
begin 
  if(!rst) 
   write_pointer <= 0 ;
  else if ( !full && wr_enable   )
    write_pointer <= write_pointer + 5'b1 ;  
end       
  
  
  
  
////////// full_generation 

assign full = ({!write_pointer[pointer_width-1],write_pointer[pointer_width-2 : 0]}   == read_pointer ) ;
  



//////////empty_generation

assign empty =  (write_pointer == read_pointer ) ;

endmodule 









