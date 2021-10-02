`timescale 1ns / 1ps

module gsom_grow_node_in_middle
#(
    DIGIT_DIM=32,
    LOG2_NODE_COUNT=7
)
(
    input clk,
    input reset,
    input en,
    input [DIGIT_DIM-1:0] winner,
    input [DIGIT_DIM-1:0] node_next,
    output [DIGIT_DIM-1:0] weight,
    output is_done
);

reg done = 0;
reg init = 1;
reg [DIGIT_DIM-1:0] out;
reg add_en = 0;
reg add_reset = 0;
wire [DIGIT_DIM-1:0] add_out;
wire add_is_done; 

fpa_adder adder(
    .clk(clk),
    .en(add_en),
    .reset(add_reset),
    .num1(winner),
    .num2(node_next),
    .num_out(add_out),
    .is_done(add_is_done)
);

always @(posedge clk) begin
    if (en && init) begin
        add_en=1;
        add_reset=0;
        init=0;
    end
    if (add_is_done) begin
        out = add_out;
        out[30:23] = add_out[30:23]-1;
        done=1;
    end
end


always @(posedge reset) begin
    done = 0;
    init = 1;
end

assign is_done = done;
assign weight = out;

endmodule