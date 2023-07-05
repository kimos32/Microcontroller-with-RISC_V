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
`include "debug_bus.sv"

`define AXI_ADDR_WIDTH         32
`define AXI_DATA_WIDTH         32
`define AXI_ID_MASTER_WIDTH     2
`define AXI_ID_SLAVE_WIDTH      4
`define AXI_USER_WIDTH          1

module pulpino_top
  #(
    parameter USE_ZERO_RISCY       = 0,
    parameter RISCY_RV32F          = 0,
    parameter ZERO_RV32M           = 1,
    parameter ZERO_RV32E           = 0
  )
  (
    // Clock and Reset
    input logic               clk /*verilator clocker*/,
    input logic               rst_n,

    input  logic              clk_sel_i,
    input  logic              clk_standalone_i,
    input  logic              testmode_i,
    input  logic              fetch_enable_i,
    input  logic              scan_enable_i,

    //SPI Slave
    input  logic              spi_clk_i /*verilator clocker*/,
    input  logic              spi_cs_i /*verilator clocker*/,
    output logic [1:0]        spi_mode_o,
    output logic              spi_sdo0_o,
    output logic              spi_sdo1_o,
    output logic              spi_sdo2_o,
    output logic              spi_sdo3_o,
    input  logic              spi_sdi0_i,
    input  logic              spi_sdi1_i,
    input  logic              spi_sdi2_i,
    input  logic              spi_sdi3_i,

    //SPI Master
    output logic              spi_master_clk_o,
    output logic              spi_master_csn0_o,
    output logic              spi_master_csn1_o,
    output logic              spi_master_csn2_o,
    output logic              spi_master_csn3_o,
    output logic [1:0]        spi_master_mode_o,
    output logic              spi_master_sdo0_o,
    output logic              spi_master_sdo1_o,
    output logic              spi_master_sdo2_o,
    output logic              spi_master_sdo3_o,
    input  logic              spi_master_sdi0_i,
    input  logic              spi_master_sdi1_i,
    input  logic              spi_master_sdi2_i,
    input  logic              spi_master_sdi3_i,

    input  logic              scl_pad_i,
    output logic              scl_pad_o,
    output logic              scl_padoen_o,
    input  logic              sda_pad_i,
    output logic              sda_pad_o,
    output logic              sda_padoen_o,

    output logic              uart_tx,
    input  logic              uart_rx,
    output logic              uart_rts,
    output logic              uart_dtr,
    input  logic              uart_cts,
    input  logic              uart_dsr,

    input  logic       [31:0] gpio_in,
    output logic       [31:0] gpio_out,
    output logic       [31:0] gpio_dir,
    output logic [31:0] [5:0] gpio_padcfg,

    // JTAG signals
    input  logic              tck_i,
    input  logic              trstn_i,
    input  logic              tms_i,
    input  logic              tdi_i,
    output logic              tdo_o,

    // PULPino specific pad config
    output logic [31:0] [5:0] pad_cfg_o,
    output logic       [31:0] pad_mux_o,

    //USB IO
    //Slave IN
    input                     Clk_axi, Rst,

    //USB IN
    input wire                SIE_clk,
    input wire                UTMI_clk,
    input                     DP, DM,

    //USB OUT
    output                    TX_DP,
    output                    TX_DM,
    output                    TX_en
   
  );

  logic        clk_int;

  logic        fetch_enable_int;
  logic        core_busy_int;
  logic        clk_gate_core_int;
  logic [31:0] irq_to_core_int;

  logic        lock_fll_int;
  logic        cfgreq_fll_int;
  logic        cfgack_fll_int;
  logic [1:0]  cfgad_fll_int;
  logic [31:0] cfgd_fll_int;
  logic [31:0] cfgq_fll_int;
  logic        cfgweb_n_fll_int;
  logic        rstn_int;
  logic [31:0] boot_addr_int;
  logic        slave_3_bvalid_reg;


always @(posedge clk_int) slave_3_bvalid_reg <= slaves[3].b_valid;
  AXI_BUS
  #(
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH     ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH     ),
    .AXI_ID_WIDTH   ( `AXI_ID_SLAVE_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH     )
  )
  slaves[3:0]();

  AXI_BUS
  #(
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH      )
  )
  masters[2:0]();

  DEBUG_BUS
  debug();

  //----------------------------------------------------------------------------//
  // Clock and reset generation
  //----------------------------------------------------------------------------//
  clk_rst_gen
  clk_rst_gen_i
  (
      .clk_i            ( clk              ),
      .rstn_i           ( rst_n            ),

      .clk_sel_i        ( clk_sel_i        ),
      .clk_standalone_i ( clk_standalone_i ),
      .testmode_i       ( testmode_i       ),
      .scan_i           ( 1'b0             ),
      .scan_o           (                  ),
      .scan_en_i        ( scan_enable_i    ),

      .fll_req_i        ( cfgreq_fll_int   ),
      .fll_wrn_i        ( cfgweb_n_fll_int ),
      .fll_add_i        ( cfgad_fll_int    ),
      .fll_data_i       ( cfgd_fll_int     ),
      .fll_ack_o        ( cfgack_fll_int   ),
      .fll_r_data_o     ( cfgq_fll_int     ),
      .fll_lock_o       ( lock_fll_int     ),

      .clk_o            ( clk_int          ),
      .rstn_o           ( rstn_int         )

    );

  //----------------------------------------------------------------------------//
  // Core region
  //----------------------------------------------------------------------------//
  core_region
  #(
    .AXI_ADDR_WIDTH       ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH       ( `AXI_DATA_WIDTH      ),
    .AXI_ID_MASTER_WIDTH  ( `AXI_ID_MASTER_WIDTH ),
    .AXI_ID_SLAVE_WIDTH   ( `AXI_ID_SLAVE_WIDTH  ),
    .AXI_USER_WIDTH       ( `AXI_USER_WIDTH      ),
    .USE_ZERO_RISCY       (  USE_ZERO_RISCY      ),
    .RISCY_RV32F          (  RISCY_RV32F         ),
    .ZERO_RV32M           (  ZERO_RV32M          ),
    .ZERO_RV32E           (  ZERO_RV32E          )
  )
  core_region_i
  (
    .clk            ( clk_int           ),
    .rst_n          ( rstn_int          ),

    .testmode_i     ( testmode_i        ),
    .fetch_enable_i ( fetch_enable_int  ),
    .irq_i          ( irq_to_core_int   ),
    .core_busy_o    ( core_busy_int     ),
    .clock_gating_i ( clk_gate_core_int ),
    .boot_addr_i    ( boot_addr_int     ),

    .core_master    ( masters[0]        ),
    .dbg_master     ( masters[1]        ),
    .data_slave     ( slaves[1]         ),
    .instr_slave    ( slaves[0]         ),
    .debug          ( debug             ),

    .tck_i          ( tck_i             ),
    .trstn_i        ( trstn_i           ),
    .tms_i          ( tms_i             ),
    .tdi_i          ( tdi_i             ),
    .tdo_o          ( tdo_o             )
  );

  //----------------------------------------------------------------------------//
  // Peripherals
  //----------------------------------------------------------------------------//
  peripherals
  #(
    .AXI_ADDR_WIDTH      ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH      ( `AXI_DATA_WIDTH      ),
    .AXI_SLAVE_ID_WIDTH  ( `AXI_ID_SLAVE_WIDTH  ),
    .AXI_MASTER_ID_WIDTH ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH      ( `AXI_USER_WIDTH      )
  )
  peripherals_i
  (
    .clk_i           ( clk_int           ),
    .rst_n           ( rstn_int          ),

    .axi_spi_master  ( masters[2]        ),
    .debug           ( debug             ),

    .spi_clk_i       ( spi_clk_i         ),
    .testmode_i      ( testmode_i        ),
    .spi_cs_i        ( spi_cs_i          ),
    .spi_mode_o      ( spi_mode_o        ),
    .spi_sdo0_o      ( spi_sdo0_o        ),
    .spi_sdo1_o      ( spi_sdo1_o        ),
    .spi_sdo2_o      ( spi_sdo2_o        ),
    .spi_sdo3_o      ( spi_sdo3_o        ),
    .spi_sdi0_i      ( spi_sdi0_i        ),
    .spi_sdi1_i      ( spi_sdi1_i        ),
    .spi_sdi2_i      ( spi_sdi2_i        ),
    .spi_sdi3_i      ( spi_sdi3_i        ),

    .slave           ( slaves[2]         ),

    .uart_tx         ( uart_tx           ),
    .uart_rx         ( uart_rx           ),
    .uart_rts        ( uart_rts          ),
    .uart_dtr        ( uart_dtr          ),
    .uart_cts        ( uart_cts          ),
    .uart_dsr        ( uart_dsr          ),

    .spi_master_clk  ( spi_master_clk_o  ),
    .spi_master_csn0 ( spi_master_csn0_o ),
    .spi_master_csn1 ( spi_master_csn1_o ),
    .spi_master_csn2 ( spi_master_csn2_o ),
    .spi_master_csn3 ( spi_master_csn3_o ),
    .spi_master_mode ( spi_master_mode_o ),
    .spi_master_sdo0 ( spi_master_sdo0_o ),
    .spi_master_sdo1 ( spi_master_sdo1_o ),
    .spi_master_sdo2 ( spi_master_sdo2_o ),
    .spi_master_sdo3 ( spi_master_sdo3_o ),
    .spi_master_sdi0 ( spi_master_sdi0_i ),
    .spi_master_sdi1 ( spi_master_sdi1_i ),
    .spi_master_sdi2 ( spi_master_sdi2_i ),
    .spi_master_sdi3 ( spi_master_sdi3_i ),

    .scl_pad_i       ( scl_pad_i         ),
    .scl_pad_o       ( scl_pad_o         ),
    .scl_padoen_o    ( scl_padoen_o      ),
    .sda_pad_i       ( sda_pad_i         ),
    .sda_pad_o       ( sda_pad_o         ),
    .sda_padoen_o    ( sda_padoen_o      ),

    .gpio_in         ( gpio_in           ),
    .gpio_out        ( gpio_out          ),
    .gpio_dir        ( gpio_dir          ),
    .gpio_padcfg     ( gpio_padcfg       ),

    .core_busy_i     ( core_busy_int     ),
    .irq_o           ( irq_to_core_int   ),
    .fetch_enable_i  ( fetch_enable_i    ),
    .fetch_enable_o  ( fetch_enable_int  ),
    .clk_gate_core_o ( clk_gate_core_int ),

    .fll1_req_o      ( cfgreq_fll_int    ),
    .fll1_wrn_o      ( cfgweb_n_fll_int  ),
    .fll1_add_o      ( cfgad_fll_int     ),
    .fll1_wdata_o    ( cfgd_fll_int      ),
    .fll1_ack_i      ( cfgack_fll_int    ),
    .fll1_rdata_i    ( cfgq_fll_int      ),
    .fll1_lock_i     ( lock_fll_int      ),
    .pad_cfg_o       ( pad_cfg_o         ),
    .pad_mux_o       ( pad_mux_o         ),
    .boot_addr_o     ( boot_addr_int     ),

   //USB0
   .axi_usb_slave( slaves[3] ),
   .SIE_clk(SIE_clk),
   .UTMI_clk(UTMI_clk),
   .DP(DP),
   .DM(DM),
   .TX_DP(TX_DP),
   .TX_DM(TX_DM),
   .TX_en(TX_en)
  );


  //----------------------------------------------------------------------------//
  // Axi node
  //----------------------------------------------------------------------------//

 /* axi_node_intf_wrap
  #(
    .NB_MASTER      ( 4                    ),
    .NB_SLAVE       ( 3                    ),
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH      )
  )
  axi_interconnect_i
  (
    .clk       ( clk_int    ),
    .rst_n     ( rstn_int   ),
    .test_en_i ( testmode_i ),

    .master    ( slaves     ),
    .slave     ( masters    ),

    .start_addr_i ( { 32'h1A10_0000, 32'h0010_0000, 32'h0000_0000 } ),
    .end_addr_i   ( { 32'h1A11_FFFF, 32'h001F_FFFF, 32'h000F_FFFF } )
  );
*/

AXI_interconnect #(.ADDR_width(`AXI_ADDR_WIDTH)    , .DATA_width(`AXI_DATA_WIDTH), .sID_width(`AXI_ID_SLAVE_WIDTH), 
                     .mID_width(`AXI_ID_MASTER_WIDTH), .seq_width(2)               , .user_width(`AXI_USER_WIDTH))
       axi_interconnect_i(

 

/////////////////////////////////////////////////////////////////////////////
///////////////////////////////Global Signals///////////////////////////////
///////////////////////////////////////////////////////////////////////////
    .clk(clk_int), 
    .reset_n(rstn_int),

 

////////////////////////////////////////////////////////////////////////
//////////////////////Write Response Channel///////////////////////////
//////////////////////////////////////////////////////////////////////

 

    //Master Signals Definition
    .m_BID(masters[0].b_id)   ,
    .m_BRESP(masters[0].b_resp) ,
    .m_BVALID(masters[0].b_valid),
    .m_BUSER(masters[0].b_user),
    .m_BREADY(masters[0].b_ready),

 

    //Slave0 Signals Definition
    .s0_BID(slaves[0].b_id)  ,
    .s0_BRESP(slaves[0].b_resp) ,
    .s0_BVALID(slaves[0].b_valid),
    .s0_BUSER(slaves[0].b_user) ,
    .s0_BREADY(slaves[0].b_ready),

 

    //Slave1 Signals Definition
    .s1_BID(    )  ,
    .s1_BRESP(     ) ,
    .s1_BVALID(      ),
    .s1_BUSER (     ) ,
    .s1_BREADY (     ),

 

    //Slave2 Signals Definition
    .s2_BID(slaves[1].b_id)   ,
    .s2_BRESP(slaves[1].b_resp) ,
    .s2_BVALID(slaves[1].b_valid),
    .s2_BUSER(slaves[1].b_user) ,
    .s2_BREADY(slaves[1].b_ready),

    //Slave3 Signals Definition
    .s3_BID(slaves[2].b_id)   ,
    .s3_BRESP(slaves[2].b_resp) ,
    .s3_BVALID(slaves[2].b_valid),
    .s3_BUSER(slaves[2].b_user),
    .s3_BREADY(slaves[2].b_ready),

 

    //Slave4 Signals Definition
    .s4_BID (  slaves[3].b_id  )   ,
    .s4_BRESP( slaves[3].b_resp    ) ,
    .s4_BVALID( slave_3_bvalid_reg  )  ,
    .s4_BUSER(  slaves[3].b_user     ),
    .s4_BREADY( slaves[3].b_ready      ),

////////////////////////////////////////////////////////////////////////
////////////////////////////Read Channel///////////////////////////////
//////////////////////////////////////////////////////////////////////

 

    //Master Signals Definition
    .m_RID(masters[0].r_id)   ,
    .m_RDATA(masters[0].r_data) ,
    .m_RRESP(masters[0].r_resp) ,
    .m_RLAST(masters[0].r_last) ,
    .m_RUSER(masters[0].r_user) ,
    .m_RVALID(masters[0].r_valid),
    .m_RREADY(masters[0].r_ready),

    //Slave0 Signals Definition
    .s0_RID(slaves[0].r_id)   ,
    .s0_RDATA(slaves[0].r_data) ,
    .s0_RRESP(slaves[0].r_resp) ,
    .s0_RLAST(slaves[0].r_last) ,
    .s0_RUSER(slaves[0].r_user) ,
    .s0_RVALID(slaves[0].r_valid),
    .s0_RREADY(slaves[0].r_ready),

    //Slave1 Signals Definition
    .s1_RID(         ),
    .s1_RDATA(       ) ,
    .s1_RRESP(        ) ,
    .s1_RLAST(       ) ,
    .s1_RUSER(      ) ,
    .s1_RVALID(        ),
    .s1_RREADY(        ),

 

    //Slave2 Signals Definition
    .s2_RID(slaves[1].r_id)   ,
    .s2_RDATA(slaves[1].r_data) ,
    .s2_RRESP(slaves[1].r_resp) ,
    .s2_RLAST(slaves[1].r_last) ,
    .s2_RUSER(slaves[1].r_user) ,
    .s2_RVALID(slaves[1].r_valid),
    .s2_RREADY(slaves[1].r_ready),

 

    //Slave3 Signals Definition
    .s3_RID(slaves[2].r_id)   ,
    .s3_RDATA(slaves[2].r_data) ,
    .s3_RRESP(slaves[2].r_resp) ,
    .s3_RLAST(slaves[2].r_last) ,
    .s3_RUSER(slaves[2].r_user) ,
    .s3_RVALID(slaves[2].r_valid),
    .s3_RREADY(slaves[2].r_ready),

 

    //Slave4 Signals Definition
    .s4_RID( slaves[3].r_id     )  ,
    .s4_RDATA( slaves[3].r_data      ) ,
    .s4_RRESP(  slaves[3].r_resp       ) ,
    .s4_RLAST(  slaves[3].r_last     ) ,
    .s4_RUSER(  slaves[3].r_user    ) ,
    .s4_RVALID( slaves[3].r_valid       ),
    .s4_RREADY(  slaves[3].r_ready      ),

 

////////////////////////////////////////////////////////////////////////
////////////////////////Read Address Channel///////////////////////////
//////////////////////////////////////////////////////////////////////

    //Master Signals Definition
    .m_ARID(masters[0].ar_id)  ,
    .m_ARADDR(masters[0].ar_addr)  ,
    .m_ARLEN(masters[0].ar_len)   ,
    .m_ARSIZE(masters[0].ar_size)  ,
    .m_ARBURST(masters[0].ar_burst),
    .m_ARCACHE(masters[0].ar_cache) ,
    .m_ARLOCK(masters[0].ar_lock) ,
    .m_ARPROT(masters[0].ar_prot)  ,
    .m_ARQOS(masters[0].ar_qos)   ,
    .m_ARREGION(masters[0].ar_region),
    .m_ARUSER(masters[0].ar_user)  ,
    .m_ARVALID(masters[0].ar_valid) ,
    .m_ARREADY(masters[0].ar_ready) ,

 

    //Salve0 Signals
    .s0_ARID(slaves[0].ar_id)    ,
    .s0_ARADDR(slaves[0].ar_addr)  ,
    .s0_ARLEN(slaves[0].ar_len)   ,
    .s0_ARSIZE(slaves[0].ar_size) ,
    .s0_ARBURST(slaves[0].ar_burst) ,
    .s0_ARCACHE(slaves[0].ar_cache) ,
    .s0_ARLOCK(slaves[0].ar_lock),
    .s0_ARPROT(slaves[0].ar_prot)  ,
    .s0_ARQOS(slaves[0].ar_qos)  ,
    .s0_ARREGION(slaves[0].ar_region),
    .s0_ARUSER(slaves[0].ar_user)  ,
    .s0_ARVALID(slaves[0].ar_valid) ,
    .s0_ARREADY(slaves[0].ar_ready) ,

    //Salve1 Signals                   
    .s1_ARID(             )    ,
    .s1_ARADDR(            )  ,
    .s1_ARLEN(          )   ,
    .s1_ARSIZE(      ) ,
    .s1_ARBURST(      ) ,
    .s1_ARCACHE(     ) ,
    .s1_ARLOCK(    ),
    .s1_ARPROT(    )  ,
    .s1_ARQOS(     )  ,
    .s1_ARREGION(     ),
    .s1_ARUSER(    )  ,
    .s1_ARVALID(   ) ,
    .s1_ARREADY(  ) ,

 

    //Salve2 Signals
    .s2_ARID(slaves[1].ar_id)    ,
    .s2_ARADDR(slaves[1].ar_addr)  ,
    .s2_ARLEN(slaves[1].ar_len)   ,
    .s2_ARSIZE(slaves[1].ar_size) ,
    .s2_ARBURST(slaves[1].ar_burst) ,
    .s2_ARCACHE(slaves[1].ar_cache) ,
    .s2_ARLOCK(slaves[1].ar_lock),
    .s2_ARPROT(slaves[1].ar_prot)  ,
    .s2_ARQOS(slaves[1].ar_qos)  ,
    .s2_ARREGION(slaves[1].ar_region),
    .s2_ARUSER(slaves[1].ar_user)  ,
    .s2_ARVALID(slaves[1].ar_valid) ,
    .s2_ARREADY(slaves[1].ar_ready) ,

 

    //Salve3 Signals
    .s3_ARID(slaves[2].ar_id)    ,
    .s3_ARADDR(slaves[2].ar_addr)  ,
    .s3_ARLEN(slaves[2].ar_len)   ,
    .s3_ARSIZE(slaves[2].ar_size) ,
    .s3_ARBURST(slaves[2].ar_burst) ,
    .s3_ARCACHE(slaves[2].ar_cache) ,
    .s3_ARLOCK(slaves[2].ar_lock),
    .s3_ARPROT(slaves[2].ar_prot)  ,
    .s3_ARQOS(slaves[2].ar_qos)  ,
    .s3_ARREGION(slaves[2].ar_region),
    .s3_ARUSER(slaves[2].ar_user)  ,
    .s3_ARVALID(slaves[2].ar_valid) ,
    .s3_ARREADY(slaves[2].ar_ready) ,

 

    //Salve4 Signlas
    .s4_ARID(   slaves[3].ar_id          )    ,
    .s4_ARADDR( slaves[3].ar_addr     )  ,
    .s4_ARLEN(   slaves[3].ar_len       )   ,
    .s4_ARSIZE(  slaves[3].ar_size    ) ,
    .s4_ARBURST( slaves[3].ar_burst     ) ,
    .s4_ARCACHE( slaves[3].ar_cache    ) ,
    .s4_ARLOCK( slaves[3].ar_lock   ),
    .s4_ARPROT(  slaves[3].ar_prot  )  ,
    .s4_ARQOS(  slaves[3].ar_qos   )  ,
    .s4_ARREGION( slaves[3].ar_region    ),
    .s4_ARUSER( slaves[3].ar_user   )  ,
    .s4_ARVALID( slaves[3].ar_valid  ) ,
    .s4_ARREADY( slaves[3].ar_ready  ) ,

 

    //Salve5 Signals -Default slave to generate decode error
    .s5_ARID(             )    ,
    .s5_ARADDR(            )  ,
    .s5_ARLEN(          )   ,
    .s5_ARSIZE(      ) ,
    .s5_ARBURST(      ) ,
    .s5_ARCACHE(     ) ,
    .s5_ARLOCK(    ),
    .s5_ARPROT(    )  ,
    .s5_ARQOS(     )  ,
    .s5_ARREGION(     ),
    .s5_ARUSER(    )  ,
    .s5_ARVALID(   ) ,
    .s5_ARREADY(1'b0  ) ,
////////////////////////////////////////////////////////////////////////
////////////////////////Write Address Channel//////////////////////////
//////////////////////////////////////////////////////////////////////

 

    //Master Signals
    .m_AWREADY(masters[0].aw_ready) ,
    .m_AWVALID(masters[0].aw_valid) ,
    .m_AWID(masters[0].aw_id)    ,
    .m_AWADDR(masters[0].aw_addr)  ,
    .m_AWLEN(masters[0].aw_len)   ,
    .m_AWSIZE(masters[0].aw_size)  ,
    .m_AWBURST(masters[0].aw_burst) ,
    .m_AWCACHE(masters[0].aw_cache) ,
    .m_AWLOCK(masters[0].aw_lock)  ,
    .m_AWPROT(masters[0].aw_prot)  ,
    .m_AWQOS(masters[0].aw_qos)   ,
    .m_AWREGION(masters[0].aw_region),
    .m_AWUSER(masters[0].aw_user),

 

    //Salve0 Signals
    .s0_AWREADY(slaves[0].aw_ready),
    .s0_AWVALID(slaves[0].aw_valid),
    .s0_AWID(slaves[0].aw_id),
    .s0_AWADDR(slaves[0].aw_addr),
    .s0_AWLEN(slaves[0].aw_len),
    .s0_AWSIZE(slaves[0].aw_size),
    .s0_AWBURST(slaves[0].aw_burst),
    .s0_AWCACHE(slaves[0].aw_cache),
    .s0_AWLOCK(slaves[0].aw_lock),
    .s0_AWPROT(slaves[0].aw_prot),
    .s0_AWQOS(slaves[0].aw_qos),
    .s0_AWREGION(slaves[0].aw_region),
    .s0_AWUSER(slaves[0].aw_user),

    //Salve1 Signals
    .s1_AWREADY(       ),
    .s1_AWVALID(      ),
    .s1_AWID(      ),
    .s1_AWADDR(     ),
    .s1_AWLEN(       ),
    .s1_AWSIZE(       ),
    .s1_AWBURST(      ),
    .s1_AWCACHE(       ),
    .s1_AWLOCK(     ),
    .s1_AWPROT(         ),
    .s1_AWQOS(       ),
    .s1_AWREGION(      ),
    .s1_AWUSER(   ),

 

    //Salve2 Signals
    .s2_AWREADY(slaves[1].aw_ready),
    .s2_AWVALID(slaves[1].aw_valid),
    .s2_AWID(slaves[1].aw_id),
    .s2_AWADDR(slaves[1].aw_addr),
    .s2_AWLEN(slaves[1].aw_len),
    .s2_AWSIZE(slaves[1].aw_size),
    .s2_AWBURST(slaves[1].aw_burst),
    .s2_AWCACHE(slaves[1].aw_cache),
    .s2_AWLOCK(slaves[1].aw_lock),
    .s2_AWPROT(slaves[1].aw_prot),
    .s2_AWQOS(slaves[1].aw_qos),
    .s2_AWREGION(slaves[1].aw_region),
    .s2_AWUSER(slaves[1].aw_user),

    //Slave3 Signals
    .s3_AWREADY(slaves[2].aw_ready),
    .s3_AWVALID(slaves[2].aw_valid),
    .s3_AWID(slaves[2].aw_id),
    .s3_AWADDR(slaves[2].aw_addr),
    .s3_AWLEN(slaves[2].aw_len),
    .s3_AWSIZE(slaves[2].aw_size),
    .s3_AWBURST(slaves[2].aw_burst),
    .s3_AWCACHE(slaves[2].aw_cache),
    .s3_AWLOCK(slaves[2].aw_lock),
    .s3_AWPROT(slaves[2].aw_prot),
    .s3_AWQOS(slaves[2].aw_qos),
    .s3_AWREGION(slaves[2].aw_region),
    .s3_AWUSER(slaves[2].aw_user),

    //Slave4 Signals
    .s4_AWREADY( slaves[3].aw_ready      ),
    .s4_AWVALID( slaves[3].aw_valid      ),
    .s4_AWID(  slaves[3].aw_id    ),
    .s4_AWADDR( slaves[3].aw_addr   ),
    .s4_AWLEN(  slaves[3].aw_len     ),
    .s4_AWSIZE(  slaves[3].aw_size     ),
    .s4_AWBURST( slaves[3].aw_burst     ),
    .s4_AWCACHE(  slaves[3].aw_cache     ),
    .s4_AWLOCK(  slaves[3].aw_lock   ),
    .s4_AWPROT( slaves[3].aw_prot        ),
    .s4_AWQOS(  slaves[3].aw_qos     ),
    .s4_AWREGION( slaves[3].aw_region     ),
    .s4_AWUSER( slaves[3].aw_user  ),

    //Slave5 Signals -Default slave to generate decode error
    .s5_AWREADY(1'b0       ),
    .s5_AWVALID(      ),
    .s5_AWID(      ),
    .s5_AWADDR(     ),
    .s5_AWLEN(       ),
    .s5_AWSIZE(       ),
    .s5_AWBURST(      ),
    .s5_AWCACHE(       ),
    .s5_AWLOCK(     ),
    .s5_AWPROT(         ),
    .s5_AWQOS(       ),
    .s5_AWREGION(      ),
    .s5_AWUSER(   ),

////////////////////////////////////////////////////////////////////////
//////////////////////////Write Data Channel///////////////////////////
//////////////////////////////////////////////////////////////////////

    //Master Signals
    .m_WDATA(masters[0].w_data) ,
    .m_WSTRB(masters[0].w_strb) ,
    .m_WLAST(masters[0].w_last) ,
    .m_WUSER(masters[0].w_user) ,
    .m_WVALID(masters[0].w_valid),
    .m_WREADY(masters[0].w_ready),

    //Slave0 Signals
    .s0_WDATA(slaves[0].w_data) ,
    .s0_WSTRB(slaves[0].w_strb) ,
    .s0_WLAST(slaves[0].w_last) ,
    .s0_WUSER(slaves[0].w_user),
    .s0_WVALID(slaves[0].w_valid),
    .s0_WREADY(slaves[0].w_ready),

 

    //Slave1 Signals
    .s1_WDATA(      ) ,
    .s1_WSTRB(       ) ,
    .s1_WLAST(        ) ,
    .s1_WUSER(       ),
    .s1_WVALID(       ),
    .s1_WREADY(     ),

 

    //Slave2 Signals
    .s2_WDATA(slaves[1].w_data) ,
    .s2_WSTRB(slaves[1].w_strb) ,
    .s2_WLAST(slaves[1].w_last) ,
    .s2_WUSER(slaves[1].w_user),
    .s2_WVALID(slaves[1].w_valid),
    .s2_WREADY(slaves[1].w_ready),

    //Slave3 Signals
    .s3_WDATA(slaves[2].w_data) ,
    .s3_WSTRB(slaves[2].w_strb) ,
    .s3_WLAST(slaves[2].w_last) ,
    .s3_WUSER(slaves[2].w_user),
    .s3_WVALID(slaves[2].w_valid),
    .s3_WREADY(slaves[2].w_ready),

    //Slave4 Signals
    .s4_WDATA(  slaves[3].w_data    ) ,
    .s4_WSTRB(  slaves[3].w_strb     ) ,
    .s4_WLAST(  slaves[3].w_last      ) ,
    .s4_WUSER(  slaves[3].w_user     ),
    .s4_WVALID( slaves[3].w_valid      ),
    .s4_WREADY( slaves[3].w_ready    ),

    //Slave5 Signals
    .s5_WDATA(      ) ,
    .s5_WSTRB(       ) ,
    .s5_WLAST(        ) ,
    .s5_WUSER(       ),
    .s5_WVALID(       ),
    .s5_WREADY( 1'b0  )
    );



endmodule

