module APB_Slave_interface
#(
    parameter APB_ADDR_WIDTH = 32  
)
(
    
    input   [APB_ADDR_WIDTH-1:0] PADDR,
    input                 [31:0] PWDATA,
    input                        PWRITE,
    input                        PSEL,
    input                        PENABLE,
    output                [31:0] PRDATA,
    output                       PREADY,
    output                       PSLVERR,


    input                 [31:0] data_register,


    output  reg            [2:0] register_addr,
    output                       write_enable,
    output                       read_enable,
    output                       enable_register,
    output                [31:0] Wdata



);



localparam OP1_ADDR='h1A111000;
localparam OP2_ADDR='h1A111004;
localparam OpSelect_ADDR='h1A111008;
localparam Flag_ADDR='h1A11100C;
localparam Result_ADDR='h1A111010;



reg     write_valid;
////////////Mapping of address////////

always@(*)begin

write_valid=1'b1;
		case(PADDR)
		OP1_ADDR:begin 
        register_addr=3'b000;

        end 
		OP2_ADDR:begin 
        register_addr=3'b001;

        end 
		OpSelect_ADDR:begin 
        register_addr=3'b010;

        end 
		Flag_ADDR:begin 
        register_addr=3'b011;
 
        end 
		Result_ADDR:begin 
        register_addr=3'b100;
        write_valid=1'b0;
        end 
		default:begin 
        register_addr=3'b000;

        end
        endcase
end

////////////Mapping of WDATA and control signal//////////

assign Wdata = PWDATA ;

assign write_enable = PWRITE && write_valid ;
assign read_enable  = !PWRITE;

////////////Mapping of enable//////////

assign enable_register = (PSEL&&PENABLE) ;



/////////Mapping of PRDATA//////
assign PRDATA=data_register;



///////always ready to transmit//////

assign PREADY=1'b1;


assign PSLVERR = 1'b0;


endmodule





