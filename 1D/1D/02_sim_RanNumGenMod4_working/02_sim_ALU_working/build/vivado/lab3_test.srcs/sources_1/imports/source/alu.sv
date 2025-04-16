/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alu #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire [5:0] alufn,
        output reg z,
        output reg v,
        output reg n,
        output reg [(SIZE)-1:0] out
    );
    logic zero_flag;
    logic overflow_flag;
    logic negative_flag;
    localparam _MP_SIZE_322608653 = SIZE;
    logic [(_MP_SIZE_322608653)-1:0] M_adder_inst_a;
    logic [(_MP_SIZE_322608653)-1:0] M_adder_inst_b;
    logic [0:0] M_adder_inst_alufn;
    logic [(_MP_SIZE_322608653)-1:0] M_adder_inst_out;
    logic M_adder_inst_zero_flag;
    logic M_adder_inst_overflow_flag;
    logic M_adder_inst_negative_flag;
    
    adder #(
        .SIZE(_MP_SIZE_322608653)
    ) adder_inst (
        .a(M_adder_inst_a),
        .b(M_adder_inst_b),
        .alufn(M_adder_inst_alufn),
        .out(M_adder_inst_out),
        .zero_flag(M_adder_inst_zero_flag),
        .overflow_flag(M_adder_inst_overflow_flag),
        .negative_flag(M_adder_inst_negative_flag)
    );
    
    
    localparam _MP_SIZE_247454071 = SIZE;
    logic [(_MP_SIZE_247454071)-1:0] M_multiplier_inst_a;
    logic [(_MP_SIZE_247454071)-1:0] M_multiplier_inst_b;
    logic [0:0] M_multiplier_inst_alufn;
    logic [(_MP_SIZE_247454071)-1:0] M_multiplier_inst_out;
    
    multiplier #(
        .SIZE(_MP_SIZE_247454071)
    ) multiplier_inst (
        .a(M_multiplier_inst_a),
        .b(M_multiplier_inst_b),
        .alufn(M_multiplier_inst_alufn),
        .out(M_multiplier_inst_out)
    );
    
    
    localparam _MP_SIZE_440916183 = SIZE;
    logic [(_MP_SIZE_440916183)-1:0] M_boolean_inst_a;
    logic [(_MP_SIZE_440916183)-1:0] M_boolean_inst_b;
    logic [2:0] M_boolean_inst_alufn;
    logic [(_MP_SIZE_440916183)-1:0] M_boolean_inst_out;
    
    boolean #(
        .SIZE(_MP_SIZE_440916183)
    ) boolean_inst (
        .a(M_boolean_inst_a),
        .b(M_boolean_inst_b),
        .alufn(M_boolean_inst_alufn),
        .out(M_boolean_inst_out)
    );
    
    
    localparam _MP_SIZE_2024010900 = SIZE;
    logic [(_MP_SIZE_2024010900)-1:0] M_shifter_inst_a;
    logic [(_MP_SIZE_2024010900)-1:0] M_shifter_inst_b;
    logic [1:0] M_shifter_inst_alufn;
    logic [(_MP_SIZE_2024010900)-1:0] M_shifter_inst_out;
    
    shifter #(
        .SIZE(_MP_SIZE_2024010900)
    ) shifter_inst (
        .a(M_shifter_inst_a),
        .b(M_shifter_inst_b),
        .alufn(M_shifter_inst_alufn),
        .out(M_shifter_inst_out)
    );
    
    
    localparam _MP_SIZE_643227845 = SIZE;
    logic M_compare_inst_z;
    logic M_compare_inst_v;
    logic M_compare_inst_n;
    logic [1:0] M_compare_inst_alufn;
    logic M_compare_inst_out;
    
    compare #(
        .SIZE(_MP_SIZE_643227845)
    ) compare_inst (
        .z(M_compare_inst_z),
        .v(M_compare_inst_v),
        .n(M_compare_inst_n),
        .alufn(M_compare_inst_alufn),
        .out(M_compare_inst_out)
    );
    
    
    always @* begin
        M_adder_inst_a = a;
        M_adder_inst_b = b;
        M_adder_inst_alufn = alufn[1'h0];
        zero_flag = M_adder_inst_zero_flag;
        overflow_flag = M_adder_inst_overflow_flag;
        negative_flag = M_adder_inst_negative_flag;
        z = M_adder_inst_zero_flag;
        v = M_adder_inst_overflow_flag;
        n = M_adder_inst_negative_flag;
        M_multiplier_inst_a = a;
        M_multiplier_inst_b = b;
        M_multiplier_inst_alufn = alufn[1'h1];
        M_boolean_inst_a = a;
        M_boolean_inst_b = b;
        M_boolean_inst_alufn = alufn[2'h3:1'h1];
        M_shifter_inst_a = a;
        M_shifter_inst_b = b;
        M_shifter_inst_alufn = alufn[2'h3:2'h2];
        M_compare_inst_z = zero_flag;
        M_compare_inst_v = overflow_flag;
        M_compare_inst_n = negative_flag;
        M_compare_inst_alufn = alufn[2'h2:1'h1];
        
        case (alufn[3'h5:3'h4])
            2'h0: begin
                out = M_adder_inst_out;
            end
            2'h1: begin
                out = M_boolean_inst_out;
            end
            default: begin
                out = 1'h0;
            end
        endcase
    end
    
    
endmodule