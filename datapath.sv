module datapath(
    input clk, vsel, write, asel, bsel, loada, loadb, loadc, loads,
    input [1:0] shift, ALUop,
    input [2:0] readnum, writenum, 
    input [15:0] datapath_in,
    output reg Z_out, 
    output reg [15:0] datapath_out
);

    reg [15:0] data_A, data_B, data_C;
    wire Z;
    wire [15:0] Ain, Bin, shifter_out, ALU_out, data_in, data_out;

    regfile REGFILE(
        .data_in(data_in), 
        .writenum(writenum), 
        .write(write), 
        .readnum(readnum),
        .clk(clk),
        .data_out(data_out));

    shifter U1(
        .in(data_B),
        .shift(shift),
        .sout(shifter_out)
    );

    ALU U2(
        .Ain(Ain),
        .Bin(Bin),
        .ALUop(ALUop),
        .out(ALU_out),
        .Z(Z)
    );

    always_ff @(posedge clk) begin
        if (loada) data_A <= data_out;
        if (loadb) data_B <= data_out;
        if (loadc) {data_C, datapath_out} <= {ALU_out, ALU_out};
        if (loads) Z_out <= Z;
    end

    assign Ain = asel ? 16'b0 : data_A;
    assign Bin = bsel ? ({11'b0, datapath_in[4:0]}) : shifter_out;
    assign data_in = vsel ? datapath_in : data_C;

endmodule