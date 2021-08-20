`timescale 1ns/1ns

module mul_tb;
	reg clk;
	initial clk = 0;
	always #5 clk=~clk;
	
	reg [31:0] rnd1mem [0:999];
	reg [31:0] rnd2mem [0:999];
	reg [10:0] addr;
	wire [31:0] data_o;
	wire [31:0] a,b;
	//mul m1(clk,rnd1mem[addr],data);
	reg flag;

	
	initial begin
       $readmemh("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/rnd1hex.txt",rnd1mem);
		 $readmemh("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/rnd2hex.txt",rnd2mem);
       		addr = 0;
		 flag = 0;
	end
	integer file1;
	initial begin
	file1 = $fopen("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/mul_result.txt","w");
	end
	always @(posedge clk ) begin
		$fwrite(file1,"%h\n",data_o);
		if (addr >= 999) begin
		$fclose(file1);
		$stop;
		end
		else  begin addr = addr + 1;
		
		end
	end
	
	initial
        begin            
            $dumpfile("mul_tb.vcd");
            $dumpvars(0,mul_tb);
        end

	assign a =rnd1mem[addr];
	assign b =rnd2mem[addr];
	mul m1(.clk(clk),.rst(1'b1),.flout_a(a),.flout_b(b),.flout_c(data_o),.round_cfg(0),.en(1));
endmodule 
	
	