# Coding Assignment 3 - Execute

<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was verified.
-->

## Design Scope and Assumptions

- **In scope:** Implement Execute stage of the MIPS, including ALU operations, ALU Control, adder, multiplexers, and ex/mem pipeline. 
- **Out of scope:** [What this lab intentionally does not implement]
- **Assumptions:** [Clock frequency, reset behavior, data width, memory model, or other assumptions]
- **Limitations:** [Known limitations or simplified behaviors]

## Requirements

| Requirement | Description | Verification Method |
|---|---|---|
| REQ-01 | [The design shall ...] | [Test case, waveform, calculation, or inspection] |
| REQ-02 | [The design shall ...] | [Test case, waveform, calculation, or inspection] |
| REQ-03 | [The design shall ...] | [Test case, waveform, calculation, or inspection] |

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

- [Explain one important design decision.]
- [Identify any parameterization, reusable module, or interface convention.]
- [Document any deliberate simplification made for this lab.]

## Verification

### Verification Strategy

The design is verified using **[simulation, formal checks, hardware testing, or another method]**.

Verification covers:

- [Normal operating case]
- [Boundary or maximum-value case]
- [Reset or initialization case]
- [Invalid, stalled, or exceptional case, if applicable]

### Testbench and Waveform

Save screenshots and waveform images in the repository's `images/` folder.

![Testbench or waveform](images/[testbench-screenshot-filename].png)

The testbench source is available [*here*](LINK_TO_TESTBENCH_CODE).

### Results

| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-02 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |

## Reproduction Instructions

### Tools and Versions

- **Simulator / synthesis tool:** [Name and version]
- **Language / standard:** [Verilog/SystemVerilog version]
- **Operating system:** [macOS, Windows, Linux, or other]
- **Additional dependencies:** [List any required tools or libraries]

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
├── README.md
├── images/
│   ├── [timing-diagram-filename].png
│   └── [testbench-screenshot-filename].png
├── [source-files]
└── [testbench-files]
```

## Known Issues and Future Improvements

- [Document any known issue, unverified behavior, or technical debt.]
- [Describe a realistic improvement or extension.]
