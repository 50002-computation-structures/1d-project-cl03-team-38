/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module adder_rca #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        output reg carry_out,
        output reg [(SIZE)-1:0] sum
    );
    logic [31:0] R_61d36104_i;
    logic [31:0] RR_61d36104_i;
    logic [(SIZE + 1'h1)-1:0] carry;
    logic [(SIZE)-1:0] M_full_adder_a;
    logic [(SIZE)-1:0] M_full_adder_b;
    logic [(SIZE)-1:0] M_full_adder_cin;
    logic [(SIZE)-1:0] M_full_adder_s;
    logic [(SIZE)-1:0] M_full_adder_cout;
    
    genvar idx_0_1637059920;
    
    generate
        for (idx_0_1637059920 = 0; idx_0_1637059920 < SIZE; idx_0_1637059920 = idx_0_1637059920 + 1) begin: forLoop_idx_0_1637059920
            adder_fa full_adder (
                .a(M_full_adder_a[idx_0_1637059920]),
                .b(M_full_adder_b[idx_0_1637059920]),
                .cin(M_full_adder_cin[idx_0_1637059920]),
                .s(M_full_adder_s[idx_0_1637059920]),
                .cout(M_full_adder_cout[idx_0_1637059920])
            );
        end
    endgenerate
    
    
    always @* begin
        carry[1'h0] = 1'h0;
        for (RR_61d36104_i = 0; RR_61d36104_i < SIZE; RR_61d36104_i = RR_61d36104_i + 1) begin
      R_61d36104_i = (0) + RR_61d36104_i * (1);
            M_full_adder_a[R_61d36104_i] = a[R_61d36104_i];
            M_full_adder_b[R_61d36104_i] = b[R_61d36104_i];
            M_full_adder_cin[R_61d36104_i] = carry[R_61d36104_i];
            carry[R_61d36104_i + 1'h1] = M_full_adder_cout[R_61d36104_i];
            sum[R_61d36104_i] = M_full_adder_s[R_61d36104_i];
        end
        carry_out = carry[SIZE];
    end
    
    
endmodule