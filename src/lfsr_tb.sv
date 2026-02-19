//LFSR Testbench Module
//Author: Daniel Celnik
//Date: 12/01/2025
//Project 2

module lfsr_tb();

    logic clk, rst_n, start, stop;
    logic [1:0] mode;
    logic [10:0] lfsr_out;

    //Module Instantiation
    lfsr dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .stop(stop),
        .mode(mode),
        .lfsr_out(lfsr_out)
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

        //Run for a few cycles
        #100;

        //Change mode to 9-bit
        mode = 2'b01;
        #10;

        //Run for a few cycles
        #100;

        //Stop the LFSR
        stop = 1;
        #20;

        //Release stop and run again
        stop = 0;
        #100;

        //Change mode to 10-bit
        mode = 2'b10;
        #10;

        //Run for a few cycles
        #100;

        //Change mode to 11-bit
        mode = 2'b11;
        #10;

        //Run for a few cycles
        #100;

        //Finish simulation
        $finish;
    end

    //Monitor LFSR output
    initial begin
        $monitor("Time: %0t | Mode: %b | Start: %b | Stop: %b | LFSR Output: %b", $time, mode, start, stop, lfsr_out);
    end

    //Expected Results Comparision
    reg [10:0] mem [0:53]; // Memory to hold expected results

    initial begin
        $readmemb("expected_results.txt", mem);
    end

    //Counter to handle the indexing of expected results
    integer index;
    logic running;
    logic stopped;

    always_ff @(posedge clk) begin
        if (!rst_n) begin //initialization of index, did not function without this
            index <= 0;
            running <= 0;
        end else begin
            if (start) 
                running <= 1;
            if (stop) begin
                running <= 0;
                stopped <= 1;
            end if (!stop && stopped) begin
                stopped <= 0;
                running <= 1;
            end
            
            if (running) begin
                if (lfsr_out !== mem[index]) begin 
                    $display("Mismatch at time %0t: Expected %b, Got %b", $time, mem[index], lfsr_out);
                end else begin
                    $display("Match at time %0t: Value %b", $time, lfsr_out);
                end
            index <= index + 1;
            end
        end 
    end

endmodule