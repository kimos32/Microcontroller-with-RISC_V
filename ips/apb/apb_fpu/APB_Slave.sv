module APB_Slave_interface
#(
    parameter APB_ADDR_WIDTH = 32  
)
(   input                        CLK,
    input                        RSTN,
    
    input   [APB_ADDR_WIDTH-1:0] PADDR,
    input                 [31:0] PWDATA,
    input                        PWRITE,
    input                        PSEL,
    input                        PENABLE,
    output                [31:0] PRDATA,
    output reg                   PREADY,
    output                       PSLVERR,


    input                 [31:0] data_slave,
    input                        data_valid,

    output  reg            [1:0] register_addr,
    output                       write,
    output                       enable_reg,
    output                [31:0] Wdata,
    output                       FPU_enable


);



localparam OP1_ADDR='h1A108000;
localparam OP2_ADDR='h1A108004;
localparam OpSelect_ADDR='h1A108008;
localparam Flag_ADDR='h1A108012;
localparam Result_ADDR='h1A10800C;


////////////Mapping of address////////

always@(*)begin
		case(PADDR)
		OP1_ADDR:begin 
        register_addr=2'b00;
        PREADY=1'b1;
        end 
		OP2_ADDR:begin 
        register_addr=2'b01;
        PREADY=1'b1;
        end 
		OpSelect_ADDR:begin 
        register_addr=2'b10;
        PREADY=1;
        end 
		Flag_ADDR:begin 
        register_addr=2'b11;
        PREADY=1'b1;
        end 
		Result_ADDR:begin 
        register_addr=2'b00;
        PREADY=data_valid | 1;
        end 
		default:begin 
        register_addr=2'b00;
        PREADY=1'b1;////this is an error that should be handled
        end
        endcase
end

////////////Mapping of WDATA and control signal//////////

assign Wdata = PWDATA ;

assign write = PWRITE ;

////////////Mapping of enable//////////

assign enable_reg = (PSEL&&PENABLE&&PWRITE) ;
assign FPU_enable = (PSEL&&PENABLE&&!PWRITE) ;

//////////Mapping of data from slave/////

assign PRDATA = data_slave ;



///////always ready to recieve//////



 //assign PREADY =(PWRITE)?1'b1: (1'b1 && data_valid) ;

assign PSLVERR = 1'b0;


endmodule





