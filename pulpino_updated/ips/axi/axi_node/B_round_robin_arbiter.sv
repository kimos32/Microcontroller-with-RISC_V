module B_round_robin_arbiter #(parameter sID_width = 'd6)(
  //Input Signals Definition
	input                             clk         ,
	input                             reset_n     ,
	input                             count_update,

	input                             BVALID0     ,
	input                             BVALID1     ,
	input                             BVALID2     ,
  input                             BVALID3     ,
  input                             BVALID4     ,

  input [sID_width-1:0]             BID0        ,
  input [sID_width-1:0]             BID1        ,
  input [sID_width-1:0]             BID2        ,
  input [sID_width-1:0]             BID3        ,
  input [sID_width-1:0]             BID4        ,
                                    
  //Output Signals Definition       
  output reg [2:0]                  B_SLV_sel   ,
  output reg                        ID_valid    ,
  output reg [sID_width-1:0]        ID
  );

////////////////////States Gray Encoding///////////////////
localparam [2:0] IDLE = 3'b000,
                 SLV0 = 3'b001,
                 SLV1 = 3'b011,
                 SLV2 = 3'b010,
                 SLV3 = 3'b110,
                 SLV4 = 3'b111;

/////////////////Internal Signals Definition///////////////
reg [2:0] current_state,
          next_state   ;

wire      ID_valid_comb;

/////////////////////State Transation/////////////////////
always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        current_state <= IDLE;
      end
    else
      begin
        current_state <= next_state;
      end
  end

////////////////////Next State Logic/////////////////////
always @(*)
  begin
    case(current_state)
      IDLE: begin
              if(BVALID0)
                begin
                  next_state = SLV0;
                end
              else if(BVALID1)
                begin
                  next_state = SLV1;
                end
              else if(BVALID2)
                begin
                  next_state = SLV2;
                end
              else if(BVALID3)
                begin
                  next_state = SLV3;
                end
              else if(BVALID4)
                begin
                  next_state = SLV4;
                end
              else
                begin 
                  next_state = IDLE;
                end
            end

        SLV0: begin
                if(BVALID0 && count_update)
                  begin
                    next_state = SLV0;
                  end
                else if(BVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(BVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(BVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(BVALID4)
                  begin
                    next_state = SLV4;
                  end 
                else if(BVALID0)
                  begin
                    next_state = SLV0;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        SLV1: begin
                if(BVALID1 && count_update)
                  begin
                    next_state = SLV1;
                  end
                else if(BVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(BVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(BVALID4)
                  begin
                    next_state = SLV4;
                  end
                else if(BVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(BVALID1)
                  begin
                    next_state = SLV1;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        SLV2: begin
                if(BVALID2 && count_update)
                  begin
                    next_state = SLV2;
                  end
                else if(BVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(BVALID4)
                  begin
                    next_state = SLV4;
                  end
                else if(BVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(BVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(BVALID2)
                  begin
                    next_state = SLV2;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        SLV3: begin
                if(BVALID3 && count_update)
                  begin
                    next_state = SLV3;
                  end
                else if(BVALID4)
                  begin
                    next_state = SLV4;
                  end
                else if(BVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(BVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(BVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(BVALID3)
                  begin
                    next_state = SLV3;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end
        
        SLV4: begin
                if(BVALID4 && count_update)
                  begin
                    next_state = SLV4;
                  end
                else if(BVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(BVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(BVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(BVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(BVALID4)
                  begin
                    next_state = SLV4;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        default: begin
                   next_state = IDLE;
                 end
    endcase
  end

///////////////////Combinational Output Logic/////////////////////
assign ID_valid_comb = BVALID0 || BVALID1 || BVALID2 || BVALID3 || BVALID4;

//////////////////Sequential Output Logic////////////////////////
always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        B_SLV_sel <= 3'd5;
        ID        <= 'd0;
      end
    else
      begin
        case(current_state)
          IDLE: begin
                  if(BVALID0)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                  else if(BVALID1)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                  else if(BVALID2)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                  else if(BVALID3)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                  else if(BVALID4)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                end

          SLV0: begin
                  if(BVALID0 && count_update)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                  else if(BVALID1)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                  else if(BVALID2)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                  else if(BVALID3)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                  else if(BVALID4)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                  else if(BVALID0)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                end

          SLV1: begin
                  if(BVALID1 && count_update)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                  else if(BVALID2)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                  else if(BVALID3)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                  else if(BVALID4)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                  else if(BVALID0)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                  else if(BVALID1)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                end
          
          SLV2: begin
                  if(BVALID2 && count_update)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                  else if(BVALID3)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                  else if(BVALID4)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                  else if(BVALID0)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                  else if(BVALID1)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                  else if(BVALID2)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                end

          SLV3: begin
                  if(BVALID3 && count_update)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                  else if(BVALID4)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                  else if(BVALID0)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                  else if(BVALID1)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                  else if(BVALID2)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                  else if(BVALID3)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                end
          
          SLV4: begin
                  if(BVALID4 && count_update)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                  else if(BVALID0)
                    begin
                      B_SLV_sel <= 3'b000;
                      ID        <= BID0;
                    end
                  else if(BVALID1)
                    begin
                      B_SLV_sel <= 3'b001;
                      ID        <= BID1;
                    end
                  else if(BVALID2)
                    begin
                      B_SLV_sel <= 3'b010;
                      ID        <= BID2;
                    end
                  else if(BVALID3)
                    begin
                      B_SLV_sel <= 3'b011;
                      ID        <= BID3;
                    end
                  else if(BVALID4)
                    begin
                      B_SLV_sel <= 3'b100;
                      ID        <= BID4;
                    end
                end
        endcase
      end
  end

always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        ID_valid <= 1'b0;
      end
    else
      begin
        ID_valid <= ID_valid_comb;
      end
  end

endmodule


