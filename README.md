# 32 Bit RISC Processor Based on Beta ISA. Completed by Jude Gabriel and Nick Markels
As part of the class EE 435: Verilog Digitial Systems Modeling, this 32-bit RISC Microprocessor was created. It was based on the Beta ISA provided to us by our professor. The project was completed over the semester while learning the Verilog Hardware Description Language as well as digital system design techniques. The Datapath was created almost entirely using the structural modeling technique while the controller used behaviorally modeling. The datapath contained components including, Instruction register, register file, ALU, program counter, memory address register, memory data register, RAM, and supporting logic.

The controller was created by modeling an FSM with FSMs to control different functions of the microprocessor such as fetch, PC update, decode, ALU operation, load operation, store operation, jump operation, BEQ branching, and BNE branching

The final microprocessor was eventually tested in simulation by creating a program to perform a factorial calculation on a given input. The program ran successfully and produced the expected output.

Overall this project was an excellent experience to solidify digital design skills and learn the Verilog HDL.

Overview of CPU
![cpu model](https://user-images.githubusercontent.com/94936857/231936245-0817e197-766f-435c-8952-371e84ac1e4f.svg)

Controller FSM
![controller model](https://user-images.githubusercontent.com/94936857/231936264-cf21dc4d-3f33-403e-a837-ffafc1c1d0cb.svg)

Datapath
![data path model](https://user-images.githubusercontent.com/94936857/231936271-b38411f1-74ba-4832-9a94-0d530a396eed.svg)
