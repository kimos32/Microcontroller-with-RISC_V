module USB_AXI_TOP #(parameter ADDR_W = 32, parameter Data_W = 32, parameter usb_mem_W = 6,parameter DSIZE = 8,parameter ASIZE = 5,b_a_w = 2, f_n_w = 4, 
    MEM_ADDR_WIDTH = 8, MEM_COL_WIDTH=32, MEM_DATA_WIDTH =32)
(
//Slave IN
    input                   Clk_axi, Rst,
    input                   R_Valid_Address, Read_Ready,
    input [ADDR_W-1:0]      Read_Address_axi,
    input [2:0]             R_Prot,

    input [ADDR_W-1:0]      Write_Address_axi,
    input [2:0]             W_Prot,
    input                   Write_Valid,
    input [Data_W-1:0]      Write_Data_axi,
    input [3:0]             Write_Strobe,

//USB IN
    input wire              SIE_clk,
    input wire              UTMI_clk,
    input                   DP, DM,

//USB OUT
    output                  TX_DP,
    output                  TX_DM,
    output                  TX_en,

//Slave_outputs
    output                  R_Ready_Address, Valid_Data_R,
    output                  R_Error, Write_Ready, W_Error,
    output [Data_W-1:0]     Read_Data_axi

); 


wire                        Reg_WrEn;
wire [5:0]   Reg_Address;
wire [7:0]                  Reg_WrData;
wire                        Reg_RdEn;
wire [7:0]                  Reg_RdData;
wire                        we_b;
wire [MEM_ADDR_WIDTH-1:0]   addrB;
wire [MEM_COL_WIDTH-1:0]    dinB;
wire [MEM_COL_WIDTH-1:0]    doutB;
wire                        Data_toggle_RF, Data_toggle_RF_sync;
wire                        UHCI_clk;
wire                        sync_rst_UTMI,sync_rst_SIE;


//AXI Inst.
axi_top_module U0_AXI(
.Clk_axi(Clk_axi),
.Rst_axi(Rst),
.Rst_UHCI(sync_rst_SIE),
.Clk_UHCI(UHCI_clk),
.R_Valid_Address(R_Valid_Address),
.Read_Ready(Read_Ready),
.Read_Address_axi(Read_Address_axi),
.R_Prot(R_Prot),
.Write_Address_axi(Write_Address_axi),
.W_Prot(W_Prot),
.Write_Valid(Write_Valid),
.Write_Data_axi(Write_Data_axi),
.Write_Strobe(Write_Strobe),
.r_data_reg(Reg_RdData),
.r_data_mem(doutB),
.data_reg_toggle(Data_toggle_RF_sync),
.R_Ready_Address(R_Ready_Address),
.Valid_Data_R(Valid_Data_R),
.R_Error(R_Error),
.Write_Ready(Write_Ready),
.W_Error(W_Error),
.Read_Data_axi(Read_Data_axi),
.w_data_b(dinB),
.addr_b(addrB),
.addr_reg(Reg_Address),
.data_reg(Reg_WrData),
.rd_en_reg(Reg_RdEn),
.wr_en_reg(Reg_WrEn),
.we_b(we_b)
    );
    
RST_SYNC U0_RST_UTMI(
.RST(Rst),
.CLK(UTMI_clk),
.SYNC_RST(sync_rst_UTMI)
);

RST_SYNC U0_RST_SIE(
.RST(Rst),
.CLK(SIE_clk),
.SYNC_RST(sync_rst_SIE)
);
 
 BIT_SYNC U1_BIT_SYNC_HC(
.CLK(Clk_axi),
.RST(Rst),
.ASYNC(Data_toggle_RF),
.SYNC(Data_toggle_RF_sync)
 );

USB_top U0_USB(
.SIE_clk(SIE_clk),
.UTMI_clk(UTMI_clk),
.reset_SIE(sync_rst_SIE),
.reset_UTMI(sync_rst_UTMI),
.DP(DP),
.DM(DM),
.Reg_WrEn(Reg_WrEn),
.Reg_Address(Reg_Address),
.Reg_WrData(Reg_WrData),
.Reg_RdEn(Reg_RdEn),
.Reg_RdData(Reg_RdData),
.TX_DP(TX_DP),
.TX_DM(TX_DM),
.TX_en(TX_en),
.En_B(we_b),
.addrB(addrB),
.dinB(dinB),
.doutB(doutB),
.Data_toggle_RF(Data_toggle_RF),
.UHCI_clk(UHCI_clk)
);

endmodule