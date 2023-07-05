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

module axi2apb_wrap
#(
    parameter AXI_ADDR_WIDTH   = 32,
    parameter AXI_DATA_WIDTH   = 32,
    parameter AXI_USER_WIDTH   = 6,
    parameter AXI_ID_WIDTH     = 6,
    parameter APB_ADDR_WIDTH   = 32
)
(
    input logic                                 clk_i,
    input logic                                 rst_ni,
    input logic                                 test_en_i,

    AXI_BUS.Slave                               axi_slave,

    APB_BUS.Master                              apb_master,
    
   input logic                                  pready0,
   input logic                                  pready1, 
   input logic                                  pready2, 
   input logic                                  pready3, 
   input logic                                  pready4, 
   input logic                                  pready5, 
   input logic                                  pready6, 
   input logic                                  pready7, 
   input logic                                  pready8, 
   input logic                                  pready9,
   input logic pslverr0, 
   input logic pslverr1, 
   input logic pslverr2, 
   input logic pslverr3, 
   input logic pslverr4, 
   input logic pslverr5, 
   input logic pslverr6, 
   input logic pslverr7, 
   input logic pslverr8, 
   input logic pslverr9,
   input logic  [AXI_DATA_WIDTH-1:0] prdata0, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata1, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata2, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata3, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata4, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata5, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata6, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata7, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata8, 
   input logic  [AXI_DATA_WIDTH-1:0] prdata9,

// outputs to APB slave from APB master interface
   output logic PSEL0, 
   output logic PSEL1, 
   output logic PSEL2, 
   output logic PSEL3, 
   output logic PSEL4, 
   output logic PSEL5, 
   output logic PSEL6, 
   output logic PSEL7, 
   output logic PSEL8, 
   output logic PSEL9

);


  //********************************************************
  //************** AXI2APB WRAPER **************************
  //********************************************************

  generate if (AXI_DATA_WIDTH == 32)
    begin
      bridge #(.DATASIZE(AXI_DATA_WIDTH),   
               .ADDRSIZE(AXI_ADDR_WIDTH),
	       .TOP_FIFO_DATA_SIZE (72),
	       .TOP_FIFO_ADDR_SIZE (4),
	       .BOTTOM_FIFO_DATA_SIZE(AXI_DATA_WIDTH),
		.BOTTOM_FIFO_ADDR_SIZE (4)
	        )
      bridge_i
          ( // system inputs
            .APB_clk(clk_i), 
            .APB_rst_n(rst_ni),
            .AXI_clk(clk_i), 
            .AXI_rst_n(rst_ni),

//*****************inputs & outputs from AXI slave interface
//_____________________________Read Address_____________________________//
            .ARPROT(axi_slave.ar_prot),
            .ARID(axi_slave.ar_id),
            .ARADDR(axi_slave.ar_addr),
            .ARLEN(axi_slave.ar_len),
            .ARSIZE(axi_slave.ar_size),
            .ARBURST(axi_slave.ar_burst),
            .ARVALID(axi_slave.ar_valid),
            .ARREADY(axi_slave.ar_ready),  
//_____________________________Read Data_____________________________//
            .RREADY(axi_slave.r_ready),
            .RID(axi_slave.r_id),
            .RLAST(axi_slave.r_last),
            .RDATA(axi_slave.r_data),
            .RRESP(axi_slave.r_resp),
            .RVALID(axi_slave.r_valid),
//_____________________________Write Address_____________________________//
            .AWID(axi_slave.aw_id),
            .AWADDR(axi_slave.aw_addr),
            .AWLEN(axi_slave.aw_len),
            .AWSIZE(axi_slave.aw_size),
            .AWBURST(axi_slave.aw_burst),
            .AWVALID(axi_slave.aw_valid),
            .AWPROT(axi_slave.aw_prot),
            .AWREADY(axi_slave.aw_ready),

//_____________________________Write Data_____________________________//
            .WDATA(axi_slave.w_data),
            .WLAST(axi_slave.w_last),
            .WSTRB(axi_slave.w_strb),
            .WVALID(axi_slave.w_valid),
            .WREADY(axi_slave.w_ready),
//_____________________________Write Response_____________________________//
            .BREADY(axi_slave.b_ready),
            .BID(axi_slave.b_id),
            .BRESP(axi_slave.b_resp),
            .BVALID(axi_slave.b_valid),

//********* outputs & inputs from APB master interface
// inputs to APB master interface from APB slave
            .pready0(pready0), 
            .pready1(pready1), 
            .pready2(pready2), 
            .pready3(pready3), 
            .pready4(pready4), 
            .pready5(pready5), 
            .pready6(pready6), 
            .pready7(pready7), 
            .pready8(pready8), 
            .pready9(pready9),

            .pslverr0(pslverr0), 
            .pslverr1(pslverr1), 
            .pslverr2(pslverr2), 
            .pslverr3(pslverr3), 
            .pslverr4(pslverr4), 
            .pslverr5(pslverr5),
            .pslverr6(pslverr6), 
            .pslverr7(pslverr7),
            .pslverr8(pslverr8), 
            .pslverr9(pslverr9),

            .prdata0(prdata0), 
            .prdata1(prdata1), 
            .prdata2(prdata2), 
            .prdata3(prdata3), 
            .prdata4(prdata4), 
            .prdata5(prdata5), 
            .prdata6(prdata6), 
            .prdata7(prdata7), 
            .prdata8(prdata8), 
            .prdata9(prdata9),

// outputs to APB slave from APB master interface
            .PSEL0(PSEL0), 
            .PSEL1(PSEL1), 
            .PSEL2(PSEL2), 
            .PSEL3(PSEL3), 
            .PSEL4(PSEL4), 
            .PSEL5(PSEL5), 
            .PSEL6(PSEL6), 
            .PSEL7(PSEL7), 
            .PSEL8(PSEL8), 
            .PSEL9(PSEL9),

            .PENABLE(apb_master.penable),
            .PADDR(apb_master.paddr),
            .PWDATA(apb_master.pwdata),
            .PWRITE(apb_master.pwrite),
            .PPROT(       ),
            .PSTRB(        )
           );

      /*axi2apb32
      #(
        .AXI4_ADDRESS_WIDTH ( AXI_ADDR_WIDTH ),
        .AXI4_RDATA_WIDTH   ( AXI_DATA_WIDTH ),
        .AXI4_WDATA_WIDTH   ( AXI_DATA_WIDTH ),
        .AXI4_ID_WIDTH      ( AXI_ID_WIDTH   ),
        .AXI4_USER_WIDTH    ( 1              ),

        .BUFF_DEPTH_SLAVE   ( 2              ),
        .APB_ADDR_WIDTH     ( APB_ADDR_WIDTH )
      )
      axi2apb_i
      (
        .ACLK       ( clk_i               ),
        .ARESETn    ( rst_ni              ),
        .test_en_i  ( test_en_i           ),

        .AWID_i     ( axi_slave.aw_id     ),
        .AWADDR_i   ( axi_slave.aw_addr   ),
        .AWLEN_i    ( axi_slave.aw_len    ),
        .AWSIZE_i   ( axi_slave.aw_size   ),
        .AWBURST_i  ( axi_slave.aw_burst  ),
        .AWLOCK_i   ( axi_slave.aw_lock   ),
        .AWCACHE_i  ( axi_slave.aw_cache  ),
        .AWPROT_i   ( axi_slave.aw_prot   ),
        .AWREGION_i ( axi_slave.aw_region ),
        .AWUSER_i   ( axi_slave.aw_user   ),
        .AWQOS_i    ( axi_slave.aw_qos    ),
        .AWVALID_i  ( axi_slave.aw_valid  ),
        .AWREADY_o  ( axi_slave.aw_ready  ),

        .WDATA_i    ( axi_slave.w_data    ),
        .WSTRB_i    ( axi_slave.w_strb    ),
        .WLAST_i    ( axi_slave.w_last    ),
        .WUSER_i    ( axi_slave.w_user    ),
        .WVALID_i   ( axi_slave.w_valid   ),
        .WREADY_o   ( axi_slave.w_ready   ),

        .BID_o      ( axi_slave.b_id      ),
        .BRESP_o    ( axi_slave.b_resp    ),
        .BVALID_o   ( axi_slave.b_valid   ),
        .BUSER_o    ( axi_slave.b_user    ),
        .BREADY_i   ( axi_slave.b_ready   ),

        .ARID_i     ( axi_slave.ar_id     ),
        .ARADDR_i   ( axi_slave.ar_addr   ),
        .ARLEN_i    ( axi_slave.ar_len    ),
        .ARSIZE_i   ( axi_slave.ar_size   ),
        .ARBURST_i  ( axi_slave.ar_burst  ),
        .ARLOCK_i   ( axi_slave.ar_lock   ),
        .ARCACHE_i  ( axi_slave.ar_cache  ),
        .ARPROT_i   ( axi_slave.ar_prot   ),
        .ARREGION_i ( axi_slave.ar_region ),
        .ARUSER_i   ( axi_slave.ar_user   ),
        .ARQOS_i    ( axi_slave.ar_qos    ),
        .ARVALID_i  ( axi_slave.ar_valid  ),
        .ARREADY_o  ( axi_slave.ar_ready  ),

        .RID_o      ( axi_slave.r_id      ),
        .RDATA_o    ( axi_slave.r_data    ),
        .RRESP_o    ( axi_slave.r_resp    ),
        .RLAST_o    ( axi_slave.r_last    ),
        .RUSER_o    ( axi_slave.r_user    ),
        .RVALID_o   ( axi_slave.r_valid   ),
        .RREADY_i   ( axi_slave.r_ready   ),

        .PENABLE    ( apb_master.penable  ),
        .PWRITE     ( apb_master.pwrite   ),
        .PADDR      ( apb_master.paddr    ),
        .PSEL       ( apb_master.psel     ),
        .PWDATA     ( apb_master.pwdata   ),
        .PRDATA     ( apb_master.prdata   ),
        .PREADY     ( apb_master.pready   ),
        .PSLVERR    ( apb_master.pslverr  )
      );*/
    
    end
    else if (AXI_DATA_WIDTH == 64)
    begin
      axi2apb
      #(
        .AXI4_ADDRESS_WIDTH ( AXI_ADDR_WIDTH ),
        .AXI4_RDATA_WIDTH   ( AXI_DATA_WIDTH ),
        .AXI4_WDATA_WIDTH   ( AXI_DATA_WIDTH ),
        .AXI4_ID_WIDTH      ( AXI_ID_WIDTH   ),
        .AXI4_USER_WIDTH    ( 1              ),

        .BUFF_DEPTH_SLAVE   ( 2              ),
        .APB_ADDR_WIDTH     ( APB_ADDR_WIDTH )
      )
      axi2apb_i
      (
        .ACLK       ( clk_i               ),
        .ARESETn    ( rst_ni              ),
        .test_en_i  ( test_en_i           ),

        .AWID_i     ( axi_slave.aw_id     ),
        .AWADDR_i   ( axi_slave.aw_addr   ),
        .AWLEN_i    ( axi_slave.aw_len    ),
        .AWSIZE_i   ( axi_slave.aw_size   ),
        .AWBURST_i  ( axi_slave.aw_burst  ),
        .AWLOCK_i   ( axi_slave.aw_lock   ),
        .AWCACHE_i  ( axi_slave.aw_cache  ),
        .AWPROT_i   ( axi_slave.aw_prot   ),
        .AWREGION_i ( axi_slave.aw_region ),
        .AWUSER_i   ( axi_slave.aw_user   ),
        .AWQOS_i    ( axi_slave.aw_qos    ),
        .AWVALID_i  ( axi_slave.aw_valid  ),
        .AWREADY_o  ( axi_slave.aw_ready  ),

        .WDATA_i    ( axi_slave.w_data    ),
        .WSTRB_i    ( axi_slave.w_strb    ),
        .WLAST_i    ( axi_slave.w_last    ),
        .WUSER_i    ( axi_slave.w_user    ),
        .WVALID_i   ( axi_slave.w_valid   ),
        .WREADY_o   ( axi_slave.w_ready   ),

        .BID_o      ( axi_slave.b_id      ),
        .BRESP_o    ( axi_slave.b_resp    ),
        .BVALID_o   ( axi_slave.b_valid   ),
        .BUSER_o    ( axi_slave.b_user    ),
        .BREADY_i   ( axi_slave.b_ready   ),

        .ARID_i     ( axi_slave.ar_id     ),
        .ARADDR_i   ( axi_slave.ar_addr   ),
        .ARLEN_i    ( axi_slave.ar_len    ),
        .ARSIZE_i   ( axi_slave.ar_size   ),
        .ARBURST_i  ( axi_slave.ar_burst  ),
        .ARLOCK_i   ( axi_slave.ar_lock   ),
        .ARCACHE_i  ( axi_slave.ar_cache  ),
        .ARPROT_i   ( axi_slave.ar_prot   ),
        .ARREGION_i ( axi_slave.ar_region ),
        .ARUSER_i   ( axi_slave.ar_user   ),
        .ARQOS_i    ( axi_slave.ar_qos    ),
        .ARVALID_i  ( axi_slave.ar_valid  ),
        .ARREADY_o  ( axi_slave.ar_ready  ),

        .RID_o      ( axi_slave.r_id      ),
        .RDATA_o    ( axi_slave.r_data    ),
        .RRESP_o    ( axi_slave.r_resp    ),
        .RLAST_o    ( axi_slave.r_last    ),
        .RUSER_o    ( axi_slave.r_user    ),
        .RVALID_o   ( axi_slave.r_valid   ),
        .RREADY_i   ( axi_slave.r_ready   ),

        .PENABLE    ( apb_master.penable  ),
        .PWRITE     ( apb_master.pwrite   ),
        .PADDR      ( apb_master.paddr    ),
        .PSEL       ( apb_master.psel     ),
        .PWDATA     ( apb_master.pwdata   ),
        .PRDATA     ( apb_master.prdata   ),
        .PREADY     ( apb_master.pready   ),
        .PSLVERR    ( apb_master.pslverr  )
      );
    end
  endgenerate

endmodule
