module tb_adder8;
logic [7:0] a,b,sum;
logic carry_out;
logic clk;
logic rst_n;

adder8 dut (
 .a(a),
 .b(b),
 .sum(sum),
 .carry_out(carry_out)
);

initial begin
 clk = 0;
 forever #5 clk = ~clk;
end

initial begin
 $dumpfile("dump.vcd");
 $dumpvars(0, tb_adder8);
 a = 8'h00;
 b = 8'h00;
 rst_n = 0;
 #15;
 rst_n = 1;
 #10;
 $display("=== Bat Dau Kiem Thu ===");
 // case 1: Cong hai so khong tran
 a = 8'h10;
 b = 8'h15;
 #10;
 if (sum === 8'h25 && carry_out === 0) 
   $display("PASS: Case 1 (a=10, b=15) | sum = %h, carry_out = %b", sum, carry_out);
 else 
   $display("FAIL: Case 1 (a=10, b=15) | sum = %h, carry_out = %b, mong doi sum = 25, carry_out = 0", sum, carry_out);
 // case 2: Cong 2 so bang 0
 a = 8'h00;
 b = 8'h00;
 #10;
 if (sum === 8'h00 && carry_out === 0) 
   $display("PASS: Case 2 (a=00, b=00) | sum = %h, carry_out = %b", sum, carry_out);
 else 
   $display("FAIL: Case 2 (a=00, b=00) | sum = %h, carry_out = %b, mong doi sum = 00, carry_out = 0", sum, carry_out);
 // case 3: Cong 2 so tran
 a = 8'hF0;
 b = 8'h20;
 #10;
 if (sum === 8'h10 && carry_out === 1) 
   $display("PASS: Case 3 (a=F0, b=20) | sum = %h, carry_out = %b", sum, carry_out);
 else 
   $display("FAIL: Case 3 (a=F0, b=20) | sum = %h, carry_out = %b, mong doi sum = 10, carry_out = 1", sum, carry_out);
 // case 4: Cong voi so 0
 a = 8'h50;
 b = 8'h00;
 #10;
 if (sum === 8'h50 && carry_out === 0) 
   $display("PASS: Case 4 (a=50, b=00) | sum = %h, carry_out = %b", sum, carry_out);
 else 
   $display("FAIL: Case 4 (a=50, b=00) | sum = %h, carry_out = %b, mong doi sum = 50, carry_out = 0", sum, carry_out);
 // case 5: Cong gia tri toi da
 a = 8'h80;
 b = 8'h7F;
 #10;
 if (sum === 8'hFF && carry_out === 0) 
   $display("PASS: Case 5 (a=80, b=7F) | sum = %h, carry_out = %b", sum, carry_out);
 else 
   $display("FAIL: Case 5 (a=80, b=7F) | sum = %h, carry_out = %b, mong doi sum = FF, carry_out = 0", sum, carry_out);
 $display("=== KET THUC KIEM THU ===");
 $finish;
end
endmodule
