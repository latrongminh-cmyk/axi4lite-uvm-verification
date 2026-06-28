module tb_mux4to1;
    logic [7:0] a, b, c, d;
    logic [1:0] sel;
    logic clk, rst_n;
    logic [7:0] out;

    mux4to1 dut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux4to1);
        
        a = 8'hAA;
        b = 8'hBB;
        c = 8'hCC;
        d = 8'hDD;
        sel = 2'b00;
        rst_n = 0;
        
        #15;
        rst_n = 1;
        #10;
        $display(""); // Đã thêm ngoặc kép vào đây để in dòng trống an toàn hơn

        // case 1: sel = 00
        sel = 2'b00;
        #10;
        if (out === 8'hAA) $display("PASS: Test case 1 (sel=00) | out = %h", out);
        else $display("FAIL: Test case 1 (sel=00) | out = %h, mong doi = AA", out);

        // test case 2: sel = 01
        sel = 2'b01;
        #10;
        if (out === 8'hBB) $display("PASS: Test case 2 (sel=01) | out = %h", out);
        else $display("FAIL: Test case 2 (sel=01) | out = %h, mong doi = BB", out);

        // test case 3: sel = 10
        sel = 2'b10;
        #10;
        if (out === 8'hCC) $display("PASS: Test case 3 (sel=10) | out = %h", out);
        else $display("FAIL: Test case 3 (sel=10) | out = %h, mong doi = CC", out);

        // test case 4: sel = 11
        sel = 2'b11;
        #10;
        if (out === 8'hDD) $display("PASS: Test case 4 (sel=11) | out = %h", out);
        else $display("FAIL: Test case 4 (sel=11) | out = %h, mong doi = DD", out);

        $display("Ket Thuc Kiem Thu");
        #20;
        $finish;
    end
endmodule
