//Counter Module
//Author: Daniel Celnik
//Date: 12/01/2025
//Project 2

module counter(
    input logic clk,
    input logic rst_n,
    input logic start,
    input logic stop,
    input logic [1:0] mode,
    output logic [10:0] counter_out
);

//Size select
logic [3:0] size;
always_comb begin
    case (mode)
        2'b00: size = 8;
        2'b01: size = 9;
        2'b10: size = 10;
        2'b11: size = 11;
        default: size = 0; //never happens
    endcase
end

//Feedback calculation
logic [10:0] state, next_state;

//State Logic, simply adds 1 based on size
always_comb begin
    next_state = '0;
    unique case (size)
        8:  next_state[7:0]   = state[7:0]   + 8'd1;
        9:  next_state[8:0]   = state[8:0]   + 9'd1;
        10: next_state[9:0]   = state[9:0]   + 10'd1;
        11: next_state[10:0]  = state[10:0]  + 11'd1;
        default: next_state   = state;
    endcase
end


// reset, start, stop logic
// start: initialize the counter and start running
// stop:  hold the current state (pause)
// run:   when 1, state updates with next_state
logic run;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= '0;
        run   <= 1'b0;

    end else begin
        if (start && !stop) begin
            run   <= 1'b1;
            state <= 11'b00000000000; 

        end else if (run && !stop) begin
            // normal running: update state when not stopped
            state <= next_state;

        end
        // else:
        //   - if stop==1: state holds, run unchanged
        //   - if run==0 and no start: still idle
    end
end

assign counter_out = state;

endmodule