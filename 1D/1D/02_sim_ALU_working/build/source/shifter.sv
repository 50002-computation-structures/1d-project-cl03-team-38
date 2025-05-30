/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module shifter #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire [1:0] alufn,
        output reg [(SIZE)-1:0] out
    );
    logic [4:0] shift_amt = b[3'h5:1'h0];
    localparam _MP_SIZE_1099122134 = SIZE;
    logic [(_MP_SIZE_1099122134)-1:0] M_left_shift_a;
    logic [4:0] M_left_shift_shift;
    logic [(_MP_SIZE_1099122134)-1:0] M_left_shift_result;
    
    shifter_BitL #(
        .SIZE(_MP_SIZE_1099122134)
    ) left_shift (
        .a(M_left_shift_a),
        .shift(M_left_shift_shift),
        .result(M_left_shift_result)
    );
    
    
    localparam _MP_SIZE_1977874017 = SIZE;
    logic [(_MP_SIZE_1977874017)-1:0] M_right_shift_a;
    logic [4:0] M_right_shift_shift;
    logic [(_MP_SIZE_1977874017)-1:0] M_right_shift_result;
    
    shifter_BitR #(
        .SIZE(_MP_SIZE_1977874017)
    ) right_shift (
        .a(M_right_shift_a),
        .shift(M_right_shift_shift),
        .result(M_right_shift_result)
    );
    
    
    localparam _MP_SIZE_379923764 = SIZE;
    logic [(_MP_SIZE_379923764)-1:0] M_arith_right_shift_a;
    logic [4:0] M_arith_right_shift_shift;
    logic [(_MP_SIZE_379923764)-1:0] M_arith_right_shift_result;
    
    shifter_ArithBitR #(
        .SIZE(_MP_SIZE_379923764)
    ) arith_right_shift (
        .a(M_arith_right_shift_a),
        .shift(M_arith_right_shift_shift),
        .result(M_arith_right_shift_result)
    );
    
    
    always @* begin
        M_left_shift_a = a;
        M_left_shift_shift = shift_amt;
        M_right_shift_a = a;
        M_right_shift_shift = shift_amt;
        M_arith_right_shift_a = a;
        M_arith_right_shift_shift = shift_amt;
        
        case (alufn)
            2'h0: begin
                out = M_left_shift_result;
            end
            2'h1: begin
                out = M_right_shift_result;
            end
            2'h3: begin
                out = M_arith_right_shift_result;
            end
            default: begin
                out = 4'h0;
            end
        endcase
    end
    
    
endmodule