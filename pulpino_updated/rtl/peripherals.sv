// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "axi_bus.sv"
`include "apb_bus.sv"
`include "debug_bus.sv"
`include "config.sv"

module peripherals
  #(
    parameter AXI_ADDR_WIDTH       = 32,
    parameter AXI_DATA_WIDTH       = 64,
    parameter AXI_USER_WIDTH       = 6,
    parameter AXI_SLAVE_ID_WIDTH   = 6,
    parameter AXI_MASTER_ID_WIDTH  = 6,
    parameter ROM_START_ADDR       = 32'h8000,
    //USB parameters
    parameter ADDR_W = 32,
    parameter Data_W = 32
  )
  (
    // Clock and Reset
    input logic clk_i,
    input logic rst_n,

    AXI_BUS.Master axi_spi_master,

    DEBUG_BUS.Master debug,

    input  logic             spi_clk_i,
    input  logic             testmode_i,
    input  logic             spi_cs_i,
    output logic [1:0]       spi_mode_o,
    output logic             spi_sdo0_o,
    output logic             spi_sdo1_o,
    output logic             spi_sdo2_o,
    output logic             spi_sdo3_o,
    input  logic             spi_sdi0_i,
    input  logic             spi_sdi1_i,
    input  logic             spi_sdi2_i,
    input  logic             spi_sdi3_i,

    AXI_BUS.Slave  slave,

    output logic              uart_tx,
    input  logic              uart_rx,
    output logic              uart_rts,
    output logic              uart_dtr,
    input  logic              uart_cts,
    input  logic              uart_dsr,

    output logic              spi_master_clk,
    output logic              spi_master_csn0,
    output logic              spi_master_csn1,
    output logic              spi_master_csn2,
    output logic              spi_master_csn3,
    output logic       [1:0]  spi_master_mode,
    output logic              spi_master_sdo0,
    output logic              spi_master_sdo1,
    output logic              spi_master_sdo2,
    output logic              spi_master_sdo3,
    input  logic              spi_master_sdi0,
    input  logic              spi_master_sdi1,
    input  logic              spi_master_sdi2,
    input  logic              spi_master_sdi3,

    input  logic              scl_pad_i,
    output logic              scl_pad_o,
    output logic              scl_padoen_o,
    input  logic              sda_pad_i,
    output logic              sda_pad_o,
    output logic              sda_padoen_o,

    input  logic       [31:0] gpio_in,
    output logic       [31:0] gpio_out,
    output logic       [31:0] gpio_dir,
    output logic [31:0] [5:0] gpio_padcfg,

    input  logic              core_busy_i,
    output logic [31:0]       irq_o,
    input  logic              fetch_enable_i,
    output logic              fetch_enable_o,
    output logic              clk_gate_core_o,

    output logic              fll1_req_o,
    output logic              fll1_wrn_o,
    output logic [1:0]        fll1_add_o,
    output logic [31:0]       fll1_wdata_o,
    input  logic              fll1_ack_i,
    input  logic [31:0]       fll1_rdata_i,
    input  logic              fll1_lock_i,

    output logic [31:0] [5:0] pad_cfg_o,
    output logic       [31:0] pad_mux_o,
    output logic       [31:0] boot_addr_o,
    
    //USB IO
    AXI_BUS.Slave axi_usb_slave,

    //USB IN
    input wire                SIE_clk,
    input wire                UTMI_clk,
    input                     DP, DM,

    //USB OUT
    output                    TX_DP,
    output                    TX_DM,
    output                    TX_en

);

  localparam APB_ADDR_WIDTH  = 32;
  localparam APB_NUM_SLAVES  = 9;

  APB_BUS s_apb_bus();

  APB_BUS s_uart_bus();
  APB_BUS s_fpu_bus();
  APB_BUS s_gpio_bus();
  APB_BUS s_spi_bus();
  APB_BUS s_timer_bus();
  APB_BUS s_event_unit_bus();
  APB_BUS s_i2c_bus();
  APB_BUS s_fll_bus();
  APB_BUS s_soc_ctrl_bus();
  APB_BUS s_debug_bus();

  logic [1:0]   s_spim_event;
  logic [3:0]   timer_irq;
  logic [31:0]  peripheral_clock_gate_ctrl;
  logic [31:0]  clk_int;
  logic         s_uart_event;
  logic         i2c_event;
  logic         s_gpio_event;

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// Peripheral Clock Gating                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  generate
     genvar i;
       for (i = 0; i < APB_NUM_SLAVES; i = i + 1) begin
        cluster_clock_gating core_clock_gate
        (
          .clk_o     ( clk_int[i]                    ),
          .en_i      ( peripheral_clock_gate_ctrl[i] ),
          .test_en_i ( testmode_i                    ),
          .clk_i     ( clk_i                         )
        );
      end
   endgenerate

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// SPI Slave, AXI Master                                      ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  axi_spi_slave_wrap
  #(
    .AXI_ADDRESS_WIDTH  ( AXI_ADDR_WIDTH       ),
    .AXI_DATA_WIDTH     ( AXI_DATA_WIDTH       ),
    .AXI_USER_WIDTH     ( AXI_USER_WIDTH       ),
    .AXI_ID_WIDTH       ( AXI_MASTER_ID_WIDTH  )
  )
  axi_spi_slave_i
  (
    .clk_i      ( clk_int[0]     ),
    .rst_ni     ( rst_n          ),

    .test_mode  ( testmode_i     ),

    .axi_master ( axi_spi_master ),

    .spi_clk    ( spi_clk_i      ),
    .spi_cs     ( spi_cs_i       ),
    .spi_mode   ( spi_mode_o     ),
    .spi_sdo0   ( spi_sdo0_o     ),
    .spi_sdo1   ( spi_sdo1_o     ),
    .spi_sdo2   ( spi_sdo2_o     ),
    .spi_sdo3   ( spi_sdo3_o     ),
    .spi_sdi0   ( spi_sdi0_i     ),
    .spi_sdi1   ( spi_sdi1_i     ),
    .spi_sdi2   ( spi_sdi2_i     ),
    .spi_sdi3   ( spi_sdi3_i     )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// USB Slave, AXI Master                                      ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

/*  axi_usb axi_usb_slave_i
  (
   .Clk_axi(Clk_axi), 
   .Rst(Rst),
   .R_Valid_Address(axi_usb_slave.ar_valid), 
   .Read_Ready(axi_usb_slave.r_ready),
   .Read_Address_axi(axi_usb_slave.ar_addr),
   .R_Prot(axi_usb_slave.ar_prot),

   .Write_Address_axi(axi_usb_slave.aw_addr),
   .W_Prot(axi_usb_slave.aw_prot),
   .Write_Valid(axi_usb_slave.w_valid),
   .Write_Data_axi(axi_usb_slave.w_data),
   .Write_Strobe(axi_usb_slave.w_strb),
   .SIE_clk(SIE_clk),
   .UTMI_clk(UTMI_clk),
   .DP(DP),
   .DM(DM),
   .TX_DP(TX_DP),
   .TX_DM(TX_DM),
   .TX_en(TX_en),
   .R_Ready_Address(axi_usb_slave.ar_ready), 
   .Valid_Data_R(axi_usb_slave.r_valid),
   .Write_Ready(axi_usb_slave.w_ready), 
   .Read_Data_axi(axi_usb_slave.r_data),
   .b_valid(axi_usb_slave.b_valid),
   .b_ready(axi_usb_slave.b_ready)
  );*/

USB_axicore #(.ADDR_W(32), .Data_W(32), .usb_mem_W(6),.DSIZE(8),.ASIZE(5),.b_a_w(2), .f_n_w(4), 
    .MEM_ADDR_WIDTH(6), .MEM_NUM_COL(4), .MEM_COL_WIDTH(32), .MEM_DATA_WIDTH(128) ) U0_USB_axicore(
.clk(clk_i),
.reset(rst_n),
.ARPROT(axi_usb_slave.ar_prot),
.ARID(axi_usb_slave.ar_id),
.ARADDR(axi_usb_slave.ar_addr),
.ARLEN(axi_usb_slave.ar_len),
.ARSIZE(axi_usb_slave.ar_size),
.ARBURST(axi_usb_slave.ar_burst),
.ARVALID(axi_usb_slave.ar_valid),
.ARREADY(axi_usb_slave.ar_ready),
.RREADY(axi_usb_slave.r_ready),
.RID(axi_usb_slave.r_id),
.RLAST(axi_usb_slave.r_last),
.RDATA(axi_usb_slave.r_data),
.RRESP(axi_usb_slave.r_resp),
.RVALID(axi_usb_slave.r_valid),
.AWID(axi_usb_slave.aw_id),
.AWADDR(axi_usb_slave.aw_addr),
.AWLEN(axi_usb_slave.aw_len),
.AWSIZE(axi_usb_slave.aw_size),
.AWBURST(axi_usb_slave.aw_burst),
.AWVALID(axi_usb_slave.aw_valid),
.AWPROT(axi_usb_slave.aw_prot),
.AWREADY(axi_usb_slave.aw_ready),
.WDATA(axi_usb_slave.w_data),
.WLAST(axi_usb_slave.w_last),
.WSTRB(axi_usb_slave.w_strb),
.WVALID(axi_usb_slave.w_valid),
.WREADY(axi_usb_slave.w_ready),
.BREADY(axi_usb_slave.b_ready),
.BID(axi_usb_slave.b_id),
.BRESP(axi_usb_slave.b_resp),
.BVALID(axi_usb_slave.b_valid),
.SIE_clk(SIE_clk),
.UTMI_clk(UTMI_clk),
.DP(DP), 
.DM(DM),
.TX_DP(TX_DP),
.TX_DM(TX_DM),
.TX_en(TX_en)
);

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// AXI2APB Bridge                                             ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  /* axi2apb_wrap
  #(
      .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH     ),
      .AXI_DATA_WIDTH ( AXI_DATA_WIDTH     ),
      .AXI_USER_WIDTH ( AXI_USER_WIDTH     ),
      .AXI_ID_WIDTH   ( AXI_SLAVE_ID_WIDTH ),
      .APB_ADDR_WIDTH ( APB_ADDR_WIDTH     )
  )
  axi2apb_i
  (
    .clk_i     ( clk_i      ),
    .rst_ni    ( rst_n      ),
    .test_en_i ( testmode_i ),

    .axi_slave ( slave      ),

    .apb_master( s_apb_bus  )
  );*/

axi2apb_wrap
  #(
      .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH     ),
      .AXI_DATA_WIDTH ( AXI_DATA_WIDTH     ),
      .AXI_USER_WIDTH ( AXI_USER_WIDTH     ),
      .AXI_ID_WIDTH   ( AXI_SLAVE_ID_WIDTH ),
      .APB_ADDR_WIDTH ( APB_ADDR_WIDTH     )
  )
  axi2apb_i
  (
    .clk_i     ( clk_i      ),
    .rst_ni    ( rst_n      ),
    .test_en_i ( testmode_i ),

 

    .axi_slave ( slave      ),

 

    .apb_master( s_apb_bus  ),

 

    .pready0(s_uart_bus.pready), 
            .pready1(s_gpio_bus.pready), 
            .pready2(s_spi_bus.pready), 
            .pready3(s_timer_bus.pready), 
            .pready4(s_event_unit_bus.pready), 
            .pready5(s_i2c_bus.pready), 
            .pready6(s_fll_bus.pready), 
            .pready7(s_soc_ctrl_bus.pready), 
            .pready8(s_debug_bus.pready), 
            .pready9(s_fpu_bus.pready      ),

 

            .pslverr0(s_uart_bus.pslverr), 
            .pslverr1(s_gpio_bus.pslverr), 
            .pslverr2(s_spi_bus.pslverr), 
            .pslverr3(s_timer_bus.pslverr), 
            .pslverr4(s_event_unit_bus.pslverr), 
            .pslverr5(s_i2c_bus.pslverr),
            .pslverr6(s_fll_bus.pslverr), 
            .pslverr7(s_soc_ctrl_bus.pslverr),
            .pslverr8(s_debug_bus.pslverr), 
            .pslverr9(s_fpu_bus.pslverr),

 

            .prdata0(s_uart_bus.prdata), 
            .prdata1(s_gpio_bus.prdata), 
            .prdata2(s_spi_bus.prdata), 
            .prdata3(s_timer_bus.prdata), 
            .prdata4(s_event_unit_bus.prdata), 
            .prdata5(s_i2c_bus.prdata), 
            .prdata6(s_fll_bus.prdata), 
            .prdata7(s_soc_ctrl_bus.prdata), 
            .prdata8(s_debug_bus.prdata), 
            .prdata9( s_fpu_bus.prdata),

 

// outputs to APB slave from APB master interface
            .PSEL0(s_uart_bus.psel), 
            .PSEL1(s_gpio_bus.psel), 
            .PSEL2(s_spi_bus.psel), 
            .PSEL3(s_timer_bus.psel), 
            .PSEL4(s_event_unit_bus.psel), 
            .PSEL5(s_i2c_bus.psel), 
            .PSEL6(s_fll_bus.psel), 
            .PSEL7(s_soc_ctrl_bus.psel), 
            .PSEL8(s_debug_bus.psel), 
            .PSEL9(s_fpu_bus.psel)
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Bus                                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

 /* periph_bus_wrap
  #(
     .APB_ADDR_WIDTH( APB_ADDR_WIDTH ),
     .APB_DATA_WIDTH( 32             )
  )
  periph_bus_i
  (
     .clk_i             ( clk_i            ),
     .rst_ni            ( rst_n            ),

     .apb_slave         ( s_apb_bus        ),

     .uart_master       ( s_uart_bus       ),
     .fpu_master	( s_fpu_bus	   ),
     .gpio_master       ( s_gpio_bus       ),
     .spi_master        ( s_spi_bus        ),
     .timer_master      ( s_timer_bus      ),
     .event_unit_master ( s_event_unit_bus ),
     .i2c_master        ( s_i2c_bus        ),
     .fll_master        ( s_fll_bus        ),
     .soc_ctrl_master   ( s_soc_ctrl_bus   ),
     .debug_master      ( s_debug_bus      )
  ); */

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 0: APB UART interface                            ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  `ifndef VERILATOR
 apb_uart apb_uart_i (
    .CLK      ( clk_int[1]   ),
    .RSTN     ( rst_n        ),

 

    .PSEL     ( s_uart_bus.psel    ),
    .PENABLE  ( s_apb_bus.penable    ),
    .PWRITE   ( s_apb_bus.pwrite     ),
    .PADDR    ( s_apb_bus.paddr[4:2] ),
    .PWDATA   ( s_apb_bus.pwdata     ),
    .PRDATA   ( s_uart_bus.prdata  ),
    .PREADY   ( s_uart_bus.pready  ),
    .PSLVERR  ( s_uart_bus.pslverr ),

 

    .INT      ( s_uart_event ),   //Interrupt output

 

    .OUT1N    (),                    //Output 1
    .OUT2N    (),                    //Output 2
    .RTSN     ( uart_rts    ),       //RTS output
    .DTRN     ( uart_dtr    ),       //DTR output
    .CTSN     ( uart_cts    ),       //CTS input
    .DSRN     ( uart_dsr    ),       //DSR input
    .DCDN     ( 1'b1        ),       //DCD input
    .RIN      ( 1'b1        ),       //RI input
    .SIN      ( uart_rx     ),
    .SOUT     ( uart_tx     )
  );
  `else
  apb_uart_sv
    #(
       .APB_ADDR_WIDTH( 3 )
    )
    apb_uart_i
    (
      .CLK      ( clk_int[1]            ),
      .RSTN     ( rst_n                 ),

      .PSEL     ( s_uart_bus.psel       ),
      .PENABLE  ( s_apb_bus.penable    ),
      .PWRITE   ( s_apb_bus.pwrite     ),
      .PADDR    ( s_apb_bus.paddr[4:2] ),
      .PWDATA   ( s_apb_bus.pwdata     ),
      .PRDATA   ( s_uart_bus.prdata     ),
      .PREADY   ( s_uart_bus.pready     ),
      .PSLVERR  ( s_uart_bus.pslverr    ),

      .rx_i     ( uart_rx               ),
      .tx_o     ( uart_tx               ),
      .event_o  ( s_uart_event          )
    );
  `endif


  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 9: APB FPU interface                	         ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////


  FPU_APB
	#(
		.APB_ADDR_WIDTH(32)
	)
   fpu_apb_i
   (
	.CLK		(clk_int[1]	),
	.RSTN		(rst_n		),
	.PADDR		(s_apb_bus.paddr),
	.PWDATA		(s_apb_bus.pwdata),
	.PWRITE		(s_apb_bus.pwrite),
	.PSEL		(s_fpu_bus.psel),
	.PENABLE	(s_apb_bus.penable),
	.PRDATA		(s_fpu_bus.prdata),
	.PSLVERR	(s_fpu_bus.pslverr),
	.PREADY		(s_fpu_bus.pready)

   );


  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 1: APB GPIO interface                            ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_gpio apb_gpio_i
  (
    .HCLK       ( clk_int[2]   ),
    .HRESETn    ( rst_n        ),

    .PADDR      ( s_apb_bus.paddr[11:0]),
    .PWDATA     ( s_apb_bus.pwdata     ),
    .PWRITE     ( s_apb_bus.pwrite     ),
    .PSEL       ( s_gpio_bus.psel       ),
    .PENABLE    ( s_apb_bus.penable    ),
    .PRDATA     ( s_gpio_bus.prdata     ),
    .PREADY     ( s_gpio_bus.pready     ),
    .PSLVERR    ( s_gpio_bus.pslverr    ),

    .gpio_in      ( gpio_in       ),
    .gpio_out     ( gpio_out      ),
    .gpio_dir     ( gpio_dir      ),
    .gpio_padcfg  ( gpio_padcfg   ),
    .interrupt    ( s_gpio_event  )
  );




  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 2: APB SPI Master interface                      ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_spi_master
  #(
      .BUFFER_DEPTH(8)
  )
  apb_spi_master_i
  (
    .HCLK         ( clk_int[3]   ),
    .HRESETn      ( rst_n        ),

    .PADDR        ( s_apb_bus.paddr[11:0]),
    .PWDATA       ( s_apb_bus.pwdata     ),
    .PWRITE       ( s_apb_bus.pwrite     ),
    .PSEL         ( s_spi_bus.psel       ),
    .PENABLE      ( s_apb_bus.penable    ),
    .PRDATA       ( s_spi_bus.prdata     ),
    .PREADY       ( s_spi_bus.pready     ),
    .PSLVERR      ( s_spi_bus.pslverr    ),

    .events_o     ( s_spim_event ),

    .spi_clk      ( spi_master_clk  ),
    .spi_csn0     ( spi_master_csn0 ),
    .spi_csn1     ( spi_master_csn1 ),
    .spi_csn2     ( spi_master_csn2 ),
    .spi_csn3     ( spi_master_csn3 ),
    .spi_mode     ( spi_master_mode ),
    .spi_sdo0     ( spi_master_sdo0 ),
    .spi_sdo1     ( spi_master_sdo1 ),
    .spi_sdo2     ( spi_master_sdo2 ),
    .spi_sdo3     ( spi_master_sdo3 ),
    .spi_sdi0     ( spi_master_sdi0 ),
    .spi_sdi1     ( spi_master_sdi1 ),
    .spi_sdi2     ( spi_master_sdi2 ),
    .spi_sdi3     ( spi_master_sdi3 )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 3: Timer Unit                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_timer
  apb_timer_i
  (
    .HCLK       ( clk_int[4]   ),
    .HRESETn    ( rst_n        ),

    .PADDR      ( s_apb_bus.paddr[11:0]),
    .PWDATA     ( s_apb_bus.pwdata     ),
    .PWRITE     ( s_apb_bus.pwrite     ),
    .PSEL       ( s_timer_bus.psel       ),
    .PENABLE    ( s_apb_bus.penable    ),
    .PRDATA     ( s_timer_bus.prdata     ),
    .PREADY     ( s_timer_bus.pready     ),
    .PSLVERR    ( s_timer_bus.pslverr    ),

    .irq_o      ( timer_irq    )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 4: Event Unit                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_event_unit
  apb_event_unit_i
  (
    .clk_i            ( clk_i        ),
    .HCLK             ( clk_int[5]   ),
    .HRESETn          ( rst_n        ),

    .PADDR            ( s_apb_bus.paddr[11:0]),
    .PWDATA           ( s_apb_bus.pwdata     ),
    .PWRITE           ( s_apb_bus.pwrite     ),
    .PSEL             ( s_event_unit_bus.psel       ),
    .PENABLE          ( s_apb_bus.penable    ),
    .PRDATA           ( s_event_unit_bus.prdata     ),
    .PREADY           ( s_event_unit_bus.pready     ),
    .PSLVERR          ( s_event_unit_bus.pslverr    ),

    .irq_i            ( {timer_irq, s_spim_event, s_gpio_event, s_uart_event, i2c_event, 23'b0} ),
    .event_i          ( {timer_irq, s_spim_event, s_gpio_event, s_uart_event, i2c_event, 23'b0} ),
    .irq_o            ( irq_o              ),

    .fetch_enable_i   ( fetch_enable_i     ),
    .fetch_enable_o   ( fetch_enable_o     ),
    .clk_gate_core_o  ( clk_gate_core_o    ),
    .core_busy_i      ( core_busy_i        )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 5: I2C                                           ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_i2c
  apb_i2c_i
  (
    .HCLK         ( clk_int[6]    ),
    .HRESETn      ( rst_n         ),

    .PADDR        ( s_apb_bus.paddr[11:0] ),
    .PWDATA       ( s_apb_bus.pwdata      ),
    .PWRITE       ( s_apb_bus.pwrite      ),
    .PSEL         ( s_i2c_bus.psel        ),
    .PENABLE      ( s_apb_bus.penable     ),
    .PRDATA       ( s_i2c_bus.prdata      ),
    .PREADY       ( s_i2c_bus.pready      ),
    .PSLVERR      ( s_i2c_bus.pslverr     ),
    .interrupt_o  ( i2c_event     ),
    .scl_pad_i    ( scl_pad_i     ),
    .scl_pad_o    ( scl_pad_o     ),
    .scl_padoen_o ( scl_padoen_o  ),
    .sda_pad_i    ( sda_pad_i     ),
    .sda_pad_o    ( sda_pad_o     ),
    .sda_padoen_o ( sda_padoen_o  )
  );


  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 6: FLL Ctrl                                      ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

    apb_fll_if apb_fll_if_i
    (
      .HCLK        ( clk_int[7]   ),
      .HRESETn     ( rst_n        ),

      .PADDR       ( s_apb_bus.paddr[11:0]),
      .PWDATA      ( s_apb_bus.pwdata     ),
      .PWRITE      ( s_apb_bus.pwrite     ),
      .PSEL        ( s_fll_bus.psel       ),
      .PENABLE     ( s_apb_bus.penable    ),
      .PRDATA      ( s_fll_bus.prdata     ),
      .PREADY      ( s_fll_bus.pready     ),
      .PSLVERR     ( s_fll_bus.pslverr    ),

      .fll1_req    ( fll1_req_o   ),
      .fll1_wrn    ( fll1_wrn_o   ),
      .fll1_add    ( fll1_add_o   ),
      .fll1_data   ( fll1_wdata_o ),
      .fll1_ack    ( fll1_ack_i   ),
      .fll1_r_data ( fll1_rdata_i ),
      .fll1_lock   ( fll1_lock_i  ),

      .fll2_req    (              ),
      .fll2_wrn    (              ),
      .fll2_add    (              ),
      .fll2_data   (              ),
      .fll2_ack    ( 1'b0         ),
      .fll2_r_data ( '0           ),
      .fll2_lock   ( 1'b0         )
      );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 7: PULPino control                               ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

    apb_pulpino
    #(
      .BOOT_ADDR ( 32'h0000 )
    )
    apb_pulpino_i
    (
      .HCLK        ( clk_i        ),
      .HRESETn     ( rst_n        ),

      .PADDR       ( s_apb_bus.paddr[11:0]),
      .PWDATA      ( s_apb_bus.pwdata     ),
      .PWRITE      ( s_apb_bus.pwrite     ),
      .PSEL        ( s_soc_ctrl_bus.psel       ),
      .PENABLE     ( s_apb_bus.penable    ),
      .PRDATA      ( s_soc_ctrl_bus.prdata     ),
      .PREADY      ( s_soc_ctrl_bus.pready     ),
      .PSLVERR     ( s_soc_ctrl_bus.pslverr    ),

      .pad_cfg_o   ( pad_cfg_o                  ),
      .clk_gate_o  ( peripheral_clock_gate_ctrl ),
      .pad_mux_o   ( pad_mux_o                  ),
      .boot_addr_o ( boot_addr_o                )
    );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 8: APB2PER for debug                             ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb2per
  #(
    .PER_ADDR_WIDTH ( 15             ),
    .APB_ADDR_WIDTH ( APB_ADDR_WIDTH )
  )
  apb2per_debug_i
  (
    .clk_i                ( clk_i                   ),
    .rst_ni               ( rst_n                   ),

    .PADDR                ( s_apb_bus.paddr       ),
    .PWDATA               ( s_apb_bus.pwdata      ),
    .PWRITE               ( s_apb_bus.pwrite      ),
    .PSEL                 ( s_debug_bus.psel        ),
    .PENABLE              ( s_apb_bus.penable     ),
    .PRDATA               ( s_debug_bus.prdata      ),
    .PREADY               ( s_debug_bus.pready      ),
    .PSLVERR              ( s_debug_bus.pslverr     ),

    .per_master_req_o     ( debug.req               ),
    .per_master_add_o     ( debug.addr              ),
    .per_master_we_o      ( debug.we                ),
    .per_master_wdata_o   ( debug.wdata             ),
    .per_master_be_o      (                         ),
    .per_master_gnt_i     ( debug.gnt               ),

    .per_master_r_valid_i ( debug.rvalid            ),
    .per_master_r_opc_i   ( '0                      ),
    .per_master_r_rdata_i ( debug.rdata             )
  );
endmodule
