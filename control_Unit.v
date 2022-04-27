module control_Unit(clk, reset, in,status, ALUop,PCsrc, ALUsrc,Imm_select, WB, REG_rw,MEM_rw,carry)
//Control Unit set up for all type of instructions
input clk,reset;
input [31:0]in;
input [3:0]status;
output PCsrc,ALUsrc,WB,REG_rw,MEM_rw;
output [1;0]Imm_select;
output [3:0]ALUop;
assign opcode=[6:0]in;
always @ in begin
case (opcode)

	7'b 0110011: begin
	//add x5,x6,x7
	
	
	pcsrc=0;
	Alusrc=1;// imm different for I type 
	Immselect=10//from data path different for I type 
	Reg_rw=1;
	MEM_rw=0;
	WB=1; //write back to reg
	carry=0;
	
	
	
	ALUop = { inst[30],inst[14:12]}
	
	
	/*case(in[14:12])
	
	3'b000:begin
	end
	
	
	endcase*/
	
   end

	//R-type
	
	
	7'b 0010011:begin //I-type
	end
	
	7'b 1100011: begin//Branch
		
	Alusrc=0;//not imm different for I type 
	Immselect=//from data path different for I type 
	Reg_rw=1;
	MEM_rw=0;
	WB=1; //write back to reg
	carry=0;
	ALUop=4'b0000;
		case(status[2])
			1'b0:begin 
				PCsrc =0;
			end 
			1'b1:begin 
				PCsrc =1;
			end 
		endcase
	end
	
	
	7'b 0100011:begin //S-type
	
		
	pcsrc=0;
	Alusrc=0;//not imm different for I type 
	Immselect=//from data path different for I type 
	Reg_rw=1;
	MEM_rw=0;
	WB=1; //write back to reg
	carry=0;
	ALUop=4'b0000;
	
	end 
		endcase
	end 
endmodule	
