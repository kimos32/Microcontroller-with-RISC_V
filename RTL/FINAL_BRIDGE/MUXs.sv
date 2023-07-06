module MUXs #(parameter DATASIZE = 32, // Memory data word width   
              parameter ADDRSIZE = 32)        
 (output reg [DATASIZE-1:0]   PRDATA,
  output reg                  PREADY,
  output reg                  PSLVERR,
  input  [ADDRSIZE-1:0]       PADDR,
  input  [DATASIZE-1:0]       PRDATA_0, PRDATA_1, PRDATA_2, PRDATA_3, PRDATA_4, PRDATA_5, PRDATA_6, PRDATA_7, PRDATA_8, PRDATA_9,
  input                       PREADY_0, PREADY_1, PREADY_2, PREADY_3, PREADY_4, PREADY_5, PREADY_6, PREADY_7, PREADY_8, PREADY_9,
  input                       PSLVERR_0, PSLVERR_1, PSLVERR_2, PSLVERR_3, PSLVERR_4, PSLVERR_5, PSLVERR_6, PSLVERR_7, PSLVERR_8, PSLVERR_9
);

  
    always @ (*)
  begin
  case (PADDR[19:12])
			8'h00:	begin                   // UART
	         PRDATA  = PRDATA_0;    
	         PREADY  = PREADY_0;
	         PSLVERR = PSLVERR_0;
					end
			8'h01:	begin                   // GPIO
	         PRDATA  = PRDATA_1;    
	         PREADY  = PREADY_1;
	         PSLVERR = PSLVERR_1;
					end
			8'h02:	begin                   // SPI Master
	         PRDATA  = PRDATA_2;    
	         PREADY  = PREADY_2;
	         PSLVERR = PSLVERR_2;
					end
			8'h03:	begin                   // Timer
	         PRDATA  = PRDATA_3;    
	         PREADY  = PREADY_3;
	         PSLVERR = PSLVERR_3;
					end
			8'h04:	begin                   // Event/Interrupt Unit
	         PRDATA  = PRDATA_4;    
	         PREADY  = PREADY_4;
	         PSLVERR = PSLVERR_4;
					end
			8'h05:	begin                   // I2C
	         PRDATA  = PRDATA_5;    
	         PREADY  = PREADY_5;
	         PSLVERR = PSLVERR_5;
					end
			8'h06:	begin                   // FLL
	         PRDATA  = PRDATA_6;    
	         PREADY  = PREADY_6;
	         PSLVERR = PSLVERR_6;
					end
      8'h07:	begin                   // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
			8'h08:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
			8'h09:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
			8'h0A:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
      8'h0B:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
      8'h0C:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
      8'h0D:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
      8'h0E:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
      8'h0F:	begin    // SoC Control
	         PRDATA  = PRDATA_7;    
	         PREADY  = PREADY_7;
	         PSLVERR = PSLVERR_7;
					end
			8'h10:	begin                   // Debug Port
	         PRDATA  = PRDATA_8;    
	         PREADY  = PREADY_8;
	         PSLVERR = PSLVERR_8;
					end
		  8'h11:	begin                   // FPU
	         PRDATA  = PRDATA_9;    
	         PREADY  = PREADY_9;
	         PSLVERR = PSLVERR_9;
					end
			 8'h12:	begin                   // FPU
	         PRDATA  = PRDATA_9;    
	         PREADY  = PREADY_9;
	         PSLVERR = PSLVERR_9;
					end
   	default:	begin
	         PRDATA  = 0;    
	         PREADY  = 0;
	         PSLVERR = 0;
					end
			endcase
  

  end
  
endmodule 