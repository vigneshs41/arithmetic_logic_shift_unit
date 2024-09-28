// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_arithmetic_logic_shift_unit;

    reg [3:0] A;        // 4-bit input A
    reg [3:0] B;        // 4-bit input B
    reg Cin;            // Carry-in input
    reg [3:0] S;        // Control signals S3, S2, S1, S0
    wire [3:0] F;       // 4-bit output
    wire Cout;          // 1-bit output

    // Instantiate the unit under test (UUT)
    arithmetic_logic_shift_unit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .F(F),
        .Cout(Cout)
    );

    // Test procedure
    initial begin
        // Display header
        $display("Time\tA\tB\tCin\tS\tF\tCout");
        
        // Apply test cases
        A = 4'b0001; B = 4'b0010; Cin = 0; S = 4'b0000; #10; // F = A + B
        A = 4'b0001; B = 4'b0010; Cin = 0; S = 4'b0001; #10; // F = A + B + 1
        A = 4'b0010; B = 4'b0001; Cin = 0; S = 4'b0010; #10; // F = A - B
        A = 4'b0001; B = 4'b0010; Cin = 0; S = 4'b0011; #10; // F = A + B + 1
        A = 4'b0100; B = 4'b0000; Cin = 0; S = 4'b0100; #10; // F = A
        A = 4'b0001; B = 4'b0000; Cin = 0; S = 4'b0101; #10; // F = A + 1
        A = 4'b0001; B = 4'b0000; Cin = 0; S = 4'b0110; #10; // F = A - 1
        A = 4'b0001; B = 4'b0001; Cin = 0; S = 4'b0111; #10; // F = B + 1
        A = 4'b1100; B = 4'b0011; Cin = 0; S = 4'b1000; #10; // F = A | B
        A = 4'b1100; B = 4'b0011; Cin = 0; S = 4'b1001; #10; // F = A & B
        A = 4'b1100; B = 4'b0000; Cin = 0; S = 4'b1010; #10; // F = ~A
        A = 4'b1010; B = 4'b0101; Cin = 0; S = 4'b1011; #10; // F = A ^ B
        A = 4'b1101; B = 4'b0000; Cin = 0; S = 4'b1100; #10; // F = Rotate left A
        A = 4'b1101; B = 4'b0000; Cin = 0; S = 4'b1101; #10; // F = Rotate right A

        // End of simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, Cin, S, F, Cout);
    end

endmodule
