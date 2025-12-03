//LFSR Module
//Author: Daniel Celnik
//Date: 11/23/2025
//Project 2

module lfsr(
    input logic clk,
    input logic rst_n,
    input logic start,
    input logic stop,
    input logic [1:0] mode,
    output logic [10:0] lfsr_out
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

function automatic logic feedback(input logic [10:0] s, input int size_n);
    case (size_n)
        8: feedback = s[7] ^ s[5] ^ s[4] ^ s[3];
        9: feedback = s[8] ^ s[4];
        10: feedback = s[9] ^ s[6];
        11: feedback = s[10] ^ s[8];
        default: feedback = 1'b0;
    endcase
endfunction

//State Logic
always_comb begin
    next_state = 0; //keeps the lower bits valid
    case (size)
        8: next_state[7:0] = {state[6:0], feedback(state, size)};
        9: next_state[8:0] = {state[7:0], feedback(state, size)};
        10: next_state[9:0] = {state[8:0], feedback(state, size)};
        11: next_state[10:0] = {state[9:0], feedback(state, size)};
        default: next_state = state;
    endcase
end

// reset, start, stop logic
// start: initialize the LFSR with seed = 1 and start running
// stop:  hold the current state (pause)
// run:   when 1, state updates with next_state
logic run;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= '0;
        run   <= 1'b0;

    end else begin
        // start: seed and begin running (only when not stopping)
        if (start && !stop) begin
            run   <= 1'b1;
            state <= 11'b00000000001;  // seed = 1 (LSB)

        end else if (run && !stop) begin
            // normal running: update state when not stopped
            state <= next_state;

        end
        // else:
        //   - if stop==1: state holds, run unchanged
        //   - if run==0 and no start: still idle
    end
end



assign lfsr_out = state;

endmodule