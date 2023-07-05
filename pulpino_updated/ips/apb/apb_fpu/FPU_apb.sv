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
wire      [2:0] register_addr;
wire      [31:0] data_register;
wire      [31:0] Wdata;
wire             enable_register;
wire             write_enable;
wire             read_enable;


///////////////Register bank signals///////////////
wire      [31:0] OP1,OP2;
wire      [2:0]  OP_select;
wire      [31:0] Result_Fpu; 

/////////////////////////FPU Signals////////
wire              data_valid;



APB_Slave_interface    #(.APB_ADDR_WIDTH(32))

slave1 (.PADDR(PADDR),
	    .PWDATA(PWDATA),
	    .PWRITE(PWRITE),
	    .PSEL(PSEL),
	    .PENABLE(PENABLE),
	    .PRDATA(PRDATA),
	    .PREADY(PREADY),
	    .PSLVERR(PSLVERR),
	    .data_register(data_register),
	    .register_addr(register_addr),
	    .write_enable(write_enable),
	    .read_enable(read_enable),
	    .enable_register(enable_register),
	    .Wdata(Wdata)
	    );


FPU      FPU1(.clk(CLK),
	          .rstn(RSTN),
	          .OP1(OP1),
	          .OP2(OP2),
	          .OP_select(OP_select),
	          .Result(Result_Fpu),
	          .data_valid(data_valid)
);




Register_Bank     #(
     .MEM_WIDTH (32),
     .MEM_DEPTH (5) 
)

reg1 (.CLK(CLK),
	  .RSTN(RSTN),
	  .ADDR(register_addr),
	  .WDATA(Wdata),
	  .ENABLE(enable_register),
	  .write_enable(write_enable),
	  .read_enable(read_enable),
	  .Result_Fpu(Result_Fpu),
	  .Result_FPU_valid(data_valid),
	  .RDATA(data_register),
	  .OP1(OP1),
	  .OP2(OP2),
	  .OP_select(OP_select)
	  );



endmodule