module R_round_robin_arbiter #(parameter sID_width = 'd6)(
  //Input Signals Definition
	input                             clk         ,
	input                             reset_n     ,
	input                             count_update,

	input                             RVALID0     ,
	input                             RVALID1     ,
	input                             RVALID2     ,
  input                             RVALID3     ,
  input                             RVALID4     ,

  input [sID_width-1:0]             RID0        ,
  input [sID_width-1:0]             RID1        ,
  input [sID_width-1:0]             RID2        ,
  input [sID_width-1:0]             RID3        ,
  input [sID_width-1:0]             RID4        ,

  //Output Signals Definition
  output reg [2:0]                  R_SLV_sel   ,
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
              if(RVALID0)
                begin
                  next_state = SLV0;
                end
              else if(RVALID1)
                begin
                  next_state = SLV1;
                end
              else if(RVALID2)
                begin
                  next_state = SLV2;
                end
              else if(RVALID3)
                begin
                  next_state = SLV3;
                end
              else if(RVALID4)
                begin
                  next_state = SLV4;
                end
              else
                begin 
                  next_state = IDLE;
                end
            end

        SLV0: begin
                if(RVALID0 && count_update)
                  begin
                    next_state = SLV0;
                  end
                else if(RVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(RVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(RVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(RVALID4)
                  begin
                    next_state = SLV4;
                  end 
                else if(RVALID0)
                  begin
                    next_state = SLV0;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        SLV1: begin
                if(RVALID1 && count_update)
                  begin
                    next_state = SLV1;
                  end
                else if(RVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(RVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(RVALID4)
                  begin
                    next_state = SLV4;
                  end 
                else if(RVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(RVALID1)
                  begin
                    next_state = SLV1;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        SLV2: begin
                if(RVALID2 && count_update)
                  begin
                    next_state = SLV2;
                  end
                else if(RVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(RVALID4)
                  begin
                    next_state = SLV4;
                  end 
                else if(RVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(RVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(RVALID2)
                  begin
                    next_state = SLV2;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end

        SLV3: begin
                if(RVALID3 && count_update)
                  begin
                    next_state = SLV3;
                  end
                else if(RVALID4)
                  begin
                    next_state = SLV4;
                  end
                else if(RVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(RVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(RVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(RVALID3)
                  begin
                    next_state = SLV3;
                  end
                else
                  begin
                    next_state = IDLE;
                  end
              end
        
        SLV4: begin
                if(RVALID4 && count_update)
                  begin
                    next_state = SLV4;
                  end
                else if(RVALID0)
                  begin
                    next_state = SLV0;
                  end
                else if(RVALID1)
                  begin
                    next_state = SLV1;
                  end
                else if(RVALID2)
                  begin
                    next_state = SLV2;
                  end
                else if(RVALID3)
                  begin
                    next_state = SLV3;
                  end
                else if(RVALID4)
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
assign ID_valid_comb = RVALID0 || RVALID1 || RVALID2 || RVALID3 || RVALID4;

//////////////////Sequential Output Logic////////////////////////
always @(posedge clk, negedge reset_n)
  begin
    if(!reset_n)
      begin
        R_SLV_sel <= 3'd5;
        ID        <= 'd0;
      end
    else
      begin
        case(current_state)
          IDLE: begin
                  if(RVALID0)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else if(RVALID1)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else if(RVALID2)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else if(RVALID3)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                  else if(RVALID4)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
                    end
                  else
                    begin
                      R_SLV_sel <= 3'd5;
                    end
                end

          SLV0: begin
                  if(RVALID0 && count_update)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else if(RVALID1)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else if(RVALID2)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else if(RVALID3)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                  else if(RVALID4)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
                    end
                  else if(RVALID0)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else
                    begin
                      R_SLV_sel <= 3'b101;
                    end
                end

          SLV1: begin
                  if(RVALID1 && count_update)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else if(RVALID2)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else if(RVALID3)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                  else if(RVALID4)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
                    end
                  else if(RVALID0)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else if(RVALID1)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else
                    begin
                      R_SLV_sel <= 3'b101;
                    end
                end

          SLV2: begin
                  if(RVALID2 && count_update)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else if(RVALID3)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                  else if(RVALID4)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
                    end
                  else if(RVALID0)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else if(RVALID1)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else if(RVALID2)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else
                    begin
                      R_SLV_sel <= 3'b101;
                    end
                end

          SLV3: begin
                  if(RVALID3 && count_update)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                  else if(RVALID4)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
                    end
                  else if(RVALID0)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else if(RVALID1)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else if(RVALID2)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else if(RVALID3)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                end
          
          SLV4: begin
                  if(RVALID4 && count_update)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
                    end
                  else if(RVALID0)
                    begin
                      R_SLV_sel <= 3'b000;
                      ID        <= RID0;
                    end
                  else if(RVALID1)
                    begin
                      R_SLV_sel <= 3'b001;
                      ID        <= RID1;
                    end
                  else if(RVALID2)
                    begin
                      R_SLV_sel <= 3'b010;
                      ID        <= RID2;
                    end
                  else if(RVALID3)
                    begin
                      R_SLV_sel <= 3'b011;
                      ID        <= RID3;
                    end
                  else if(RVALID4)
                    begin
                      R_SLV_sel <= 3'b100;
                      ID        <= RID4;
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


