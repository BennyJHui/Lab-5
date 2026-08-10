module ALU_tb();

    reg [15:0] Ain_tb, Bin_tb;
    reg [1:0] ALUop_tb;
    wire [15:0] out_tb;
    wire Z_tb;

    ALU DUT(Ain_tb, Bin_tb, ALUop_tb, out_tb, Z_tb);

    initial begin
        // Test add
        Ain_tb = 16'b0000_0000_0000_1101; // 13
        Bin_tb = 16'b0000_0000_0000_1011; // 11
        ALUop_tb = 2'b00;
        #10;
        // Test Sub
        Ain_tb = 16'b0000_0000_0000_1101; // 13
        Bin_tb = 16'b0000_0000_0000_1011; // 11
        ALUop_tb = 2'b01;
        #10;
        // Test &
        Ain_tb = 16'b0000_0000_0000_1101; // 13
        Bin_tb = 16'b0000_0000_0000_1011; // 11
        ALUop_tb = 2'b10;
        #10;
        // Test not
        Ain_tb = 16'b0000_0000_0000_1101; // 13
        Bin_tb = 16'b0000_0000_0000_1011; // 11
        ALUop_tb = 2'b11;
        #10;
        // Test Sub negative
        Bin_tb = 16'b0000_0000_0000_1101; // 13
        Ain_tb = 16'b0000_0000_0000_1011; // 11
        ALUop_tb = 2'b01;
        #10;
        // Test Z flag
        Ain_tb = 16'b0000_0000_0000_1011; // 11
        Bin_tb = 16'b0000_0000_0000_1011; // 11
        ALUop_tb = 2'b01;
        #10;
    end

endmodule