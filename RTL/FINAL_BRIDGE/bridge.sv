module bridge #(parameter DATASIZE = 32,   
                parameter ADDRSIZE = 32,
				parameter TOP_FIFO_DATA_SIZE = (DATASIZE+ADDRSIZE+4+(DATASIZE/8)),
				parameter TOP_FIFO_ADDR_SIZE = 4,
				parameter BOTTOM_FIFO_DATA_SIZE = DATASIZE,
				parameter BOTTOM_FIFO_ADDR_SIZE = 4
				)
(
// system inputs
  input   APB_clk, APB_rst_n,
  input   AXI_clk, AXI_rst_n,


//*****************inputs & outputs from AXI slave interface
//_____________________________Read Address_____________________________//
input   [2:0]   ARPROT,
input   [5 :0]  ARID,
input   [31 :0] ARADDR,
input   [7 :0]  ARLEN,
input   [2:0]   ARSIZE,
input   [1:0]   ARBURST,
input           ARVALID,

output          ARREADY,  
//_____________________________Read Data_____________________________//
input           RREADY,

output  [5 :0]  RID,
output          RLAST,
output  [31 :0] RDATA,
output          RRESP,
output          RVALID,
//_____________________________Write Address_____________________________//
input   [5 :0]  AWID,
input   [31 :0] AWADDR,
input   [7 :0]  AWLEN,
input   [2:0]   AWSIZE,
input   [1:0]   AWBURST,
input           AWVALID,
input   [2:0]   AWPROT,

output          AWREADY,

//_____________________________Write Data_____________________________//
input   [31 :0] WDATA,
input           WLAST,
input   [3:0]   WSTRB,
input           WVALID,

output          WREADY,
//_____________________________Write Response_____________________________//
input           BREADY,

output  [5 :0]  BID,
output          BRESP,
output          BVALID,

//********* outputs & inputs from APB master interface
// inputs to APB master interface from APB slave
input pready0, pready1, pready2, pready3, pready4, pready5, pready6, pready7, pready8, pready9,
input pslverr0, pslverr1, pslverr2, pslverr3, pslverr4, pslverr5, pslverr6, pslverr7, pslverr8, pslverr9,
input [DATASIZE-1:0] prdata0, prdata1, prdata2, prdata3, prdata4, prdata5, prdata6, prdata7, prdata8, prdata9,

// outputs to APB slave from APB master interface
output PSEL0, PSEL1, PSEL2, PSEL3, PSEL4, PSEL5, PSEL6, PSEL7, PSEL8, PSEL9,
output PENABLE,
output [ADDRSIZE-1:0] PADDR,
output [DATASIZE-1:0] PWDATA,
output PWRITE,
output [2:0] PPROT,
output [(DATASIZE/8)-1:0] PSTRB
);

// wires between AXI slave interface and AXI_to_APB_bridge

// read channels
// input to AXI slave interface
wire  w_R_Ready_Address;
//wire  w_R_Error;
wire  [31 :0] w_Read_Data; 
wire  w_Valid_Data_R;
// outputs from AXI slave interface 
wire [31 :0] w_Read_Address;
wire  w_R_Valid_Address;
wire [2:0]  w_R_Prot;
wire w_Read_Ready;

// write channels
// inputs to AXI slave interface 
wire  w_Write_Ready;
//wire  w_W_Error;
// outputs from AXI slave interface 
wire [31 :0] w_Write_Address;
wire [2:0] w_W_Prot;
wire w_Write_Valid;
wire [31 :0] w_Write_Data;
wire [3:0] w_Write_Strobe;



AXI_to_APB_bridge #(.DATASIZE(DATASIZE), .ADDRSIZE(ADDRSIZE), .TOP_FIFO_DATA_SIZE(TOP_FIFO_DATA_SIZE),
					.TOP_FIFO_ADDR_SIZE(TOP_FIFO_ADDR_SIZE), .BOTTOM_FIFO_DATA_SIZE(BOTTOM_FIFO_DATA_SIZE),
					.BOTTOM_FIFO_ADDR_SIZE(BOTTOM_FIFO_ADDR_SIZE)) AXI_to_APB_bridge_unit
					
(.APB_clk(APB_clk), .APB_rst_n(APB_rst_n), .AXI_clk(AXI_clk), .AXI_rst_n(AXI_rst_n),
 .write_valid(w_Write_Valid), .write_data(w_Write_Data), .write_address(w_Write_Address),
 .write_strobe(w_Write_Strobe), .write_pprot(w_W_Prot), .read_pprot(w_R_Prot),
 .read_address(w_Read_Address), .read_address_valid(w_R_Valid_Address), .read_data_ready(w_Read_Ready),
 .write_ready(w_Write_Ready), .read_address_ready(w_R_Ready_Address), .prdata(w_Read_Data), .read_data_valid(w_Valid_Data_R),
.prdata0(prdata0), .prdata1(prdata1), .prdata2(prdata2), .prdata3(prdata3), .prdata4(prdata4),
.prdata5(prdata5), .prdata6(prdata6), .prdata7(prdata7), .prdata8(prdata8), .prdata9(prdata9),
.pready0(pready0), .pready1(pready1), .pready2(pready2), .pready3(pready3), .pready4(pready4),
.pready5(pready5), .pready6(pready6), .pready7(pready7), .pready8(pready8), .pready9(pready9),
.pslverr0(pslverr0), .pslverr1(pslverr1), .pslverr2(pslverr2), .pslverr3(pslverr3), .pslverr4(pslverr4),
.pslverr5(pslverr5), .pslverr6(pslverr6), .pslverr7(pslverr7), .pslverr8(pslverr8), .pslverr9(pslverr9),
 .PSEL0(PSEL0), .PSEL1(PSEL1), .PSEL2(PSEL2),
 .PSEL3(PSEL3), .PSEL4(PSEL4), .PSEL5(PSEL5), 
 .PSEL6(PSEL6), .PSEL7(PSEL7), .PSEL8(PSEL8), .PSEL9(PSEL9),
 .PENABLE(PENABLE), .PADDR(PADDR), .PWDATA(PWDATA), .PWRITE(PWRITE), .PPROT(PPROT), .PSTRB(PSTRB)
);


top_module AXI_Slave_Interface_Unit
(

.clk(AXI_clk),
.reset(AXI_rst_n),
.ARPROT(ARPROT),
.ARID(ARID),
.ARADDR(ARADDR),
.ARLEN(ARLEN),
.ARSIZE(ARSIZE),
.ARBURST(ARBURST),
.ARVALID(ARVALID),
.R_Ready_Address(w_R_Ready_Address),
.ARREADY(ARREADY),
.Read_Address(w_Read_Address),
.R_Valid_Address(w_R_Valid_Address),
.R_Prot(w_R_Prot),

.RREADY(RREADY),
//.R_Error(w_R_Error),
.Read_Data(w_Read_Data),
.Valid_Data_R(w_Valid_Data_R),
.RID(RID),
.RLAST(RLAST),
.RDATA(RDATA),
.RRESP(RRESP),
.RVALID(RVALID),
.Read_Ready(w_Read_Ready),


.AWID(AWID),
.AWADDR(AWADDR),
.AWLEN(AWLEN),
.AWSIZE(AWSIZE),
.AWBURST(AWBURST),
.AWVALID(AWVALID),
.AWPROT(AWPROT),
.AWREADY(AWREADY),
.Write_Address(w_Write_Address),
.W_Prot(w_W_Prot),


.WDATA(WDATA),
.WLAST(WLAST),
.WSTRB(WSTRB),
.WVALID(WVALID),
.Write_Ready(w_Write_Ready),
.WREADY(WREADY),
.Write_Valid(w_Write_Valid),
.Write_Data(w_Write_Data),
.Write_Strobe(w_Write_Strobe),

.BREADY(BREADY),
//.W_Error(w_W_Error),
.BID(BID),
.BRESP(BRESP),
.BVALID(BVALID)
);

endmodule
