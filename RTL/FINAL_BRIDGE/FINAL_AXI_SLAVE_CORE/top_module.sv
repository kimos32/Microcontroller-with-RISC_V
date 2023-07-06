//______________________________________________________________AXI SLAVE CORE TOP MODULE______________________________________________________________//
//_____________________________________________________________ Loay Abdalla & Ali Elsayed_____________________________________________________________//
//Last Edit: 25/06/2023
//Blocks: READ_FIFO  || READ RESPONSE GENERATOR (RRG)  || READ ADDRESS GENERATOR (RAG)
//        WRITE_FIFO || WRITE RESPONSE GENERATOR (WRG) || WRITE ADRESS GENERATOR (WAG)  //



`timescale 1ns/1ps
`define DEPTH 8               //DEPTH = 8
`define LOCATIONS (1<<`DEPTH) //No. of locations = 256


module top_module(


//_____________________________GLOBAL SIGNALS_____________________________//


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
input           R_Ready_Address,

output          ARREADY,
output  [31 :0] Read_Address,
output          R_Valid_Address,
output  [2:0]   R_Prot,





//_____________________________Read Data_____________________________//


input           RREADY,
input   [31 :0] Read_Data,
input           Valid_Data_R,

output  [5 :0]  RID,
output          RLAST,
output  [31 :0] RDATA,
output          RRESP,
output          RVALID,
output          Read_Ready,




//_____________________________Write Address_____________________________//


input   [5 :0]  AWID,
input   [31 :0] AWADDR,
input   [7 :0]  AWLEN,
input   [2:0]   AWSIZE,
input   [1:0]   AWBURST,
input           AWVALID,
input   [2:0]   AWPROT,

output          AWREADY,
output  [31 :0] Write_Address,
output  [2:0]   W_Prot,




//_____________________________Write Data_____________________________//


input   [31 :0] WDATA,
input           WLAST,
input   [3:0]   WSTRB,
input           WVALID,
input           Write_Ready,

output          WREADY,
output          Write_Valid,
output  [31 :0] Write_Data,
output  [3:0]   Write_Strobe,





//_____________________________Write Response_____________________________//


input           BREADY,

output  [5 :0]  BID,
output          BRESP,
output          BVALID





);


//____________________________________Internal Wires Declaration____________________________________//


wire [31 :0]          read_starting_address;      //From FIFO to AG
wire [5 :0]           read_id;                    //From FIFO to AG & RG
wire                  read_last;                  //From AG to FIFO & RG
wire                  read_R_EMPTY_ADDRESS;       //From FIFO to AG
wire [`DEPTH - 1 : 0] read_rd_ptr_address;        //From FIFO to AG
wire [`DEPTH - 1 : 0] read_rd_ptr_address_ff;
wire [7:0]            read_Address_counter;       //From AG to FIFO
wire [7:0]            read_ARLEN_INC;             //From AG to FIFO
wire [7:0]            read_ARLEN_FIFO;            //From FIFO to AG
wire [2:0]            read_ARSIZE_FIFO;           //From FIFO to AG
wire [1:0]            read_ARBURST_FIFO;          //From FIFO to AG
wire                  read_R_FULL;
wire [2:0]            Read_R_Prot;
wire                  read_R_Valid_Address;
wire [7:0]            read_Beat_Count;


wire [31 :0]          write_starting_address;     //From FIFO to AG
wire                  write_rd_en;                //From AG to FIFO
wire [5 :0]           write_id;                   //From FIFO to RG
wire [1:0]            write_AWBURST_FIFO;         //From FIFO to AG
wire [2:0]            write_AWSIZE_FIFO;          //From FIFO to AG
wire [7:0]            write_AWLEN_FIFO;           //From FIFO to AG
wire                  write_W_FULL;
wire [`DEPTH - 1 : 0] write_rd_ptr;
wire [`DEPTH - 1 : 0] write_rd_ptr_ff;
wire [2:0]            write_W_Prot;


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//____________________________________________Signal Mapping____________________________________________//
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

assign ARREADY = ~read_R_FULL;
assign AWREADY = ~write_W_FULL;
assign RLAST   = read_last;
assign R_Valid_Address  = read_R_Valid_Address;
//____________________________________________READ FIFO____________________________________________//


Read_FIFO RF(

///////////////////////////////////////// INPUTS TO FIFO /////////////////////////////////////////

.clk(clk),
.reset(reset),

.ARADDR(ARADDR /*from master*/),
.ARPROT(ARPROT /*from master*/),
.ARID(ARID /*from master*/),
.wr_en(ARVALID /*from master*/),
.RLAST(read_last /*from AG*/),
.RREADY(RREADY /*from master*/),
.ARLEN(ARLEN),
.ARLEN_INC(read_ARLEN_INC),
.ARSIZE(ARSIZE),
.ARBURST(ARBURST),
.Beat_Count(read_Beat_Count),


///////////////////////////////////////// OUTPUTS FROM FIFO /////////////////////////////////////////

.ADDRESS_OUT(read_starting_address /*To AG*/),
.R_ID_OUT(read_id /*To RG*/),
.R_FULL(read_R_FULL /*To master*/),
.R_Prot_FIFO(Read_R_Prot /*To AG*/),
.R_EMPTY_ADDRESS(read_R_EMPTY_ADDRESS),
.rd_ptr_address(read_rd_ptr_address),
.ARLEN_FIFO(read_ARLEN_FIFO),
.ARSIZE_FIFO(read_ARSIZE_FIFO),
.ARBURST_FIFO(read_ARBURST_FIFO)

);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////





//________________________________________READ ADDRESS GENERATOR________________________________________//





AXI_AG_READ RAG(

///////////////////////////////////////// INPUTS TO RAG /////////////////////////////////////////


.clk(clk),
.reset(reset),

.POPPED_ADDRESS_SA(read_starting_address /*from FIFO*/),
.ARBURST_FIFO(read_ARBURST_FIFO /*from FIFO*/),
.ARSIZE_FIFO(read_ARSIZE_FIFO /*from FIFO*/),
.ARLEN_FIFO(read_ARLEN_FIFO /*from FIFO*/),
.R_Prot_FIFO(Read_R_Prot),
.R_Ready_Address(R_Ready_Address /*from slave*/),
.rd_ptr_address(read_rd_ptr_address /*from FIFO*/),

///////////////////////////////////////// OUTPUTS FROM RAG /////////////////////////////////////////

.Read_Address(Read_Address /*To slave*/),
.R_Prot(R_Prot /*To Slave */),
.RLAST(read_last /*To RG & FIFO*/),
.R_Valid_Address(read_R_Valid_Address /*To slave*/),
.ARLEN_INC(read_ARLEN_INC),
.Address_counter(read_Address_counter),
.rd_ptr_address_ff(read_rd_ptr_address_ff),
.Beat_Count(read_Beat_Count)
);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////







//________________________________________READ RESPONSE GENERATOR________________________________________//





AXI_RG_READ RRG(

///////////////////////////////////////// INPUTS TO RRG /////////////////////////////////////////


.clk(clk),
.reset(reset),

.R_ID_OUT(read_id /*from FIFO*/),
.Valid_Data_R(Valid_Data_R /*from slave*/),
.RREADY(RREADY /*from master*/),
.RLAST(read_last /*from AG*/),
.Read_Data(Read_Data /*from slave*/ ),



///////////////////////////////////////// OUTPUTS FROM RRG /////////////////////////////////////////

.RID(RID /*To master*/),
.RRESP(RRESP /*To master*/),
.RVALID(RVALID /*To master*/),
.Read_Ready(Read_Ready /*To slave*/),
.RDATA(RDATA /*To master*/),
.Beat_Count(read_Beat_Count)

);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////



//____________________________________________WRITE FIFO____________________________________________//


Write_FIFO WF(

///////////////////////////////////////// INPUTS TO FIFO /////////////////////////////////////////

.clk(clk),
.reset(reset),

.wr_en(AWVALID /*from master*/),
.rd_en(write_rd_en /*from master*/),
.AWADDR(AWADDR /*from master*/),
.AWPROT(AWPROT /*from master*/),
.AWID(AWID /*from master*/),
.AWLEN(AWLEN),
.AWBURST(AWBURST),
.AWSIZE(AWSIZE),

///////////////////////////////////////// OUTPUTS FROM FIFO /////////////////////////////////////////

.POPPED_ADDRESS_SA(write_starting_address /*To AG*/),
.W_ID_OUT(write_id /*To RG*/),
.W_FULL(write_W_FULL /*To master*/),
.W_Prot_FIFO(write_W_Prot /*To AG*/),
.AWLEN_FIFO(write_AWLEN_FIFO),
.AWBURST_FIFO(write_AWBURST_FIFO),
.AWSIZE_FIFO(write_AWSIZE_FIFO),
.rd_ptr(write_rd_ptr)
);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////





//________________________________________WRITE ADDRESS GENERATOR________________________________________//





AXI_AG_WRITE WAG(

///////////////////////////////////////// INPUTS TO WAG /////////////////////////////////////////
.clk(clk),
.reset(reset),

.POPPED_ADDRESS_SA(write_starting_address /*from FIFO*/),
.WSTRB(WSTRB /*from master*/),
.AWLEN_FIFO(write_AWLEN_FIFO /*from master*/),
.AWSIZE_FIFO(write_AWSIZE_FIFO /*from master*/),
.AWBURST_FIFO(write_AWBURST_FIFO /*from master*/ ),
.W_Prot_FIFO(write_W_Prot),
.WDATA(WDATA /*from master*/),
.WLAST(WLAST /*from master*/),
.WVALID(WVALID /*from master*/ ),
.Write_Ready(Write_Ready /*from slave*/),
.rd_ptr(write_rd_ptr),

///////////////////////////////////////// OUTPUTS FROM WAG /////////////////////////////////////////

.Write_Address(Write_Address /*To slave*/),
.Write_Data(Write_Data /*To slave*/),
.Write_Valid(Write_Valid /*To slave*/),
.WREADY(WREADY /*To master*/),
.rd_en(write_rd_en /*To FIFO*/),
.Write_Strobe(Write_Strobe /*To slave*/),
.W_Prot(W_Prot),
.rd_ptr_ff(write_rd_ptr_ff)
);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////




//________________________________________WRITE RESPONSE GENERATOR________________________________________//





AXI_RG_WRITE WRG(

///////////////////////////////////////// INPUTS TO WRG /////////////////////////////////////////
.clk(clk),
.reset(reset),

.FIFO_ID_W(write_id /*from FIFO*/),
.Write_Valid(Write_Valid /*from master*/),
.Write_Ready(Write_Ready /*from slave*/),
.BREADY(BREADY /*from master*/ ),
.rd_en(write_rd_en),

///////////////////////////////////////// OUTPUTS FROM WRG /////////////////////////////////////////

.BID(BID /*To master*/),
.BRESP(BRESP /*To master*/),
.BVALID(BVALID /*To master*/)


);
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////




endmodule