module FPU (

	input                clk,rstn,

	input       [31:0]       OP1,
	input       [31:0]       OP2,
	input       [2:0]        OP_select,


	output reg  [31:0]       Result,
	output reg               data_valid,
	output                   zero_flag,
	output                   INF_flag,
	output                   NAN_flag

    );

reg [2:0] count;

reg add_select, sub_select,
    mult_select;


wire   [31:0]  Add_Result,
              MULT_Result;

wire           Add_valid,Mult_valid;               



//////////////logic block to select the operation/////////
always@(*)begin

add_select=1'b0;
sub_select=1'b0;
mult_select=1'b0;

	case(OP_select)
	3'b000:add_select=1'b1;
	3'b001:sub_select=1'b1;
	3'b010:mult_select=1'b1;
	default:begin 
	    mult_select=1'b0;
	    add_select=1'b0;
	    sub_select=1'b0;
	    end
	endcase
 

	        
end


//////////////////////////ADD or SUB two floating point numbers//////////////////////
FPU_Add2    Add1(
	        .OP1(OP1),
	        .OP2(OP2),
	        .add_select(add_select),
	        .sub_select(sub_select),
	        .Result_comb(Add_Result),
	        .valid(Add_valid)
            );


//////////////////////////////////////Multiply two floating point numbers///////////////////
FPU_MULT    MULT1(.clk(clk),
	        .rstn(rstn),
	        .OP1(OP1),
	        .OP2(OP2),
	        .mult_select(mult_select),
	        .Result_comb(MULT_Result),
	        .valid(Mult_valid)

            );




/////////////////Muxing the output of logic blocks/////////
always@(*)begin

    if(OP_select[1])begin

        Result=MULT_Result;
    end
    else begin
    	Result=Add_Result;
    end


end

always@(*)begin
	
	if(mult_select==1'b1)begin
	   data_valid=Mult_valid;
		
	end
	else if ((add_select || sub_select))begin
		data_valid=Add_valid;
	end
	else begin
		data_valid=1'b0;
	end
end





/////////////////Generate Flags////////////////////


assign zero_flag = !(|Result) ;
assign INF_flag = (&Result[30:23]) && (!(|Result[22:0]))  ;
assign NAN_flag = (&Result[30:23]) && (|Result[22:0]) ;






endmodule



