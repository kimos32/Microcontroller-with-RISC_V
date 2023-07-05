module axi_top_module #(parameter ADDR_W = 32, parameter Data_W = 32, parameter usb_mem_W = 8 , parameter usb_reg_W = 6)(
//INPUTS
//Slave_inputs
input			          	     Clk_axi, 
input                   Rst_axi,Rst_UHCI,
input                   Clk_UHCI,
input				             	 R_Valid_Address, Read_Ready,
input [ADDR_W-1:0]		    Read_Address_axi,
input [2:0]		   	       R_Prot,

input [ADDR_W-1:0]		    Write_Address_axi,
input [2:0]		           W_Prot,
input 				  	           Write_Valid,
input [Data_W-1:0]    		Write_Data_axi,
input [3:0]     		      Write_Strobe,

//UHCI inputs
input [7:0]		 	       	 r_data_reg,
input [31:0]            r_data_mem,
input                   data_reg_toggle,

//OUTPUTS
//Slave_outputs
output 	          		    R_Ready_Address, Valid_Data_R,
output 		 	             R_Error, Write_Ready, W_Error,
output [Data_W-1:0]   	 Read_Data_axi,

//UHCI outputs
output [Data_W-1:0]		   w_data_b,
output [usb_mem_W-1:0]	 addr_b,
output [usb_reg_W-1:0]  addr_reg,
output [7:0]            data_reg,

//memory signals
output                   rd_en_reg,wr_en_reg,
output                   we_b
);

// FIFO and mux wires
wire              wr_en_fifo_address,wr_en_fifo_data;
wire [ADDR_W-1:0] w_address_FIFO;
wire [Data_W-1:0] w_data_FIFO;
wire              full_addr,wr_empty_addr,rd_empty_addr;
wire              full_data,wr_empty_data,rd_empty_data;
wire [ADDR_W-1:0] R_address_mux;
wire [1:0]        Read_en;
wire [ADDR_W-1:0] address_mux_i,address_mux_o;
wire              r_en_address,r_en_data;
wire [Data_W-1:0] data_o_fifo;
wire              clear;

//selector wires
wire [5:0]        address_sel_i;
wire              mem_reg;
wire              mem_wr;

//interface signals
wire [31:0]       address_interface_i,data_interface_i,address_interface_o,data_interface_o;

wire              empty_read;
wire              data_toggle_en;
wire              data_mem_toggle, data_mem_toggle_sync;
wire              rd_en_reg_unsync;
wire              data_toggle_en_unsync;


AXI_FSM U0_FSM (
.Clk(Clk_axi), 
.Rst(Rst_axi),
//busses interface
.R_Valid_Address(R_Valid_Address), 
.Read_Ready(Read_Ready),
.Read_Address_axi(Read_Address_axi),
.R_Prot(R_Prot),
.Write_Address_axi(Write_Address_axi),
.W_Prot(W_Prot),
.Write_Valid(Write_Valid),
.Write_Data_axi(Write_Data_axi),
.Write_Strobe(Write_Strobe),
.r_data_mem(r_data_mem),
.r_data_reg(r_data_reg),
.data_reg_toggle(data_reg_toggle),
.data_mem_toggle(data_mem_toggle_sync),
.R_Ready_Address(R_Ready_Address), 
.Valid_Data_R(Valid_Data_R),
.R_Error(R_Error), 
.Write_Ready(Write_Ready), 
.W_Error(W_Error),
.Read_Data_axi(Read_Data_axi),
//address fifo signals
.wr_en_fifo_data(wr_en_fifo_data),
.wr_en_fifo_address(wr_en_fifo_address),
.w_address_FIFO(w_address_FIFO),
.w_data_FIFO(w_data_FIFO),
.empty(wr_empty_addr),
.full(full_addr),
.clear(clear),
//decoder  signals 		 
.R_address_mux(R_address_mux),
.Read_en(Read_en)//mux selector
);

dcfifo_example #(.LOG_DEPTH(5), .WIDTH(32), .ALMOST_FULL_VALUE(30),.ALMOST_EMPTY_VALUE (2),    
    .NUM_WORDS(31), .OVERFLOW_CHECKING(0), .UNDERFLOW_CHECKING (0) ) U0_address(

    .aclr(clear),
    .wrclk(Clk_axi),
    .wrreq(wr_en_fifo_address),
    .data(w_address_FIFO),
    .wrempty(wr_empty_addr),
    .wrfull(full_addr),
    .wr_almost_empty( ),
    .wr_almost_full( ),
    .wrusedw( ),
    .rdclk(Clk_UHCI),
    .rdreq(r_en_address),
    .q(address_interface_i),
    .rdempty(rd_empty_addr),
    .rdfull(),
    .rd_almost_empty( ),    
    .rd_almost_full( ),    
    .rdusedw( )
);

dcfifo_example #(.LOG_DEPTH(5), .WIDTH(32), .ALMOST_FULL_VALUE(30),.ALMOST_EMPTY_VALUE (2),    
    .NUM_WORDS(31), .OVERFLOW_CHECKING(0), .UNDERFLOW_CHECKING (0) ) U0_Data(

    .aclr(clear),
    .wrclk(Clk_axi),
    .wrreq(wr_en_fifo_data),
    .data(w_data_FIFO),
    .wrempty(wr_empty_data),
    .wrfull(full_data),
    .wr_almost_empty( ),
    .wr_almost_full( ),
    .wrusedw( ),
    .rdclk(Clk_UHCI),
    .rdreq(r_en_data),
    .q(data_interface_i),
    .rdempty(rd_empty_data),
    .rdfull(),
    .rd_almost_empty( ),    
    .rd_almost_full( ),    
    .rdusedw( )
);

/*
fifo_axi #(.DSIZE(32), .ASIZE(6) ) U0_fifo_address
(
.write_data(w_address_FIFO),
.write_enable(wr_en_fifo_address),
.write_clk(Clk_axi), 
.write_rst(Rst),
.read_enable(r_en_address), 
.read_clk(Clk_UHCI), 
.read_rst(Rst),
.read_data(address_interface_i),
.full(full_addr),
.empty(empty_addr),
.empty_read(empty_read)
 );
 
 fifo_axi #(.DSIZE(32), .ASIZE(6)) U0_fifo_data 
(
.write_data(w_data_FIFO),
.write_enable(wr_en_fifo_data),
.write_clk(Clk_axi), 
.write_rst(Rst),
.read_enable(r_en_data), 
.read_clk(Clk_UHCI), 
.read_rst(Rst),
.read_data(data_interface_i),
.full(full_data),
.empty(empty_data)
 );
 */
MUX U0_MUX(
.Read_en(Read_en), 
.empty(wr_empty_addr),
.R_address(R_address_mux), 
.W_address(address_interface_o),
.address_mux_o(address_mux_o)
);

decoder U0_decoder(
.Clk(Clk_axi),
.Rst(Rst_axi),
.address_decoder_i(address_mux_o),
.Read_en(Read_en),
.rd_en_reg(rd_en_reg_unsync),
.addr_b(addr_b),
.addr_reg(addr_reg),
.mem_reg(mem_reg),
.data_toggle_en(data_toggle_en_unsync)
  );
  
 BIT_SYNC U1_BIT_SYNC_TOGGLE_EN(
.CLK(Clk_UHCI),
.RST(Rst_UHCI),
.ASYNC(data_toggle_en_unsync),
.SYNC(data_toggle_en)
 );  
  
data_toggle U0_data_toggle(
.Clk(Clk_UHCI),
.Rst(Rst_UHCI),
.data_toggle_en(data_toggle_en),
.data_toggle(data_mem_toggle),
.we_b(mem_wr)
);

 BIT_SYNC U1_BIT_SYNC_HC(
.CLK(Clk_axi),
.RST(Rst_axi),
.ASYNC(data_mem_toggle),
.SYNC(data_mem_toggle_sync)
 );

 BIT_SYNC U1_BIT_SYNC_READ_REG(
.CLK(Clk_UHCI),
.RST(Rst_UHCI),
.ASYNC(rd_en_reg_unsync),
.SYNC(rd_en_reg)
 ); 
 
interface_with_FIFO U0_interface(
.Clk(Clk_UHCI),
.Rst(Rst_UHCI),
.address_interface_i(address_interface_i),
.data_interface_i(data_interface_i),
.wr_empty(wr_empty_addr),
.rd_empty(rd_empty_addr),
.read_en_data(r_en_data), 
.read_en_address(r_en_address),
.address_interface_o(address_interface_o),
.data_interface_o(data_interface_o),
.wr_en_reg(wr_en_reg),
.mem_wr(mem_wr)
  );
      
selector #( .OUT1(32), .OUT2(8) ) U0_data 
(
.reg_mem(mem_reg), //decoder
.A(data_interface_o),
.OUT_1(w_data_b),
.OUT_2(data_reg)
  );

assign we_b = mem_wr;

endmodule
