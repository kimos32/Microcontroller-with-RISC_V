
module USB_axicore #(parameter ADDR_W = 32, parameter Data_W = 32, parameter usb_mem_W = 6,parameter DSIZE = 8,parameter ASIZE = 5,b_a_w = 2, f_n_w = 4, 
    MEM_ADDR_WIDTH = 6, MEM_NUM_COL=4, MEM_COL_WIDTH=32, MEM_DATA_WIDTH =MEM_COL_WIDTH*MEM_NUM_COL)
(
input clk,
input reset,


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

//USB IN
    input wire        SIE_clk,
    input wire        UTMI_clk,
    input              DP, DM,

//USB OUT
    output          TX_DP,
    output            TX_DM,
    output        TX_en

);


wire                    R_Ready_Address; 
wire                    Valid_Data_R;
wire                    Write_Ready;

wire   [Data_W-1:0]     Read_Data_axi;
wire   [ADDR_W-1:0]     Write_Address_axi;
wire   [2:0]            W_Prot;
wire                    Write_Valid;
wire   [Data_W-1:0]     Write_Data_axi;
wire   [3:0]            Write_Strobe;


wire                    R_Valid_Address;
wire                    Read_Ready;
wire   [ADDR_W-1:0]     Read_Address_axi;
wire   [2:0]            R_Prot;


USB_AXI_TOP U0_USB_AXI_TOP (
.Clk_axi(clk), 
.Rst(reset),
.R_Valid_Address(R_Valid_Address), 
.Read_Ready(Read_Ready),
.Read_Address_axi(Read_Address_axi),
.R_Prot(R_Prot),

.Write_Address_axi(Write_Address_axi),
.W_Prot(W_Prot),
.Write_Valid(Write_Valid),
.Write_Data_axi(Write_Data_axi),
.Write_Strobe(Write_Strobe),
//USB IN
.SIE_clk(SIE_clk),
.UTMI_clk(UTMI_clk),
.DP(DP), 
.DM(DM),
//USB OUT
.TX_DP(TX_DP),
.TX_DM(TX_DM),
.TX_en(TX_en),
//Slave_outputs
.R_Ready_Address(R_Ready_Address), 
.Valid_Data_R(Valid_Data_R),
.Write_Ready(Write_Ready), 
.Read_Data_axi(Read_Data_axi)

);

top_module U0_slave4(.clk(clk),
.reset(reset),
.ARPROT(ARPROT),
.ARID(ARID),
.ARADDR(ARADDR),
.ARLEN(ARLEN),
.ARSIZE(ARSIZE),
.ARBURST(ARBURST),
.ARVALID(ARVALID),
.R_Ready_Address(R_Ready_Address),
.ARREADY(ARREADY),
.Read_Address(Read_Address_axi),
.R_Valid_Address(R_Valid_Address),
.R_Prot(R_Prot),
.RREADY(RREADY),
.Read_Data(Read_Data_axi),
.Valid_Data_R(Valid_Data_R),
.RID(RID),
.RLAST(RLAST),
.RDATA(RDATA),
.RRESP(RRESP),
.RVALID(RVALID),
.Read_Ready(Read_Ready),
.AWID(AWID),
.AWADDR(AWADDR),
.AWLEN(AWLEN),
.AWSIZE(AWSIZE),
.AWBURST(AWBURST),
.AWVALID(AWVALID),
.AWPROT(AWPROT),
.AWREADY(AWREADY),
.Write_Address(Write_Address_axi),
.W_Prot(W_Prot),
.WDATA(WDATA),
.WLAST(WLAST),
.WSTRB(WSTRB),
.WVALID(WVALID),
.Write_Ready(Write_Ready),
.WREADY(WREADY),
.Write_Valid(Write_Valid),
.Write_Data(Write_Data_axi),
.Write_Strobe(Write_Strobe),
.BREADY(BREADY),
.BID(BID),
.BRESP(BRESP),
.BVALID(BVALID)
);
endmodule