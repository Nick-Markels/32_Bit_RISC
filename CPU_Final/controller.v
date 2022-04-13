//--------------------------------------
// Controller for the CPU
//
// Authors: Jude Gabriel & Nick Markels 
//---------------------------------------

`timescale 1ns /1ns 

module controller(marEn, pcFetch, pcEn, pcIncSel, pcAddSel, pcRegSel, wEn, irEn, ldEn, stEn, mdrEn, compOut, wr, rd, clk, reset, irOut, go_contr);


parameter WIDTH = 32;

//----------- OUTPUTS FROM CPU --------------//
output reg marEn;		//Enable for the MAR
output reg pcFetch; 	        //Tells MAR to read from PC
output reg pcEn; 		//Enable for the PC
output reg pcIncSel;            //Tells PC to load either internal data or external data
output reg pcAddSel; 		//Tells the PC to add 4 or add SEXT literal
output reg pcRegSel;            //Tells PC to either choose Reg A or Reg C as an input
output reg wEn;		        //Enable for the Register File
output reg irEn; 		//Enable for the IR
output reg ldEn;		//Tells the MDR we are performing a load 
output reg stEn;		//Tells the MDr we are performing a store
output reg mdrEn;		//Enables the MDR
output reg wr;		        //Enable writing to the RAM
output reg rd;		        //Enable reading from the RAM


//-------------- INPUTS TO CPU -------------//
input [WIDTH-1:0] irOut; 		//Give the current instruction to the CPU
input compOut;				//Sends flag from comparator
input clk;				//Clock signal
input reset;				//Reset signal


//----------- TYPEDEFS F0R STATES ---------//
typedef enum {F_S0, F_S1, F_S2, F_S3, F_S4, F_S5} fetch_state_t; 									//Fetch States
typedef enum {PC_S0, PC_S1, PC_S2} pc_state_t;				     								//PC states
typedef enum {ALU_S0, ALU_S1, ALU_S2} alu_state_t;			     								//ALU states
typedef enum {LD_S0, LD_S1, LD_S2, LD_S3, LD_S4, LD_S5, LD_S6, LD_S7} ld_state_t;		     					//Load States
typedef enum {ST_S0, ST_S1, ST_S2, ST_S3, ST_S4} st_state_t;										//Store States
typedef enum {JMP_S0, JMP_S1, JMP_S2, JMP_S3, JMP_S4, JMP_S5} jmp_state_t;								//Jump States
typedef enum {BEQ_S0, BEQ_S1, BEQ_S2, BEQ_S3, BEQ_S4} beq_state_t;									//Branching Equals States
typedef enum {BNE_S0, BNE_S1, BNE_S2, BNE_S3, BNE_S4} bne_state_t;									//Branching Not Equals States
typedef enum {BRA_S0, BRA_S1, BRA_S2, BRA_S3, BRA_S4, BRA_S5, BRA_S6, BRA_S7, BRA_S8, BRA_S9} bra_state_t;				//Branching Main Controller States
typedef enum {DC_S0, DC_S1, DC_S2, DC_S3, DC_S4, DC_S5, DC_S6, DC_S7, DC_S8, DC_S9, DC_S10, DC_S11, DC_S12, DC_S13} dc_state_t;		//Decode States
typedef enum {C_S0, C_S1, C_S2, C_S3, C_S4, C_S5, C_S6, C_S7} contr_state_t;								//Main Controller States


//--------- FLAGS -------------//
integer go_fetch; 		//Tells fetch FSM to start  
integer fetch_done;		//Tells controller fetch FSM is done

integer go_pc;			//Tells pc update FSM to start
integer pc_done;		//Tells controller pc FSM is done

integer go_alu;			//Tells ALU FSM to start
integer alu_done;		//Tells controller ALU FSM is done

integer go_ld;			//Tells the LD FSM to start
integer ld_done;		//Tells the controller LD FSM is done

integer go_st;			//Tells the ST FSM to start
integer st_done;		//Tells the controller ST FSM is done

integer go_jmp;			//Tells the JMP FSM to start
integer jmp_done;		//Tells the controller the Jump FSM is done

integer go_beq;			//Tells the BEQ FSM to start
integer beq_done;		//Tells the controller the BEQ FSM is done

integer go_bne;			//Tells the BNE FSM to start
integer bne_done;		//Tells the controller the BNE FSM is done

integer go_bra; 		//Tells the BRA FSM to start
integer bra_done;		//Tells the controller the BRA FSM is done

integer go_dc;			//Tells the Decode FSM to Start
integer dc_done;		//Tells the controller the Decode FSM is done

input go_contr;			//Tells the Controller to start
integer contr_done;		//Tells user the program is finshed



//------------ RESET ---------// 
always @(negedge reset)
  begin
	marEn = 'b0;
	pcFetch = 'b0;
	pcEn = 'b0;
	wEn = 'b0;
	irEn = 'b0;
	ldEn = 'b0;
	stEn = 'b0;
	mdrEn = 'b0;
	wr = 'b0;
	rd = 'b0;
	go_fetch = 0;
	go_pc = 0;
	go_alu = 0;
	go_ld = 0;
	go_st = 0;
	go_jmp = 0;
	go_beq = 0;
	go_bne = 0;
	go_bra = 0;
	go_dc = 0;
	contr_done = 0;
  end 



//------------ FETCH ----------//
fetch_state_t curr_fetch, next_fetch;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
           begin 
		curr_fetch = F_S0;
		next_fetch = F_S0;
	  end 
	else
	  curr_fetch = next_fetch;
	
	if(go_fetch)
          begin 
			case(curr_fetch)	
				
				//Check if we are good to go
	 			F_S0: begin
					next_fetch = (go_fetch) ? F_S1 : F_S0;
					fetch_done = 0;
	       			end 

				//Set pcFetch so that the MAR recieves PC address
				F_S1: begin 
					next_fetch = F_S2;
					fetch_done = 0;
					pcFetch = 1'b1;
	      			end

				//Enable the RAM to for reading
				F_S2: begin 
					next_fetch = F_S3;
					fetch_done = 0;
					marEn = 1'b1;
	      			end

				//Enable the IR to be written to
				F_S3: begin 
					next_fetch = F_S4;
					fetch_done = 0;
					rd = 1'b1;
	     			end

				//Enable the Register File to be written to 
				F_S4: begin 
					next_fetch = F_S5;
					fetch_done = 0;
					irEn = 1'b1;
	      			end

				//Turn off control signals and tell master controller we are done
				F_S5: begin 
					next_fetch = F_S0;
					fetch_done = 1;
					irEn = 1'b0;
					marEn = 1'b0;
					rd = 1'b0;
					pcFetch = 1'b0;
					go_fetch = 0;
	      			end

				//Default case
            			default:
                			begin
						next_fetch = curr_fetch;
						fetch_done = 1'b0;
                 			end 
			endcase
     	end 
  end 


//---------- PC UPDATE ------------//
pc_state_t curr_pc, next_pc;

always @(posedge clk or negedge reset)
  begin 
	if(!reset)
	  begin 
		curr_pc = PC_S0;
		next_pc = PC_S0;
	  end 
	else
	  curr_pc = next_pc;

	if(go_pc)
	  begin 
		case(curr_pc)

			//Check if we are good to go
			PC_S0: begin
				next_pc = (go_pc) ? PC_S1 : PC_S0;
				pc_done = 0;
			end 

			//Set pcEn to 1 so the pc can update
			PC_S1: begin
				next_pc = PC_S2;
				pc_done = 0;
				pcIncSel = 1'b0;
				pcEn = 1'b1;
			end 

			//Turn off pcEn since pc has updated, set flag as done
			PC_S2: begin
				next_pc = PC_S0;
				pc_done = 1;
				pcEn = 1'b0;
				go_pc = 0;
			end

			//Default Case
			default:
				begin
					next_pc = curr_pc;
					pc_done = 0;
				end 
		endcase
	end 
end


//------------ ALU CONTROLLER -----------//
alu_state_t curr_alu, next_alu;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
	  begin
		curr_alu = ALU_S0;
		next_alu = ALU_S0;
	  end 
	else
	  curr_alu = next_alu;

	if(go_alu)
	  begin 
		case(curr_alu)
	
			//Check if we are good to go 
			ALU_S0: begin 
				next_alu = (go_alu) ? ALU_S1 : ALU_S0;
				alu_done = 0;
			end

			//Set wEn so that the register file can update
			ALU_S1: begin
				next_alu = ALU_S2;
				alu_done = 0;
				pcIncSel = 1'b0;
				wEn = 1'b1;
			end

			//Turn off wEn since register file has been updated
			ALU_S2: begin
				next_alu = ALU_S0;
				alu_done = 1;
				wEn = 1'b0;
				go_alu = 0;
			end 

			//Defaut case
			default: 
				begin 
					next_alu = curr_alu;
					alu_done = 0;
				end
		endcase
	end
end 


//----------- LOAD FSM ------------//
ld_state_t curr_ld, next_ld;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
	  begin
		curr_ld = LD_S0;
		next_ld = LD_S0;
	  end 
	else 
	  curr_ld = next_ld;

	if(go_ld)
	  begin 
		case(curr_ld)

			//Check if we are good to go
			LD_S0: begin 
				next_ld = (go_ld) ? LD_S1 : LD_S0;
				ld_done = 0;
			end 

			//Get the address into the MAR
			LD_S1: begin 
				next_ld = LD_S2;
				ld_done = 0;
				marEn = 1'b1;
				pcIncSel = 1'b0;
			end 

			//Turn off MAR, set RAM for reading
			LD_S2: begin 
				next_ld = LD_S3;
				ld_done = 0;
				marEn = 1'b0;
				rd = 1'b1;
			end
		
			//Turn on the load enable to load into MDR
			LD_S3: begin 
				next_ld = LD_S4;
				ld_done = 0;
				ldEn = 1'b1;
			end 

			//Turn on MDR to recieve data
			LD_S4: begin 
				next_ld = LD_S5;
				ld_done = 0;
				mdrEn = 1'b1;
				
			end 

			//Turn off the MDR, turn off load enable turn off read
			LD_S5: begin 
				next_ld = LD_S6;
				ld_done = 0;
				ldEn = 1'b0;
				mdrEn = 1'b0;
				rd = 1'b0;
			end 

			//Enable the register file for loading
			LD_S6: begin 
				next_ld = LD_S7;
				ld_done = 0;
				wEn = 1'b1;
			end 

			//Turn off register file enable and mark FSM as done
			LD_S7: begin 
				next_ld = LD_S0;
				ld_done = 1;
				wEn = 1'b0;
				go_ld = 0;
			end

			//Default Case
			default: begin
				next_ld = curr_ld;
				ld_done = 0;
			end 
		endcase
	end 
end 
			

//--------------- STORE FSM -------------//
st_state_t curr_st, next_st;

always @(posedge clk or negedge reset)
  begin 
	if(!reset) 
	  begin 
		curr_st = ST_S0;
		next_st = ST_S0;
	  end 
	else 
	  curr_st = next_st;

	if(go_st)
	  begin
		case(curr_st)

			//Check if we are good to go 
			ST_S0: begin 
				next_st = (go_st) ? ST_S1 : ST_S0;
				st_done = 0;
			end 

			//Enable the stEn so MDR recieves the data to store
			ST_S1: begin 
				next_st = ST_S2;
				st_done = 0;
				stEn = 1'b1;
			end
		
			//Enable the MDR and MAR to recieve the data and address
			ST_S2: begin 
				next_st = ST_S3;
				st_done = 0;
				marEn = 1'b1;
				mdrEn = 1'b1;
			end 

			//Turn off stEn, and enables for the mdr and mar since they now have the data and address, turn on wr to write to RAM
			ST_S3: begin
				next_st = ST_S4;
				st_done = 0;
				stEn = 1'b0;
				marEn = 1'b0;
				mdrEn = 1'b0;
				wr = 1'b1;
			end 

			//Turn off the wr for RAM and mark this FSM as done
			ST_S4: begin 
				next_st = ST_S0;
				st_done = 1;
				wr = 1'b0;
				go_st = 0;
			end 

			//Default case: 
			default: begin 
				next_st = curr_st;
				st_done = 0;
			end 
		endcase
	end 
end 
				


//---------------- JUMP FSM ----------------//
jmp_state_t curr_jmp, next_jmp;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
	  begin 
		curr_jmp = JMP_S0;
		next_jmp = JMP_S0;
	  end
	else 
	  curr_jmp = next_jmp;

	if(go_jmp)
	  begin
		case(curr_jmp)

			//Check if we are good to go 
			JMP_S0: begin
				next_jmp = (go_jmp) ? JMP_S3 : JMP_S0;    //TEMP CHANGE TO S3 TO FIND BUG WHERE JUMPING BY 8
				jmp_done = 0;
			end 

			//Start the program counter to increment by 4
			JMP_S1: begin 
				next_jmp = JMP_S2;
				jmp_done = 0;
				pcAddSel = 1'b0;
				go_pc = 1;
			end 

			//Check if the PC is done incrementing
			JMP_S2: begin
				next_jmp = (pc_done) ? JMP_S3 : JMP_S2;
				jmp_done = 0;
			end

			//Send the PC output to the register file
			JMP_S3: begin
				next_jmp = JMP_S4;
				jmp_done = 0;
				go_pc = 0;
				pcIncSel = 1'b1;
				wEn = 1'b1;
			end

			//Re-enable the PC and load it with Reg A
			JMP_S4: begin
				next_jmp = JMP_S5;
				jmp_done = 0;
				pcRegSel = 1'b1;
				wEn = 1'b0;
				pcEn = 1'b1;
			end 

			//Turn off the PC and mark as done
			JMP_S5: begin 
				next_jmp = JMP_S0;
				jmp_done = 1;
				pcEn = 1'b0;
				pcRegSel = 1'b0;
				pcIncSel = 1'b0;
				go_jmp = 0;
			end 

			//Default Case
			default: begin 
				next_jmp = curr_jmp;
				jmp_done = 0;
			end 
		endcase
	end
end 





//------------ BEQ FSM --------------//
beq_state_t curr_beq, next_beq;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
	  begin
		curr_beq = BEQ_S0;
		next_beq = BEQ_S0;
	  end
	else
	  curr_beq = next_beq;

	if(go_beq)
	  begin
		case(curr_beq)
		
			//Check if we are good to go 
			BEQ_S0: begin
				next_beq = (go_beq) ? BEQ_S1 : BEQ_S0;
				beq_done = 0;
			end

			//Check for the comparator flag
			BEQ_S1: begin
				next_beq = (compOut) ? BEQ_S2 : BEQ_S4;
				beq_done = 0;
			end 
	
			//Increment the PC by the SEXT literal
			BEQ_S2: begin
				next_beq = BEQ_S4;   //DEBUG S3 NOT NECCESARY???
				beq_done = 0;
				pcAddSel = 1'b1;
				pcIncSel = 1'b0;
				pcEn = 1'b1;
			end 

			//Check if the PC is done updating
			BEQ_S3: begin
				next_beq = (pc_done) ? BEQ_S4 : BEQ_S3;
				beq_done = 0;
			end

			//Turn off the PC and mark as done
			BEQ_S4: begin
				next_beq = BEQ_S0;
				beq_done = 1;
				pcEn = 1'b0;
				pcAddSel = 1'b0;
				pcIncSel = 1'b0;
				go_bne = 0;
			end

			//Default Case
			default: begin
				next_beq = curr_beq;
				beq_done = 0;
			end
		endcase
	end
end 



//------------- BNE FSM ----------------//
bne_state_t curr_bne, next_bne;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
	  begin 
		curr_bne = BNE_S0;
		next_bne = BNE_S0;
	  end
	else
	  curr_bne = next_bne;

	if(go_bne)
	  begin 
		case(curr_bne)
		
			//Check if we are good to go
			BNE_S0: begin
				next_bne = (go_bne) ? BNE_S1 : BNE_S0;
				bne_done = 0;
			end

			//Check for the comparator flag
			BNE_S1: begin 
				next_bne = (compOut) ? BNE_S4 : BNE_S2;
				bne_done = 0;
			end 

			//Update the PC with the SEXT literal
			BNE_S2: begin
				next_bne = BNE_S4;  //DEBUG S3 NOT NECCESARY???
				bne_done = 0;
				pcAddSel = 1'b1;
				pcIncSel = 1'b0;
				pcEn = 1'b1;
			end

			//Check if PC is done
			BNE_S3: begin
				next_bne = (pc_done) ? BNE_S4 : BNE_S3;
				bne_done = 0;
			end

			//Turn off the PC and mark as done
			BNE_S4: begin
				next_bne = BNE_S0;
				bne_done = 1;
				pcEn = 1'b0;
				pcAddSel = 1'b0;
				pcIncSel = 1'b0;
				go_bne = 0;
			end
			
			//Default Case
			default: begin
				next_bne = curr_bne;
				bne_done = 1;
			end
		endcase
	end
end 
	

//---------------- BRA FSM -----------//
bra_state_t curr_bra, next_bra;

always @(posedge clk or negedge reset)
  begin
	if(!reset)
	  begin
		curr_bra = BRA_S0;
		next_bra = BRA_S0;
	  end
	else
	  curr_bra = next_bra;

	if(go_bra)
	  begin
		case(curr_bra)

			//Check if we are good to go
			BRA_S0: begin
				next_bra = (go_bra) ? BRA_S3 : BRA_S0;  //DONT NEED TO UPDATE PC???
				bra_done = 0;
			end

			//Update the PC
			BRA_S1: begin
				next_bra = BRA_S2;
				bra_done = 0;
				pcIncSel = 1'b0;
				pcAddSel = 1'b0;
				go_pc = 1;
			end
		
			//Check if the PC is done
			BRA_S2: begin
				next_bra = (pc_done) ? BRA_S3 : BRA_S2;
				bra_done = 0;
			end

			//Enable the register file for writing
			BRA_S3: begin
				next_bra = BRA_S4;
				bra_done = 0;
				go_pc = 0;
				pcIncSel = 1'b1;
				wEn = 1'b1;
			end

			//Turn off the register file and check for BEQ or BNE
			BRA_S4: begin
				next_bra = (irOut[26]) ? BRA_S7 : BRA_S5;
				bra_done = 0;
				pcIncSel = 1'b0;
				wEn = 1'b0;
			end

			//Enable BEQ FSM to start
			BRA_S5: begin
				next_bra = BRA_S6;
				bra_done = 0;
				go_beq = 1;
			end

			//Check if BEQ FSM is done
			BRA_S6: begin
				next_bra = (beq_done) ? BRA_S9 : BRA_S6;
				bra_done = 0;
			end


			//Enable the BNE FSM to start
			BRA_S7: begin
				next_bra = BRA_S8;
				bra_done = 0;
				go_bne = 1;
			end

			//Check if the BNE FSM is done
			BRA_S8: begin
				next_bra = (bne_done) ? BRA_S9 : BRA_S8;
				bra_done = 0;
			end

			//Turn off BNE and BEQ, mark FSM as done
			BRA_S9: begin
				next_bra = BRA_S0;
				bra_done = 1;
				go_beq = 0;
				go_bne = 0;
				go_bra = 0;
			end
	
			//Default Case
			default: begin
				next_bra = curr_bra;
				bra_done = 0;
			end
		endcase
	end
end


//-------------- DECODE FSM ----------------//
dc_state_t curr_dc, next_dc;

always @(posedge clk or negedge reset)
  begin 
	if(!reset)
	  begin 
		curr_dc = DC_S0;
		next_dc = DC_S0;
	  end 
	else 
	  curr_dc = next_dc;

	if(go_dc)
	  begin 
		case(curr_dc)

			//Check if we are good to go 
			DC_S0: begin 
				next_dc = (go_dc) ? DC_S1 : DC_S0;
				dc_done = 0;
			end 

			//Check if ALU op class or ld, st class
			DC_S1: begin 
				next_dc = (irOut[31]) ? DC_S5 : DC_S2;
				dc_done = 0;
			end 

			//In ld st: Check if it is a load or store operation
			DC_S2: begin 
				if(!irOut[26] && !irOut[27] && !irOut[28])
					next_dc = DC_S3;

				else if(irOut[26] && !irOut[27] && !irOut[28])
					next_dc = DC_S4;

				else if(irOut[26] && irOut[27] && !irOut[28])
					next_dc = DC_S9;

				else if(irOut[28])
					next_dc = DC_S11;
				
				dc_done = 0;
			end 

			//For load operation: trigger go_ld 
			DC_S3: begin 
				next_dc = DC_S7;
				go_ld = 1;
				dc_done = 0;
			end 

			//For store operation: trigger go_st 
			DC_S4: begin 
				next_dc = DC_S8;
				go_st = 1;
				dc_done = 0;
			end 


			//For alu operation: trigger go_alu 
			DC_S5: begin 
				next_dc = DC_S6;
				go_alu = 1;
				dc_done = 0;
			end 

			//Check if ALU operations are finished
			DC_S6: begin 
				next_dc = (alu_done) ? DC_S13 : DC_S6;
				dc_done = 0;
			end 

			//Check if load operations are finished
			DC_S7: begin
				next_dc = (ld_done) ? DC_S13 : DC_S7;
				dc_done = 0;
			end
			
			//Check if store operations are finished
			DC_S8: begin
				next_dc = (st_done) ? DC_S13 : DC_S8;
				dc_done = 0;
			end

			//For Jump operation, trigger go_jmp
			DC_S9: begin
				next_dc = DC_S10;
				dc_done = 0;
				go_jmp = 1;
			end


			//Check if jump operation is finished
			DC_S10: begin
				  next_dc = (jmp_done) ? DC_S13 : DC_S10;
				  dc_done = 0;
			end

			//For Branching statements, trigger go_bra
			DC_S11: begin
				  next_dc = DC_S12;
				  dc_done = 0;
				  go_bra = 1;
			end

			//Check if Branching operations are done
			DC_S12: begin
				  next_dc = (bra_done) ? DC_S13 : DC_S12;
				  dc_done = 0;
			end

			//End of decode FSM, mark as done, turn off all go signals, (reset all child states?)
			DC_S13: begin 
				  next_dc = DC_S0;
				  go_ld = 0;
				  go_st = 0;
				  go_alu = 0;
				  go_jmp = 0;
				  go_bra = 0;
				  alu_done = 0;
				  ld_done = 0;
				  st_done = 0;
				  jmp_done = 0;
				  bra_done = 0;
				  dc_done = 1;
				  go_dc = 0;
			end 

			//Default state:
			default: begin 
				next_dc = curr_dc;
				dc_done = 0;
			end 
		endcase
	end 
end 



//------------- MAIN CONTROLLER FSM ----------------//
contr_state_t curr_contr, next_contr;

always @(posedge clk or negedge reset)
  begin 
	if(!reset) 
	  begin 
		curr_contr = C_S0;
		next_contr = C_S1;
	  end 
	else 
	  curr_contr = next_contr;

	if(go_contr)
	  begin 
		case(curr_contr)
		
			//Check if we are good to start the program
			C_S0: begin 
				next_contr = (go_contr) ? C_S1 : C_S0;
				contr_done = 0;
			end 

			//Fetch the first operation
			C_S1: begin 
				next_contr = C_S2;
				contr_done = 0;
				go_fetch = 1;
			end 

			//Check if fetch complete
			C_S2: begin
				next_contr = (fetch_done) ? C_S3 : C_S2;
				contr_done = 0;
			end 

			//Update the PC 
			C_S3: begin 
				next_contr = C_S4;
				contr_done = 0;
				pcIncSel = 1'b0;
				pcAddSel = 1'b0;
				go_pc = 1;
			end 

			//Check if pc update complete
			C_S4: begin 
				next_contr = (pc_done) ? C_S5 : C_S4;
				contr_done = 0;
			end 

			//Decode and perform operation 
			C_S5: begin
				next_contr = C_S6;
				contr_done = 0;
				go_dc = 1;
			end 

			//Check if operation complete
			C_S6: begin
				next_contr = (dc_done) ? C_S7 : C_S6;
				contr_done = 0;
			end 

			//Mark the FSM as complete then restart: 
			C_S7: begin 
				next_contr = C_S0;
				contr_done = 1;
				marEn = 'b0;
				pcFetch = 'b0;
				pcEn = 'b0;
				wEn = 'b0;
				irEn = 'b0;
				ldEn = 'b0;
				stEn = 'b0;
				mdrEn = 'b0;
				wr = 'b0;
				rd = 'b0;
				go_fetch = 0;
				fetch_done = 0;
				go_pc = 0;
				pc_done = 0;
				go_alu = 0;
				alu_done = 0;
				go_ld = 0;
				ld_done = 0;
				go_st = 0;
				st_done = 0;
				go_dc = 0;
				dc_done = 0;
			end 

			//Default case:
			default: begin 
				next_contr = curr_contr;
				contr_done = 0;
			end 
		endcase
	end 
end 


endmodule 
