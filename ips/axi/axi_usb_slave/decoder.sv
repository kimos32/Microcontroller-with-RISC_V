
module decoder(
  input                 Clk,Rst,
  input 	       [31:0]  address_decoder_i,
  input         [1:0] 	 Read_en,
  output reg  	      	  rd_en_reg, 
  output reg    [7:0]   addr_b,
  output reg    [5:0]   addr_reg,
  output                mem_reg,
  output reg            data_toggle_en
  );
 

always @(posedge Clk)
begin
  if(!Rst) begin
    rd_en_reg = 1'b0;
    addr_b = 'b0;
    addr_reg = 'b0;
    data_toggle_en <= 1'b0;
  end
else
  begin
  data_toggle_en <=1'b0;
  rd_en_reg = 1'b0;
  if(Read_en == 2'b10) // busses to usb "write"
    begin
      if(!mem_reg) // write in memory
        begin
	        addr_b = address_decoder_i[9:0]>>2;
       end
     // if it is writing in memory, we decode the address "send only the fisrt 6 bits" to the register file
      else 
        begin
	        addr_reg = address_decoder_i[7:0]>>2;
        end
     end
     // if it is reading operation from UHCI, we check if it is reading from memory or register file and then decode the address
     // we also enable the data toggle module in case of reading from memory
     // we also assert the rd_en_reg when reading from register file
  else if (Read_en == 2'b01)// usb to busses
    begin
    // read from memory
      if(!mem_reg)
        begin
	      addr_b = address_decoder_i[9:0]>>2;
	      data_toggle_en <= 1'b1;
	      rd_en_reg = 1'b0;
       end
    // read from registers
      else 
        begin
          rd_en_reg = 1'b1 ;
	        addr_reg = address_decoder_i[7:0]>>2;
        end
     end
     end
end

assign mem_reg = address_decoder_i[10];


endmodule 