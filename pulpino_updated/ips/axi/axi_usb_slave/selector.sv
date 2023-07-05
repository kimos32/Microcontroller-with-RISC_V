//////////////////////////////////////////////////////////////////////////////////////////  
// This module is responsible of splitting the data to the register or memory data signals depending on reg_mem signal
//////////////////////////////////////////////////////////////////////////////////////////

module selector # ( parameter OUT1 = 32 , parameter OUT2 = 32  ) 
(
  input                  reg_mem,
  input      [31:0]      A,
  output reg [OUT1-1:0]  OUT_1,
  output reg [OUT2-1:0]  OUT_2
  );
  
always @(*)
begin
    case( reg_mem)
     // if reg_mem = 0 ---> writing in memory so data = 32 bits
        1'b0: begin 
		OUT_1 = A[OUT1-1:0]; // memory
		OUT_2 = 0; //
	end
     // if reg_mem = 1 ---> writing in register file so data = 8 bits
        1'b1: begin
		OUT_2 = A[OUT2-1:0]; // reg_file
		OUT_1 = 0; //
	end
    endcase
end
      
endmodule
