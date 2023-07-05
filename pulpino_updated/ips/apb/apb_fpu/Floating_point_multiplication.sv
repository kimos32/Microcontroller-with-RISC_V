module FPU_MULT(clk,rstn,OP1,OP2,mult_select,Result_comb,valid);

input        clk,rstn;
input [31:0] OP1,OP2;
input        mult_select;



output     [31:0] Result_comb;
output            valid;


wire        sign1,sign2;
wire [7:0]  Exponent1,Exponent2;
wire [23:0] Fraction1,Fraction2;



////Addition of exponents

reg [7:0] Exponent_add,Exponent_add_reg;

///Fraction decomposition//////
reg  [23:0] Fraction1_reg;

wire  [11:0] Fraction2_1st;
wire  [11:0] Fraction2_2nd;
reg  [11:0]  Fraction2_2nd_reg;

/////////////////////Multiply Fractions///////////

reg [47:0] Fraction_mult;
reg  [35:0] Fraction_mult_1st_comb, Fraction_mult_1st_reg;
reg  [35:0] Fraction_mult_intermediate;
reg  [47:0] Fraction_mult_shift;
///////////////////////Normalization ////////////////////

reg [24:0] Fraction_normalized;
reg [7:0]  Exponent_normalized;

////////////sign determination/////

reg sign_res,sign_reg;

/////////valid/////
reg valid_1st;



///Floating point decomposition
assign sign1 = OP1[31] ;
assign sign2 = OP2[31] ;

assign Exponent1 = OP1[30:23];
assign Exponent2 = OP2[30:23];

assign Fraction1 = {1'b1,OP1[22:0]};
assign Fraction2 = {1'b1,OP2[22:0]}; 

assign Fraction2_1st = Fraction2[11:0];
assign Fraction2_2nd = Fraction2[23:12]; 


////////////sign determination/////
always@(sign1,sign2)begin
if(sign1^sign2)begin
   sign_res=1'b1;
end
else begin
   sign_res=1'b0;
end

end


//////////////////////////////Adding Exponents//////////////////

always @(Exponent1,Exponent2) begin

   Exponent_add=(Exponent1+Exponent2)-127;
end


/////////////////////Multiply Fractions///////////

always @(Fraction1,Fraction2_1st) begin

   Fraction_mult_1st_comb=Fraction1 * Fraction2_1st;
end



always@(negedge rstn or posedge clk)begin
if(!rstn)begin
Fraction_mult_1st_reg<=36'b0;
sign_reg<=0;
Exponent_add_reg<=0;
Fraction2_2nd_reg<=0;
Fraction1_reg<=0;
valid_1st<=0;

end
else if(mult_select) begin
  Fraction_mult_1st_reg<=Fraction_mult_1st_comb;
  sign_reg<=sign_res;
  Exponent_add_reg<=Exponent_add;
  Fraction2_2nd_reg<=Fraction2_2nd;
  Fraction1_reg<=Fraction1;
  valid_1st<=1;
end
else begin
Fraction_mult_1st_reg<=36'b0;
sign_reg<=0;
Exponent_add_reg<=0;
Fraction2_2nd_reg<=0;
Fraction1_reg<=0;
valid_1st<=0;  
end


end



//////Multply Fractions/////////

always@(*)begin

Fraction_mult_intermediate=Fraction1_reg * Fraction2_2nd_reg;
Fraction_mult_shift={Fraction_mult_intermediate,12'b0}; 
Fraction_mult=Fraction_mult_shift + Fraction_mult_1st_reg;
end


////////////////////Normalization///////////////

always@(Fraction_mult,Exponent_add_reg)begin

if(Fraction_mult[47]==1'b1)begin
    Fraction_normalized= {1'b0,Fraction_mult[47:24]};
    Exponent_normalized= Exponent_add_reg+1;
end

else begin
    Fraction_normalized= Fraction_mult[47:23];
    Exponent_normalized= Exponent_add_reg;

end


end


////////////Result////////
assign Result_comb=(mult_select)?{sign_reg,Exponent_normalized,Fraction_normalized[22:0]}:32'b0;
assign valid=(mult_select)?valid_1st:1'b0;
/*
always@(negedge rstn or posedge clk)begin
   if(rstn==1'b0)begin
      Result<=32'b0;
      valid<=0;
   end
   else if(mult_select) begin
       Result<=Result_comb;
       valid<=valid_1st;
   end
   else begin
      valid<=0;
      Result<=0;
   end
end
*/
endmodule