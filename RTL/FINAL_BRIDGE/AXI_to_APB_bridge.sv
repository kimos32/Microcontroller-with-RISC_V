// 2/3 of the AXI to APB bridge, includes CDC and APB Master
module AXI_to_APB_bridge #(parameter DATASIZE = 32,   
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

// inputs from AXI slave interface
input write_valid, 
input [DATASIZE-1:0] write_data,
input [ADDRSIZE-1:0] write_address,
input [(DATASIZE/8)-1:0] write_strobe,
input [2:0] write_pprot,
input [2:0] read_pprot,
input [ADDRSIZE-1:0] read_address,
input read_address_valid,
input read_data_ready,

// outputs to AXI slave interface
output write_ready,
output read_address_ready,
output [DATASIZE-1:0] prdata,
output read_data_valid,

// inputs from APB slave
input pready0, pready1, pready2, pready3, pready4, pready5, pready6, pready7, pready8, pready9,
input pslverr0, pslverr1, pslverr2, pslverr3, pslverr4, pslverr5, pslverr6, pslverr7, pslverr8, pslverr9,
input [DATASIZE-1:0] prdata0, prdata1, prdata2, prdata3, prdata4, prdata5, prdata6, prdata7, prdata8, prdata9,

// outputs to APB slave
output PSEL0, PSEL1, PSEL2, PSEL3, PSEL4, PSEL5, PSEL6, PSEL7, PSEL8, PSEL9,
output PENABLE,
output [ADDRSIZE-1:0] PADDR,
output [DATASIZE-1:0] PWDATA,
output PWRITE,
output [2:0] PPROT,
output [(DATASIZE/8)-1:0] PSTRB
);

// wires between concatenator and top fifo
wire [TOP_FIFO_DATA_SIZE-1:0] w_wdata_top, w_rdata_top;
wire w_winc_top, w_wfull_top, w_rinc_top, w_rempty_top;
// wires between deconcatenator and APB master
wire w_transfer, w_write_read;
wire [ADDRSIZE-1:0] w_addr;
wire [DATASIZE-1:0] w_wdata;
wire [(DATASIZE/8)-1:0] w_strb;
wire [2:0] w_pprot;
// wires between APB master and MUXs
wire w_PREADY, w_PSLVERR;
wire [DATASIZE-1:0] w_PRDATA;
// wires between APB master and FIFOs
wire w_APB_setup_flag;
wire w_PREADY_to_AXI_read;
wire [DATASIZE-1:0] w_wdata_bottom;
// wires from bottom fifo 
wire w_wfull_bottom, w_rinc_bottom, w_rempty_bottom;
wire winc_bottom;

// assign w_PENABLE = PENABLE;
assign w_rinc_top = w_APB_setup_flag & (!w_rempty_top);
//assign w_transfer = !w_rempty_top;
//assign w_rinc_bottom = read_data_ready & (!w_rempty_bottom);
assign read_data_valid = !w_rempty_bottom; 
assign winc_bottom = w_PREADY_to_AXI_read &  (!w_wfull_bottom);


concatenator #(.DATASIZE(DATASIZE), .ADDRSIZE(ADDRSIZE), .TOP_FIFO_DATA_SIZE(TOP_FIFO_DATA_SIZE)) concatenator_unit 
(
.write_valid(write_valid), .write_data(write_data), .write_address(write_address), 
.write_strobe(write_strobe), .write_pprot(write_pprot), .read_pprot(read_pprot),
.read_address(read_address), .read_address_valid(read_address_valid), 
.wfull_top(w_wfull_top), .wfull_bottom(w_wfull_bottom), .write_ready(write_ready),
.read_address_ready(read_address_ready), .conc_data(w_wdata_top), .winc_top(w_winc_top),
.read_data_ready(read_data_ready), .rempty_bottom(w_rempty_bottom)
);

fifo_top #(.DSIZE(TOP_FIFO_DATA_SIZE), .ASIZE(TOP_FIFO_ADDR_SIZE)) top_fifo_unit
(
.rdata(w_rdata_top), .wfull(w_wfull_top), .rempty(w_rempty_top), .wdata(w_wdata_top),
.winc(w_winc_top), .wclk(AXI_clk), .wrst_n(AXI_rst_n),
.rinc(w_rinc_top), .rclk(APB_clk), .rrst_n(APB_rst_n)
);

deconcatenator #(.DATASIZE(DATASIZE), .ADDRSIZE(ADDRSIZE), .TOP_FIFO_DATA_SIZE(TOP_FIFO_DATA_SIZE)) deconcatenator_unit
(
.conc_data_fifo(w_rdata_top), .rempty(w_rempty_top), .transfer(w_transfer), .addr(w_addr), 
.wdata(w_wdata), .strb(w_strb), .pprot(w_pprot), .write_read(w_write_read)
);

fifo_top #(.DSIZE(BOTTOM_FIFO_DATA_SIZE), .ASIZE(BOTTOM_FIFO_ADDR_SIZE)) bottom_fifo_unit
(
.rdata(prdata), .wfull(w_wfull_bottom), .rempty(w_rempty_bottom), .wdata(w_wdata_bottom),
.winc(winc_bottom), .wclk(APB_clk), .wrst_n(APB_rst_n),
.rinc(w_rinc_bottom), .rclk(AXI_clk), .rrst_n(AXI_rst_n)
);

APB_master #(.DATASIZE(DATASIZE), .ADDRSIZE(ADDRSIZE)) APB_master_unit
(
.PCLK(APB_clk), .PRESETn(APB_rst_n), .addr(w_addr), .wdata(w_wdata), 
.write_read(w_write_read), .strb_input(w_strb), .PPROT_input(w_pprot), .transfer(w_transfer),
.PREADY(w_PREADY), .PRDATA(w_PRDATA), .PSLVERR(w_PSLVERR),
.PENABLE(PENABLE), .PWRITE(PWRITE), .PWDATA(PWDATA),
.PSEL0(PSEL0), .PSEL1(PSEL1), .PSEL2(PSEL2), 
.PSEL3(PSEL3), .PSEL4(PSEL4), .PSEL5(PSEL5), 
.PSEL6(PSEL6), .PSEL7(PSEL7), .PSEL8(PSEL8), .PSEL9(PSEL9),
.PADDR(PADDR), .PSTRB(PSTRB), .PPROT(PPROT),
.prdata_out(w_wdata_bottom), .PREADY_to_AXI_read(w_PREADY_to_AXI_read), .APB_setup_flag(w_APB_setup_flag)
);

MUXs #(.DATASIZE(DATASIZE), .ADDRSIZE(ADDRSIZE)) MUXs_unit
(
.PRDATA(w_PRDATA), .PREADY(w_PREADY), .PSLVERR(w_PSLVERR), 
.PRDATA_0(prdata0), .PRDATA_1(prdata1), .PRDATA_2(prdata2), .PRDATA_3(prdata3), .PRDATA_4(prdata4),
.PRDATA_5(prdata5), .PRDATA_6(prdata6), .PRDATA_7(prdata7), .PRDATA_8(prdata8), .PRDATA_9(prdata9),
.PREADY_0(pready0), .PREADY_1(pready1), .PREADY_2(pready2), .PREADY_3(pready3), .PREADY_4(pready4),
.PREADY_5(pready5), .PREADY_6(pready6), .PREADY_7(pready7), .PREADY_8(pready8), .PREADY_9(pready9),
.PSLVERR_0(pslverr0), .PSLVERR_1(pslverr1), .PSLVERR_2(pslverr2), .PSLVERR_3(pslverr3), .PSLVERR_4(pslverr4),
.PSLVERR_5(pslverr5), .PSLVERR_6(pslverr6), .PSLVERR_7(pslverr7), .PSLVERR_8(pslverr8), .PSLVERR_9(pslverr9),
.PADDR(PADDR)
);


rinc_bottom_generator rinc_bottom_generator_unit 
(
.AXI_clk(AXI_clk),	.read_data_ready(read_data_ready), .rempty_bottom(w_rempty_bottom), 
.rinc_bottom(w_rinc_bottom)
 );
 //.read_data_valid(read_data_valid)

endmodule
