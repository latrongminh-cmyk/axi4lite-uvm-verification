`timescale 1ns/1ps
module tb_and_gate;
reg a,b;
wire y;
integer i;  
and_gate dut(.a(a),.b(b),.y(y));
initial begin
    $dumpfile("wave.vcd");
        $dumpvars(0, tb_and_gate);
    for (i=0;i<4;i++) begin
    {a,b}=i;
    #10; 
    end
end
endmodule 