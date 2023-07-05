module full_fifo_solver (
input ready ,
input full , 
input valid ,
output reg valid_out , ready_out ) ; 




always @ (*)
begin
if (full)
ready_out = 0 ;
else 
ready_out = ready  ;
end





always @ (*)
begin
if (full)
valid_out = 0 ;
else 
valid_out = valid  ;
end







endmodule 