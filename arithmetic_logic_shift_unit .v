// Code your design here
module arithmetic_logic_shift_unit (
    input [3:0] A,        // 4-bit input A
    input [3:0] B,        // 4-bit input B
    input Cin,            // Carry-in input
    input [3:0] S,        // Control inputs S3, S2, S1, S0
    output reg [3:0] F,   // 4-bit output
    output reg Cout       // 1-bit output
);

    always @(*) begin
        // Default outputs
        F = 4'b0000;
        Cout = 1'b0;

        case (S)
            4'b0000: begin // F = A + B (Add)
                {Cout, F} = A + B;
            end
            4'b0001: begin // F = A + B + 1 (Add with carry)
                {Cout, F} = A + B + 1;
            end
            4'b0010: begin // F = A - B (Subtract with borrow)
                {Cout, F} = A - B; // Cout will be 1 if A < B
            end
            4'b0011: begin // F = A + B + 1 (Subtract)
                {Cout, F} = A + B + 1; // This might need clarification based on your requirement
            end
            4'b0100: begin // F = A (Transfer A)
                F = A;
                Cout = 1'b0; // No carry
            end
            4'b0101: begin // F = A + 1 (Increment A)
                {Cout, F} = A + 1;
            end
            4'b0110: begin // F = A - 1 (Decrement A)
                {Cout, F} = A - 1;
            end
            4'b0111: begin // F = B + 1 (Increment B)
                {Cout, F} = B + 1;
            end
            4'b1000: begin // F = A | B (Bitwise OR)
                F = A | B;
                Cout = 1'b0; // No carry
            end
            4'b1001: begin // F = A & B (Bitwise AND)
                F = A & B;
                Cout = 1'b0; // No carry
            end
            4'b1010: begin // F = ~A (Complement A)
                F = ~A;
                Cout = 1'b0; // No carry
            end
            4'b1011: begin // F = A ^ B (Bitwise XOR)
                F = A ^ B;
                Cout = 1'b0; // No carry
            end
            4'b1100: begin // F = Rotate left A
                F = {A[2:0], A[3]};
                Cout = 1'b0; // No carry
            end
            4'b1101: begin // F = Rotate right A
                F = {A[0], A[3:1]};
                Cout = 1'b0; // No carry
            end
            default: begin
                F = 4'b0000;
                Cout = 1'b0;
            end
        endcase
    end
endmodule
