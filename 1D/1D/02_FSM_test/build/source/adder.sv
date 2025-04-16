/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module adder #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire [0:0] alufn,
        output reg [(SIZE)-1:0] out,
        output reg zero_flag,
        output reg overflow_flag,
        output reg negative_flag
    );
    logic [(SIZE)-1:0] modified_b;
    logic carry_in;
    localparam _MP_SIZE_247009821 = SIZE;
    logic [(_MP_SIZE_247009821)-1:0] M_rca_inst_a;
    logic [(_MP_SIZE_247009821)-1:0] M_rca_inst_b;
    logic M_rca_inst_carry_out;
    logic [(_MP_SIZE_247009821)-1:0] M_rca_inst_sum;
    
    adder_rca #(
        .SIZE(_MP_SIZE_247009821)
    ) rca_inst (
        .a(M_rca_inst_a),
        .b(M_rca_inst_b),
        .carry_out(M_rca_inst_carry_out),
        .sum(M_rca_inst_sum)
    );
    
    
    localparam _MP_SIZE_102721739 = SIZE;
    logic [(_MP_SIZE_102721739)-1:0] M_twos_comp_inst_b;
    logic [(_MP_SIZE_102721739)-1:0] M_twos_comp_inst_out;
    
    twos_complement #(
        .SIZE(_MP_SIZE_102721739)
    ) twos_comp_inst (
        .b(M_twos_comp_inst_b),
        .out(M_twos_comp_inst_out)
    );
    
    
    always @* begin
        M_twos_comp_inst_b = b;
        modified_b = alufn[1'h0] ? M_twos_comp_inst_out : b;
        M_rca_inst_a = a;
        M_rca_inst_b = modified_b;
        out = M_rca_inst_sum;
        negative_flag = M_rca_inst_sum[SIZE - 1'h1];
        zero_flag = ~(|M_rca_inst_sum);
        overflow_flag = (a[SIZE - 1'h1] == modified_b[SIZE - 1'h1]) & (M_rca_inst_sum[SIZE - 1'h1] != a[SIZE - 1'h1]);
    end
    
    
endmodule