module W_id_generator  #(parameter id_pad = 4 , id_width = 2 )(
input [id_width-1:0]  AW_ID  ,
input AW_Ready ,
input  AW_valid ,
input Aclk,ARESETnRst,
output reg [id_width+id_pad-1:0] AWID );

reg [id_pad -1 :0]  seq_00 , seq_01 , seq_10 , seq_11 ;      // make reg to use it to tore sequance value 

always @  (posedge Aclk  or negedge ARESETnRst )
begin  

if ( !ARESETnRst )
begin 
seq_00 <= 4'b00 ;
seq_01 <= 4'b00 ;
seq_10 <= 4'b00 ;
seq_11 <= 4'b00 ;
end
else
begin 
    if ( AW_ID == 2'b00 )
        begin 
        if ( AW_valid && AW_Ready )    
            seq_00 <= seq_00 + 4'b1;
        else 
            seq_00 <= seq_00 ;
        end            
    else if ( AW_ID == 2'b01 )
        begin 
        if ( AW_valid && AW_Ready )    
            seq_01 <= seq_01 + 4'b1;
        else 
            seq_01<= seq_01 ;
        end   

    else if ( AW_ID == 2'b10 )
        begin 
        if ( AW_valid && AW_Ready )    
            seq_10 <= seq_10 + 4'b1;
        else 
            seq_10<= seq_10;
        end 
    else
        begin
         if ( AW_valid && AW_Ready )    
            seq_11 <= seq_11 + 4'b1;
        else 
            seq_11<= seq_11;
        end       
end
end

always @ (*) 
begin     
    if ( AW_ID == 2'b00 )
        AWID  =  {seq_00,AW_ID } ;
    else if ( AW_ID == 2'b01 )
        AWID  =  {seq_01,AW_ID} ;

    else if ( AW_ID == 2'b10 )
         AWID  =  {seq_10,AW_ID} ;
    else
     AWID  =  {seq_11,AW_ID} ;
end
    
endmodule