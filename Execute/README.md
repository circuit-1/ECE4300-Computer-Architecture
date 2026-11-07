# Coding Assignment 3 - Execute

<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was verified.
-->

## Design Scope and Assumptions

- **In scope:** Implement Execute stage of the MIPS, including ALU operations, ALU Control, adder, multiplexers, and ex/mem pipeline. 
- **Out of scope:** Other stages, such as Instruction Fetch(`IF`), Instruction Decode(`ID`), Data Memory(`MEM`), and Write-Back(`WB`) stages.
- **Assumptions:** It is assumed that preceding pipeline registers (`ID`/`EX`) give a clean and stable 32-bit operaNDS(`ReadData1`, `ReadData2`, `SignExtend`, `NPC`).  Control lines (`ALUOp`, `ALUSrc`, `RegDst`, `WB`, `Mem`) are also assumed to be correctly generated and synchronized from main control unit. The clock also acts as a pure square wave with no defects. 
- **Limitations:** This current arrangement has no exception handling, like overflow in ALU, arithmetic traps, or error flags beyond the 1-bit `0` used for branching. Execution logic is also limited to a specified subset(`lw`, `sw`, `beq`, `add`, `sub`, `and`, `or`, `slt`).

## Requirements

| Requirement | Description | Verification Method |
|---|---|---|
| REQ-01 | The design shall decode a 6-bit function field `Instr[5:0]` alongside a 2-bit `ALUOp` signal to generate the correct 3-bit ALU control input. | `alu_control_tb.v` and `Waveforms/alu_top.png` |
| REQ-02 | The design shall provide a 32-bit multiplexer controlled by `ALUSrc` to select the second operand for the ALU: choosing `ReadData2 `(for R-type instructions) or `SignExtend` (for load, store, and immediate/branch instructions). | `top_mux_tb.v` and `Waveforms/top_mux.png` |
| REQ-03 | The design shall include an adder that combines the Next Program Counter `NPC` value with the sign-extended offset `SignExtend` to produce the branch target address `Add_Result`. | `adder_tb.v`, and `Waveforms/adder.png` |
| REQ-04 | The design shall synchronously latch all control signals (`WB`, `Mem`) and data outputs (`Add_Result`, `Zero`, `ALU_Result`, `ReadData2_ex_mem`, `FiveBitMuxout`) on the rising edge of the system clock (`CLK`) to maintain proper pipeline staging. | `ex_mem_tb.v` and `Waveforms/ex_mem.png` |
| REQ-05 | The design shall take two 32-bit input operands (one from `ReadData1`, the other selected via the `ALUSrc` multiplexer) and execute the operation specified by the 3-bit ALU control lines. | `alu_tb.v` and `Waveforms/alu.png`|
| REQ-06 | The design shall provide a 5-bit 2-to-1 multiplexer controlled by the `RegDst` signal and shall route `Instr_2016` (`rt`, bits 20–16) when `RegDst` is `0` or `Instr_1511` (`rd`, bits 15–11) when `RegDst` is `1`, outputting the destination as `FiveBitMuxout`. | `bottom_mux_tb.v` and `Waveforms/bottom_mux.png` |


## Architecture

### Timing or Behavioral Summary

Save diagrams in the repository's `images/` folder. Use relative paths so they display on GitHub.

![Timing Diagram](images/[timing-diagram-filename].png)

## Implementation

### Source Code

| File | Description |
|---|---|
| [`execute.v`](LINK_TO_IMPLEMENTATION_CODE) | Top-level Execute-stage integration module.|
| [`adder.v`](LINK_TO_COMPONENT_CODE) | 32-bit adder for branch-target address calculation.|
| [`top_mux.v`](LINK_TO_TESTBENCH_CODE) | Multiplexer that selects the destination register based on RegDst.|
| [`bottom_muc.v`](LINK_TO_TESTBENCH_CODE) |Multiplexer that selects the ALU's second operand based on ALUSrc.|
| [`alu.v`](LINK_TO_TESTBENCH_CODE) | 32-bit ALU supporting ADD, SUB, AND, OR, and SLT.|
| [`alu_control.v`](LINK_TO_TESTBENCH_CODE) | Generates ALU operation signals from ALUOp and function code.|
| [`ex_mem.v`](LINK_TO_TESTBENCH_CODE) | Rising-edge EX/MEM pipeline register storing results and control signals.|

### Implementation Notes

- The `alu_control` module decodes the 2-bit `alu_op` and the lower 6 bits of the sign-extended immediate (`s_extend[5:0]`) using nested case statements, cleanly separating instruction type interpretation from execution while implementing a safe fallback state (`ALUx`/`3'b011`) for unknown instructions.
- Standardized width conventions are maintained across all modules: 32-bit data paths for operants and addresses, 5-bit busses for register specifiers(`instr_2016` and `instr_1511`), and structured signal bundling into the synchronous `ex_mem` pipeline register on the rising edge of `clk`.
- Pipeline data forwarding paths and hazard-detection stall units have been excluded to keep the EX stage scope focused on only combinational execution, address calculation, and pipeline register handoff.
## Verification

### Verification Strategy

The design is verified using **Simulation**.

Verification covers:

- Validated core instruction classes across 50 ns stimulus intervals in `execute_tb`, successfully executing R-type operations (`add` with function `6'h20`, `sub` with `6'h22`, `and` with `6'h24`, `or` with `6'h25`, and `slt` with `6'h2A`), driving correct functional selection lines into the ALU and routing register fields via `instr_2016` and `instr_1511`.
- Tested sign-extended immediate values (`s_extend_tb`) through `TOP_MUX_TOP` and verified that the Branch Target Adder (`ADDER_TOP`) correctly computes PC-relative branch addresses by combining `npc_tb` and `s_extend_tb`.
- Monitored the initial 10 ns clock cycles and positive clock edges (`posedge clk_tb`) to ensure all pipelined latch outputs (`ctlwb_out_latch`, `ctlm_out_latch`, `adder_result_latch`, `alu_result_latch`, `zero_latch`) initialize and propagate without timing skew.
- Verified that random instruction inputs and unhandled function codes safely resolve through the ALU control decoder without corrupting adjacent datapath signals.

### Testbench and Waveform

Waveform screenshots are stored in the repository’s `Waveforms/` folder.


![Testbench or waveform](Waveforms/execute.png)

The testbench source is available [*here*](Testbench/execute_tb.v). Unit testbenches are available for the [adder](Testbench/adder_tb.v), [alu_control](Testbench/alu_control_tb.v), [alu](Testbench/alu_tb.v), [bottom_mux](Testbench/bottom_mux_tb.v), [ex_mem](Testbench/ex_mem.v), [top_mux](Testbench/top_mux_tb.v).

### Results

| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [ALU Control] | [ALUOp and function codes generate the correct ALU operation signals.] | [Waveform shows the expected control signals for ADD, SUB, AND, OR, and SLT.] | Pass |
| TC-02 — [ALU Operations] | [ALU performs ADD, SUB, AND, OR, and SLT correctly using 32-bit inputs.] | [Waveform shows the expected arithmetic and logical results.] | Pass |
| TC-03 — [Multiplexer ] | [ALUSrc selects the correct ALU operand, and RegDst selects the destination register.] | [Waveform shows the correct outputs based on the selection signals.] | Pass |
| TC-04 — [Adder] | [The adder calculates the correct branch-target address from its two inputs.] | [Waveform shows the expected 32-bit addition results.] | Pass |
| TC-05 — [EX/MEM] | [Inputs are captured and stored on each rising clock edge.] | [Waveform shows the ALU result, zero flag, destination register, and control signals being captured.] | Pass |
| TC-06 — [Integrated Execute] | [The Execute stage produces the correct ALU results, branch addresses, and EX/MEM outputs.] | [Waveform shows the expected results for the tested operations and control inputs.] | Pass |

## Reproduction Instructions

### Tools and Versions

- **Simulator / synthesis tool:** Vivado
- **Language / standard:** Verilog HDL
- **Operating system:** macOS, Windows, Linux, or other
- **Additional dependencies:** No external libraries are required

### Build and Run

```bash
Run Vivado Behavioral simulation using execute_tb.v as simulation source
```

Expected output:

```text
The testbench verifies ALU operations, branch address calculations, and EX/MEM register behavior. The results are checked using Vivado simulation waveforms. 
```

## Repository Organization

```text
.
├── README.md
├── Testbench
│   ├── adder_tb.v
│   ├── alu_control_tb.v
│   ├── alu_tb.v
│   ├── bottom_mux_tb.v
│   ├── ex_mem_tb.v
│   ├── execute_tb.v
│   ├── top_mux_tb.v
├── Waveforms
│   ├── adder_tb.png
│   ├── alu.png
│   ├── alu_top.png
│   ├── bottom_mux.png
│   ├── ex_mem.png
│   ├── execute.png
│   ├── top_mux.png
├── adder.v
├── alu.v
├── alu_control.v
├── bottom_mux.v
├── ex_mem.v
├── top_mux.v
├── execute.v
├── Testbench
```
