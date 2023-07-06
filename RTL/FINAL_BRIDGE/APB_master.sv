module APB_master #( parameter ADDRSIZE = 32,
					parameter DATASIZE = 32)

 
(//system input 
input PCLK , PRESETn ,
// inputs to APB master 
input [ADDRSIZE-1:0] addr , // addr from AXI slave interface 
input [DATASIZE-1:0] wdata ,  // data from AXI slave interface to be written 
input write_read , // input from AXI slave interface indicate write or read operation 
input [(DATASIZE/8)-1:0] strb_input , // input from AXI slave interface indicate strb 
input [2:0] PPROT_input, 		
input transfer,

//output from slave and input to apb master 
input PREADY ,  
input [DATASIZE-1:0] PRDATA , 
input PSLVERR ,

// apb master output
output reg PENABLE,
output reg PWRITE,
output reg [DATASIZE-1:0] PWDATA, 
output reg PSEL0, PSEL1, PSEL2, PSEL3, PSEL4, PSEL5, PSEL6, PSEL7, PSEL8, PSEL9,
output reg [ADDRSIZE-1:0] PADDR,
output reg [(DATASIZE/8)-1:0] PSTRB,  
output reg [2:0] PPROT, 


//output from apb master to axi slave interface 

// output reg pslverr_out , // indicate error to axi slave interface
output reg [DATASIZE-1:0] prdata_out,   // out data from slave to axi slave interface  
output reg PREADY_to_AXI_read,
output reg APB_setup_flag 
) ;



reg [1:0] current_state , next_state ;

//define states 
localparam idle = 2'b00 ;
localparam setup = 2'b01 ;
localparam access = 2'b10 ;


//current state generation for the finite state machine 
always @ ( posedge PCLK or negedge PRESETn  )
begin 
if (!PRESETn)  
  current_state <= idle ;
else 
  current_state <= next_state ;
end


always @ (*)
begin  
  case (current_state)
    idle : begin
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
            PENABLE = 0 ;
            PWRITE = 0;         // at idle state no selected slave and all output values are zero 
            prdata_out = 0 ; 
            PADDR = 0 ;
            PWDATA = 0;
            PSTRB = 0;
			PREADY_to_AXI_read = 0;
			PPROT = 0;
            if (transfer)
              begin
              next_state = setup ;
               APB_setup_flag = 0;
              end
           else
             begin
              next_state = idle ;
               APB_setup_flag = 0;
              end
          end     
   
   setup : begin
          
			     next_state = access ;
                APB_setup_flag = 0;

            PENABLE = 0 ;
            PWRITE = write_read;
            PADDR  = addr ;   
            prdata_out = 0 ;
			PPROT = PPROT_input;
			PREADY_to_AXI_read = 0;

			if (write_read) //write transaction
				begin
				PWDATA = wdata ;
				PSTRB = strb_input ;
			  end 
			else
			  begin
				PWDATA = 0;
        PSTRB = 0;
        end
        
			// address decoder to assert PSELx for the intended slave
			  case (PADDR[23:12])
			12'h100:	begin                   // UART
					PSEL0 = 1;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h101:	begin                   // GPIO
					PSEL0 = 0;					PSEL1 = 1;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;					
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h102:	begin                   // SPI Master
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 1;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h103:	begin                   // Timer
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 1;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h104:	begin                   // Event/Interrupt Unit
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 1;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h105:	begin                   // I2C
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 1;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h106:	begin                   // FLL
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 1;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
     12'h107:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	   12'h108:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h109:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10A:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10B:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10C:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10D:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10E:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10F:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h110:	begin                   // Debug Port
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 1;					PSEL9 = 0;
					end
		  12'h111:	begin                   // FPU
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 1;
					end
		  12'h112:	begin                   // FPU
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 1;
					end
   	default:	begin
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			endcase
  
			
   end
 
   access : begin
              PENABLE = 1 ;
              PWRITE = write_read ;
              PADDR  = addr ;     //access state
              PPROT = PPROT_input;
			        
			// address decoder to assert PSELx for the intended slave
			  case (PADDR[23:12])
			12'h100:	begin                   // UART
					PSEL0 = 1;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h101:	begin                   // GPIO
					PSEL0 = 0;					PSEL1 = 1;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;					
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h102:	begin                   // SPI Master
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 1;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h103:	begin                   // Timer
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 1;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h104:	begin                   // Event/Interrupt Unit
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 1;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h105:	begin                   // I2C
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 1;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h106:	begin                   // FLL
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 1;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
     12'h107:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	   12'h108:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h109:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10A:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10B:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10C:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10D:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10E:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
	  	12'h10F:	begin    // SoC Control
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 1;					PSEL8 = 0;					PSEL9 = 0;
					end
			12'h110:	begin                   // Debug Port
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 1;					PSEL9 = 0;
					end
		  12'h111:	begin                   // FPU
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 1;
					end
			12'h112:	begin                   // FPU
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 1;
					end
   	default:	begin
					PSEL0 = 0;					PSEL1 = 0;					PSEL2 = 0;					PSEL3 = 0;					PSEL4 = 0;
					PSEL5 = 0;					PSEL6 = 0;					PSEL7 = 0;					PSEL8 = 0;					PSEL9 = 0;
					end
			endcase
  
  
   
              if (!PREADY) //if pready is de-asserted then extend acces state (wait)  
                begin
                next_state = access ;
                APB_setup_flag = 0;
                 PREADY_to_AXI_read = 0;
                end
              else if (PREADY && transfer) //return to setup state on arrival of new data 
                begin
                next_state = setup ;
                
                    if (!write_read)
                      PREADY_to_AXI_read = 1;
                    else
                      PREADY_to_AXI_read = 0;
                //PREADY_to_AXI_read = (!write_read) ? 1 : 0 ;
                APB_setup_flag = 1;
                end
              else //(PREADY & !transfer) in case of no new data return to idle state
                begin
                next_state = idle ;
                APB_setup_flag  = 0;
                    if (!write_read)
                      PREADY_to_AXI_read = 1;
                    else
                      PREADY_to_AXI_read = 0;
                
                //PREADY_to_AXI_read = (!write_read) ? 1 : 0 ;
                end

				
              if (write_read) //write transaction
                begin
                prdata_out = 0 ;
                PSTRB = strb_input ;
                PWDATA = wdata ;
				        //PREADY_to_AXI_read = 0;
                end
              else if (PREADY) // if pready is asserted we can read our data on output bus to cpu (read transaction)
                begin
                prdata_out = PRDATA;
                PWDATA = 0 ;
                PSTRB = 0 ;
				        //PREADY_to_AXI_read = PREADY ;				
                end 
              else 
                begin
                prdata_out = 0 ;
                PSTRB = 0 ;
                PWDATA = 0 ;
                end  
      end          
  endcase
end    
       
        
endmodule



