# Project Introduction: LFSR vs. Binary Counter Implementations

This project explores the design, verification, and synthesis of two digital hardware modules:
1. A **Linear Feedback Shift Register (LFSR)** parameterized for 8–11 bits
2. A **Binary Counter** with matching output‑width configurability.

Both designs share a common interface and control mechanisms, enabling direct comparison of functionality, resource utilization, and timing performance.

---

## Objectives
- Implement a multi‑mode LFSR with start, stop, and asynchronous reset controls.
- Develop a functionally equivalent multi‑width binary counter.
- Create systematic testbenches for each module:
  - **LFSR:** uses `$readmemb` to load expected output vectors and checks for mismatches.
  - **Counter:** performs exhaustive iteration to ensure wrap‑around and bit‑width correctness.
- Analyze post‑synthesis **area** and **timing** results for each design.
- Gain experience writing verification scoreboards, managing control logic, and interpreting synthesis metrics.

---

## Design Summary
### LFSR Module
- Supports 8, 9, 10, and 11‑bit output lengths via a `mode` input.
- Begins operation with a fixed seed (`1'b1`) when `start` is asserted.
- Uses an internal `run` register to track active state.
- Tap logic is selected through case statements and XOR feedback networks.
- Includes asynchronous active‑low reset and halting via a `stop` input.

### Binary Counter Module
- Shares the same `mode`, `start`, `stop`, and reset behavior as the LFSR.
- Next‑state logic increments the selected bit‑width register.
- No expected‑value file required; verification is based on detecting full‑range coverage.

---

## Verification Approach
### LFSR Testbench
- Loads expected output sequences using `$readmemb`.
- Compares DUT output to memory contents every cycle.
- Reports mismatches with index and value details.

### Counter Testbench
- Iterates thousands of cycles per mode.
- Ensures counters reach maximum values and wrap as expected.
- Confirms correct utilization of all bits for each mode.

---

## Synthesis Insights
### Area Results
- **LFSR area:** ~754
- **Counter area:** ~1441

LFSR logic is significantly smaller due to XOR‑based feedback, while the counter requires adders and wider register structures.

### Timing Results
- **LFSR slack:** −4.04
- **Counter slack:** −0.9

LFSR timing is impacted by deeper combinational chains (MUX → tap logic → XOR feedback). The counter's adder‑based path is simpler but still violates timing constraints.

---

## Key Takeaways
- LFSRs offer area‑efficient pseudo‑random sequence generation.
- Conditional‑width designs introduce additional muxing and logic depth.
- Scoreboard‑based verification is essential for robust functional validation.
- Understanding synthesis‑driven trade‑offs is critical for ASIC and FPGA design work.

---

This project builds practical skills in RTL design, combinational/sequential logic trade‑offs, verification methodology, and synthesis interpretation—all foundational competencies for digital ASIC development.

