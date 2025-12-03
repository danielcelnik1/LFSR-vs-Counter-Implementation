//Counter Testbench Module
//Author: Daniel Celnik
//Date: 12/01/2025
//Project 2

module counter_tb();

    logic clk, rst_n, start, stop;
    logic [1:0] mode;
    logic [10:0] counter_out;

    //Module Instantiation
    counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .stop(stop),
        .mode(mode),
        .counter_out(counter_out)
    );

    //Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //Test Sequence
    initial begin
        //Initialize signals
        rst_n = 0;
        start = 0;
        stop = 0;
        mode = 2'b00; //8-bit mode

        //Reset the DUT
        #10;
        rst_n = 1;

        //Start LFSR
        #10;
        start = 1;
        #10;
        start = 0;

        //Run for many cycles
        #100000;

        //Change mode to 9-bit
        mode = 2'b01;
        #10;

        //Run for more cycles
        #100000;

        //Stop the LFSR
        stop = 1;
        #20;

        //Release stop and run again
        stop = 0;
        #100;

        //Change mode to 10-bit
        mode = 2'b10;
        #10;

        //Run for more cycles
        #100000;

        //Change mode to 11-bit
        mode = 2'b11;
        #10;

        //Run for more cycles
        #100000;

        //Finish simulation
        $finish;
    end

    //Monitor output
    initial begin
        $monitor("Time: %0t | Mode: %b | Start: %b | Stop: %b | Counter Output: %b", $time, mode, start, stop, counter_out);
    end

endmodule