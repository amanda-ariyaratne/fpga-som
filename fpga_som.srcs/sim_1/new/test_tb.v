`timescale 1ns / 1ps

module test_tb(
    );
    
    reg clk = 0;
    reg reset = 0;
    wire [8:0] prediction;
    wire completed;
    
    test uut(
        .clk(clk),
        .prediction(prediction),
        .completed(completed)
    );
    
    reg [32:0] i=0;
    initial 
    begin
        for (i=0;i<100_000; i=i+1)
        begin
            clk = ~clk;
            #10;
            if (completed)
                $finish;
        end
    end
endmodule


`timescale 1ns / 1ps

//module fpa_euclidean_distance
//#(
//    parameter DIM=4,
//    parameter DIGIT_DIM=32
//)
//(
//    input wire clk,
//    input wire en,
//    input wire reset,
//    input wire [DIGIT_DIM*DIM-1:0] weight,
//    input wire [DIGIT_DIM*DIM-1:0] trainX,
//    output wire [DIGIT_DIM-1:0] num_out,
//    output wire is_done
//);

//reg done=0;
//reg init=1;
                   
//reg add_all_init=0;

//reg dist_sqr_en=0;
//reg dist_sqr_reset=0;
//wire [DIGIT_DIM*DIM-1:0] dist_sqr_in_1;
//wire [DIGIT_DIM*DIM-1:0] dist_sqr_in_2;
//wire [DIGIT_DIM*DIM-1:0] dist_sqr_out;

//wire [DIGIT_DIM*DIM-1:0] dist_sqr_done;

//wire [DIM-1:0] dist_sqr_is_done;

//genvar k;
//generate
//    for (k=1; k<=DIM; k=k+1) begin
//        assign dist_sqr_is_done[k-1] = dist_sqr_done[DIGIT_DIM*k-1];
//    end
//endgenerate

//assign dist_sqr_in_1 = weight;
//assign dist_sqr_in_2 = trainX;

//genvar i;
//generate
//    for (i=DIGIT_DIM; i<=DIM*DIGIT_DIM; i=i+DIGIT_DIM) begin
//        fpa_distance dist_sqr(
//            .clk(clk),
//            .en(dist_sqr_en),
//            .reset(dist_sqr_reset),
//            .num1(dist_sqr_in_1[i-1 -:DIGIT_DIM]),
//            .num2(dist_sqr_in_2[i-1 -:DIGIT_DIM]),
//            .num_out(dist_sqr_out[i-1 -:DIGIT_DIM]),
//            .is_done(dist_sqr_done[i-1])
//        );
//    end
//endgenerate

//always @(posedge clk) begin 
//    if (en && init) begin
//        dist_sqr_en=1;
//        dist_sqr_reset=0;
//        init=0;
//    end
//end

//always @(posedge clk) begin 
//    if (dist_sqr_is_done == {(DIM){1'b1}}) begin
//        dist_sqr_en=0;
//        dist_sqr_reset=1;
//        add_all_init=1;
//    end
//end

//reg add_all_en=0;
//reg add_all_reset=0;
//reg [DIGIT_DIM-1:0] add_all_in_1=0;
//reg [DIGIT_DIM-1:0] add_all_in_2;
//wire [DIGIT_DIM-1:0] add_all_out;
//wire add_all_done=0;

//fpa_adder add_all(
//    .clk(clk),
//    .en(add_all_en),
//    .reset(add_all_reset),
//    .num1(add_all_in_1),
//    .num2(add_all_in_2),
//    .num_out(add_all_out),
//    .is_done(add_all_done)
//);

//integer signed j=DIGIT_DIM;
//always @(posedge clk) begin 
//    if (add_all_init) begin
        
//        add_all_in_2 = dist_sqr_out[j-1 -:DIGIT_DIM];
//        add_all_en = 1;
//        add_all_reset = 0;
//        $display("DRAMA", add_all_done);
//        if (add_all_done) begin
//            $display("begin done");
//            add_all_en = 0;
//            add_all_in_1 = add_all_out;
//            j = j + DIGIT_DIM;
//            add_all_reset = 1;
//            dist_sqr_reset = 1;
//        end
        
//        if (j > DIGIT_DIM*DIM) begin
//            add_all_init = 0;
//            done = 1;
//        end
//    end
//end
    
//always @(posedge reset) begin
//    done=0;
//    init=1;
//end

//assign num_out = add_all_out;
//assign is_done = done;

//endmodule
