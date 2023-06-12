module FPU_APB
#(
    parameter APB_ADDR_WIDTH = 32  //APB slaves are 4KB by default
)
(   input                        CLK,
    input                        RSTN,
    
    input   [APB_ADDR_WIDTH-1:0] PADDR,
    input                 [31:0] PWDATA,
    input                        PWRITE,
    input                        PSEL,
    input                        PENABLE,
    output                [31:0] PRDATA,
    output                       PREADY,
    output                       PSLVERR      



	);

//////////APB Signals////////////
wire      [1:0] register_addr;
wire      [31:0] data_slave;
wire      [31:0] Wdata;
wire             enable_reg;
wire             write;


///////////////Register bank signals///////////////
wire      [31:0] OP1,OP2;
wire      [2:0]  OP_select;
wire      [31:0] Result_Fpu; 


///////////FPU Signals/////////
wire            data_valid;
wire            FPU_enable;


APB_Slave_interface    #(.APB_ADDR_WIDTH(32))

slave1 (.CLK(CLK),
	    .RSTN(RSTN),
	    .PADDR(PADDR),
	    .PWDATA(PWDATA),
	    .PWRITE(PWRITE),
	    .PSEL(PSEL),
	    .PENABLE(PENABLE),
	    .PRDATA(PRDATA),
	    .PREADY(PREADY),
	    .PSLVERR(PSLVERR),
	    .data_slave(Result_Fpu),
	    .data_valid(data_valid),
	    .register_addr(register_addr),
	    .write(write),
	    .enable_reg(enable_reg),
	    .FPU_enable(FPU_enable),
	    .Wdata(Wdata)
	    );


FPU      FPU1(.clk(CLK),
	          .rstn(RSTN),
	          .OP1(OP1),
	          .OP2(OP2),
	          .OP_select(OP_select),
	          .enable(FPU_enable),
	          .Result(Result_Fpu),
	          .data_valid(data_valid)
);




Register_Bank     #(
     .MEM_WIDTH (32),
     .MEM_DEPTH (3) 
)

reg1 (.CLK(CLK),
	  .RSTN(RSTN),
	  .ADDR(register_addr),
	  .WDATA(Wdata),
	  .WRITE(write),
	  .ENABLE(enable_reg),
	  .RDATA(data_slave),
	  .OP1(OP1),
	  .OP2(OP2),
	  .OP_select(OP_select)
	  );



endmodule