# RedPitaya-Muon-Decay
This project aims at using the RedPitaya board as the only electronic device to perform the muon-decay experiments wich consists on measuring the time between a first pulse due to a low-energy muon entering the detector and a second pulse due to an electron coming from the decay of the muon inside the scintillation detector.


It includes Verilog code to program the FPGA of the RedPitaya board to trigger on the occurrence of two pulses within a programmable time window. It also includes a programmable double-pulse generator as well. Code in Python and C to read and plot the digitized pulses is also provided. 

The HDL code was compiled with Vivado v2019.1

## Licence
MIT
