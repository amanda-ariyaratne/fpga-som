`timescale 1ns / 1ps

module som_sim_tb();
    reg clk = 0;
    reg reset = 0;
    wire [8:0] prediction;
    
    som uut(
        .clk(clk),
        .prediction(prediction)
    );
    
    reg [32:0] i=0;
    initial 
    begin
        for (i=0;i<100000;i=i+1)
        begin
            clk = ~clk;
            #5;
        end
    end

endmodule
