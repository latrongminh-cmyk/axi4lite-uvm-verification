module adder8 (
  input logic [7:0] a,b,
  output logic [7:0] sum,
  output logic carry_out
);
logic [8:0] result;  
always_comb begin
  result    = {1'b0, a} + {1'b0, b};  
  sum       = result[7:0];              
  carry_out = result[8];                
end
endmodule
