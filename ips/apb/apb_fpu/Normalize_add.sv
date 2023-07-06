module Normalize_add(normalize_enable,Alu_result,higher_Exponent,Exponent_normalized,Fraction_normalized);
//normalization phase

input            normalize_enable;
input      [7:0] higher_Exponent;
input      [24:0] Alu_result;

output reg [7:0] Exponent_normalized;
output reg [24:0] Fraction_normalized;
reg [5:0] count;


always@(*)begin
    if(normalize_enable==1'b1)begin
        //Stop_flag=1'b1;
        count=0;
       if(Alu_result[24]==1'b1)begin
         Exponent_normalized= higher_Exponent+1;
         Fraction_normalized= {1'b0,Alu_result[24:1]};
       end
       else begin 
           casex(Alu_result)
          25'b001xxxxxxxxxxxxxxxxxxxxxx:count=22;
          25'b0001xxxxxxxxxxxxxxxxxxxxx:count=21;
          25'b00001xxxxxxxxxxxxxxxxxxxx:count=20;
          25'b000001xxxxxxxxxxxxxxxxxxx:count=19;
          25'b0000001xxxxxxxxxxxxxxxxxx:count=18;
          25'b00000001xxxxxxxxxxxxxxxxx:count=17;
          25'b000000001xxxxxxxxxxxxxxxx:count=16;
          25'b0000000001xxxxxxxxxxxxxxx:count=15;
          25'b00000000001xxxxxxxxxxxxxx:count=14;
          25'b000000000001xxxxxxxxxxxxx:count=13;
          25'b0000000000001xxxxxxxxxxxx:count=12;
          25'b00000000000001xxxxxxxxxxx:count=11;
          25'b000000000000001xxxxxxxxxx:count=10;
          25'b0000000000000001xxxxxxxxx:count=9;
          25'b00000000000000001xxxxxxxx:count=8;
          25'b000000000000000001xxxxxxx:count=7;
          25'b0000000000000000001xxxxxx:count=6;
          25'b00000000000000000001xxxxx:count=5;
          25'b000000000000000000001xxxx:count=4;
          25'b0000000000000000000001xxx:count=3;
          25'b00000000000000000000001xx:count=2;
          25'b000000000000000000000001x:count=1;
          25'b0000000000000000000000001:count=0;
          default:count=0;
        endcase
        Exponent_normalized= higher_Exponent-(23-count);
        Fraction_normalized=Alu_result<<(23-count);             
       end
    end
    else begin
     Exponent_normalized= higher_Exponent;
     Fraction_normalized=Alu_result;
    end
end


endmodule




/*module Normalize_add(normalize_enable,Alu_result,higher_Exponent,Exponent_normalized,Fraction_normalized);

parameter MANT_WIDTH=23;
parameter EXP_WIDTH=8;

//normalization phase

input            normalize_enable;
input      [EXP_WIDTH-1:0] higher_Exponent;
input      [MANT_WIDTH-1:0] Alu_result;

output reg [EXP_WIDTH-1:0] Exponent_normalized;
output reg [MANT_WIDTH-1:0] Fraction_normalized;
reg [5:0] count;


always@(*)begin
	if(normalize_enable==1'b1)begin
	    //Stop_flag=1'b1;
	    count=0;
	   if(Alu_result[MANT_WIDTH-1]==1'b1)begin
	   	 Exponent_normalized= higher_Exponent+1;
	   	 Fraction_normalized= {1'b0,Alu_result[MANT_WIDTH-1:1]};
	   end
	   else begin 
           casex(Alu_result)
          28'b001xxxxxxxxxxxxxxxxxxxxxxxxx:count=22;
          28'b0001xxxxxxxxxxxxxxxxxxxxxxxx:count=21;
          28'b00001xxxxxxxxxxxxxxxxxxxxxxx:count=20;
          28'b000001xxxxxxxxxxxxxxxxxxxxxx:count=19;
          28'b0000001xxxxxxxxxxxxxxxxxxxxx:count=18;
          28'b00000001xxxxxxxxxxxxxxxxxxxx:count=17;
          28'b000000001xxxxxxxxxxxxxxxxxxx:count=16;
          28'b0000000001xxxxxxxxxxxxxxxxxx:count=15;
          28'b00000000001xxxxxxxxxxxxxxxxx:count=14;
          28'b000000000001xxxxxxxxxxxxxxxx:count=13;
          28'b0000000000001xxxxxxxxxxxxxxx:count=12;
          28'b00000000000001xxxxxxxxxxxxxx:count=11;
          28'b000000000000001xxxxxxxxxxxxx:count=10;
          28'b0000000000000001xxxxxxxxxxxx:count=9;
          28'b00000000000000001xxxxxxxxxxx:count=8;
          28'b000000000000000001xxxxxxxxxx:count=7;
          28'b0000000000000000001xxxxxxxxx:count=6;
          28'b00000000000000000001xxxxxxxx:count=5;
          28'b000000000000000000001xxxxxxx:count=4;
          28'b0000000000000000000001xxxxxx:count=3;
          28'b00000000000000000000001xxxxx:count=2;
          28'b000000000000000000000001xxxx:count=1;
          28'b0000000000000000000000001xxx:count=0;
          default:count=0;
        endcase
        Exponent_normalized= higher_Exponent-(23-count);
        Fraction_normalized=Alu_result<<(23-count);             
       end
	end
	else begin
     Exponent_normalized= higher_Exponent;
     Fraction_normalized=Alu_result;
	end
end


endmodule
*/