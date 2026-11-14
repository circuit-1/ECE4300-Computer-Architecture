# Lab 4 — Memory and Writebnack
<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was
verified.
-->
## Design Scope and Assumptions
- **In scope:** Implementation and RTL verification of the 32-bit MIPS Memory (MEM) stage, the `MEM/WB` pipeline latch, and the Write-Back (WB) multiplexer (`memory.v`), including branch decision logic (`and.v`), synchronous data memory read/write operations (`data_memory.v`), and write-back data selection (`mux.v`).
- **Out of scope:** Instruction Fetch (IF), Instruction Decode (ID), Execute (EX) ALU/adder logic, hazard detection, and forwarding units.
- **Assumptions:** 32-bit word-aligned memory addressing (`alu_result` as memory address), synchronous positive-edge triggered operations driven by a `10 ns` period (`100 MHz`) clock (`#5` half-period in `memory_tb`), preloaded memory contents from `data.mem` / `data.txt`, and 5-bit register destination addressing (`five_bit_muxout`).
- **Limitations:** Standalone stage verification using directed stimulus vectors in `memory_tb` and `And_tb` rather than full multi-stage instruction execution; Data Memory depth is bounded to the initialized simulation memory file.
## Requirements
| Requirement | Description | Verification Method |
|---|---|---|
| REQ-01 | [The design shall ...] | [Test case, waveform, calculation, or
inspection] |
| REQ-02 | [The design shall ...] | [Test case, waveform, calculation, or
inspection] |
| REQ-03 | [The design shall ...] | [Test case, waveform, calculation, or
inspection] |
## Architecture
### Timing or Behavioral Summary
![Timing Diagram](Waveforms/memory_tb.png)
## Implementation
### Source Code
| File | Description |
|---|---|
| [`memory.v`](memory.v) | Top-level structural module connecting Data Memory, Branch `AND` gate, `MEM/WB` latch, and WB Mux |
| [`data_memory.v`](data_memory.v) | Synchronous 32-bit Data Memory module (`memread`, `memwrite`) initialized via memory data file |
| [`mem_wb_latch.v`](mem_wb_latch.v) | `MEM/WB` pipeline register latching control signals, memory data, ALU result, and destination register |
| [`and.v`](and.v) | Combinational `AND` gate generating `PCSrc` from `membranch` and `zero` |
| [`mux.v`](mux.v) | 32-bit 2-to-1 Write-Back multiplexer controlled by `MemtoReg` |
| [`data.mem`](data.mem) / [`data.txt`](data.txt) | Initial memory contents loaded into Data Memory during simulation |
| [`Testbench/memory_tb.v`](Testbench/memory_tb.v) | Integrated stage testbench (`memoryTB`) verifying memory read, write, read-back, and branch logic |
| [`Testbench/And_tb.v`](Testbench/And_tb.v) | Standalone unit testbench (`And_tb`) verifying all 4 input combinations of the branch `AND` gate[cite: 2, 3] |
### Implementation Notes
- [Explain one important design decision.]
- [Identify any parameterization, reusable module, or interface convention.]
- [Document any deliberate simplification made for this lab.]
## Verification
### Verification Strategy
The design is verified using **[simulation, formal checks, hardware testing, or
another method]**.
Verification covers:
- [Normal operating case]
- [Boundary or maximum-value case]
- [Reset or initialization case]
- [Invalid, stalled, or exceptional case, if applicable]
### Testbench and Waveform
![Timing Diagram](Waveforms/memory_tb.png)
The testbench source is available [*here*](Testbench/memory_tb.v).
### Results
| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-02 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
## Reproduction Instructions
### Tools and Versions
- **Simulator / synthesis tool:** Vivado
- **Language / standard:** Verilog HDL
- **Operating system:** macOS, Windows, Linux, or other
- **Additional dependencies:** No external libraries are required
### Build and Run
```bash
# Replace these commands with the commands required for this lab.
[compile-command]
[run-command]
```
Expected output:
```text
[Paste a short representative output or result here.]
```
## Repository Organization
```text
.
├── readme.md
├── Testbench/
│ ├── And_tb.v
│ └── memory_tb.v
├── Waveforms/
│ ├── add.png
│ └── memory_tb.png
├── and.v
├── data.mem
├── data.txt
├── data_memory.v
├── mem_wb_latch.v
├── memory.v
└── mux.v
```
## Known Issues and Future Improvements
- [Document any known issue, unverified behavior, or technical debt.]
- [Describe a realistic i
