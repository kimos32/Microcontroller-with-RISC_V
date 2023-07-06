module FPU_Add2(OP1,OP2,add_select,sub_select,Result_comb,valid);

//input        clk,rstn;
input [31:0] OP1;
input [31:0] OP2;
input        add_select;
input        sub_select;


output      [31:0] Result_comb;
output             valid;




//decomposition
wire        sign1,sign2;
wire [7:0]  Exponent1,Exponent2;
wire [23:0] Fraction1,Fraction2;


//control unite
reg select_denormalize;
reg normalize_enable;
reg   add_sub;
reg denorm1;
reg one_bigger;

//denormalize phase
reg [7:0] higher_Exponent;
reg [7:0] Exponent_difference;
reg [23:0] shifted_Fraction;
reg [23:0] unshifted_Fraction;
reg        result_sign;

//Alu_results
wire [24:0] Alu_result ;

//normalization phase
wire [7:0] Exponent_normalized;
wire [24:0] Fraction_normalized;


///Floating point decomposition
assign sign1 = OP1[31] ;
assign sign2 = OP2[31] ;

assign Exponent1 = OP1[30:23];
assign Exponent2 = OP2[30:23];

assign Fraction1 = {1'b1,OP1[22:0]};
assign Fraction2 = {1'b1,OP2[22:0]};


////Control unit
always @(*) begin
select_denormalize=1'b0;
denorm1=1'b0;
one_bigger=1'b0; 
add_sub=1'b0;

///////determin the type of operation depending on the signs//////////////////

if(add_select)begin
    if(sign1~^sign2)begin
     add_sub=1'b0;
     end
     else begin
      add_sub=1'b1;
    end
end 
else if (sub_select) begin
    if(sign1^sign2)begin
     add_sub=1'b0;
     end
     else begin
      add_sub=1'b1; 
    end
end

else begin
	add_sub=1'b0;
end


    //compare fractions
	if (Exponent1==Exponent2) begin
		select_denormalize=1'b0;
		if(add_sub)begin
            if(Fraction1>Fraction2)begin
               one_bigger=1'b1;
            end
            else begin
              one_bigger=1'b0;
            end
		end
		else begin
          one_bigger=1'b0; 
		end
		
	end
	else begin
		select_denormalize=1'b1;
		if(Exponent1>Exponent2)begin
		  denorm1=1'b1;
		end
		else begin
		  denorm1=1'b0;	
		end
		
	end

    //normalization control
	if((Alu_result[24]==1'b0)&&(Alu_result[23]==1'b1))begin
       normalize_enable=1'b0;
	end
	else begin
       normalize_enable=1'b1;
	end
end


//denormalize phase
always @(*) begin
higher_Exponent= Exponent1;
Exponent_difference=0;
	if(select_denormalize==1'b1)begin
	  if(denorm1)begin 
	   higher_Exponent=Exponent1;
       Exponent_difference=higher_Exponent - Exponent2;
       //shifted_Fraction={Exponent_difference{1'b0},Fraction1[23:Exponent_difference]};
       shifted_Fraction=Fraction2>>Exponent_difference;
       unshifted_Fraction= Fraction1;
       result_sign=sign1;
	end
	  else begin
	    higher_Exponent= Exponent2;
	    Exponent_difference=higher_Exponent - Exponent1;
	    //shifted_Fraction={Exponent_difference{1'b0},Fraction2[23:Exponent_difference]};
	    shifted_Fraction=Fraction1>>Exponent_difference;
	    unshifted_Fraction=Fraction2;
	    result_sign=sign2;
	end
   end
   else begin
       if(one_bigger)begin
	    //shifted_Fraction={Exponent_difference{1'b0},Fraction2[23:Exponent_difference]};
	    shifted_Fraction=Fraction2;
	    unshifted_Fraction=Fraction1;
	    result_sign=sign1;
       end
       else begin
       shifted_Fraction=Fraction1;
	   unshifted_Fraction=Fraction2;
	   result_sign=sign2;
       end
   end

end


//addition phase

assign Alu_result=(add_sub==1'b0)?shifted_Fraction + unshifted_Fraction:unshifted_Fraction - shifted_Fraction;

//normalization phase

Normalize_add N1(normalize_enable,Alu_result,higher_Exponent,Exponent_normalized,Fraction_normalized);

assign Result_comb=(add_select||sub_select)?{result_sign,Exponent_normalized,Fraction_normalized[22:0]}:32'b0;
assign valid=(add_select||sub_select)?1'b1:1'b0;

/*always@(negedge rstn or posedge clk)begin
   if(rstn==1'b0)begin
      Result<=32'b0;
      valid<=0;
   end
   else if((add_select||sub_select)) begin
   	 Result<=Result_comb;
   	 valid<=1;
   end
   else begin
   	 Result<=32'b0;
   	 valid<=0;
   end
end
*/
endmodule