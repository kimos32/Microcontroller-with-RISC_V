module read_id_generator  #(parameter id_pad = 4 , id_width = 2 )(
input [id_width-1:0]  AR_ID  ,
input AR_Ready ,
input  AR_valid ,
input Aclk,ARESETnRst,
output reg [id_width+id_pad-1:0] ARID );

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
    if ( AR_ID == 2'b00 )
        begin 
        if ( AR_valid && AR_Ready )    
            seq_00 <= seq_00 + 4'b1 ;
        else 
            seq_00 <= seq_00 ;
        end            
    else if ( AR_ID == 2'b01 )
        begin 
        if ( AR_valid && AR_Ready )    
            seq_01 <= seq_01 + 4'b1 ;
        else 
            seq_01<= seq_01 ;
        end   

    else if ( AR_ID == 2'b10 )
        begin 
        if ( AR_valid && AR_Ready )    
            seq_10 <= seq_10 + 4'b1 ;
        else 
            seq_10<= seq_10 ;
        end 
    else
        begin
         if ( AR_valid && AR_Ready )    
            seq_11 <= seq_11 + 4'b1 ;
        else 
            seq_11<= seq_11 ;
        end       
end
end

always @ (*) 
begin     
    if ( AR_ID == 2'b00 )
        ARID  =  {seq_00,AR_ID } ;
    else if ( AR_ID == 2'b01 )
        ARID  =  {seq_01,AR_ID} ;

    else if ( AR_ID == 2'b10 )
         ARID  =  {seq_10,AR_ID} ;
    else
     ARID  =  {seq_11,AR_ID} ;
end
    
endmodule