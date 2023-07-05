//////////////////////////////////////////////////////////////////////////////////////////  
// This module is responsible of toggling the data_toggle signal whenever there is a reading operation from the memory
// when we_b = 0 ----> reading operation from the memory
// when data_toggle_en = 1 ----> there is a valid read address to the memory
// data_toggle signal is sent to the AXI FSM to indicate that there is a valid data 
////////////////////////////////////////////////////////////////////////////////////////// 

module data_toggle (
  input      Clk,Rst,
  input      we_b,
  input      data_toggle_en,
  output reg data_toggle
  
  );
always @(posedge Clk or negedge Rst)
begin
if (!Rst)
  data_toggle <= 1'b0;
else
 begin
  if(!we_b && data_toggle_en)
    data_toggle <= ~data_toggle;
 end
end

endmodule