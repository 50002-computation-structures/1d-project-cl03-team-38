/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module twos_complement #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] b,
        output reg [(SIZE)-1:0] out
    );
    logic [31:0] R_5ea611f4_i;
    logic [31:0] RR_5ea611f4_i;
    logic carry;
    logic [(SIZE)-1:0] b_mod;
    always @* begin
        carry = 1'h1;
        b_mod = ~b;
        for (RR_5ea611f4_i = 0; RR_5ea611f4_i < SIZE; RR_5ea611f4_i = RR_5ea611f4_i + 1) begin
      R_5ea611f4_i = (0) + RR_5ea611f4_i * (1);
            if (b_mod[R_5ea611f4_i] == 1'h0 && carry == 1'h1) begin
                b_mod[R_5ea611f4_i] = 1'h1;
                carry = 1'h0;
            end else begin
                if (b_mod[R_5ea611f4_i] == 1'h1 && carry == 1'h1) begin
                    b_mod[R_5ea611f4_i] = 1'h0;
                end
            end
        end
        out = b_mod;
    end
    
    
endmodule