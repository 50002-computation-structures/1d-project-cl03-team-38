/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module adder_fa (
        input wire a,
        input wire b,
        input wire cin,
        output reg s,
        output reg cout
    );
    always @* begin
        s = a ^ b ^ cin;
        cout = (a & b) | (cin & (a ^ b));
    end
    
    
endmodule