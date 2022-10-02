# RedPitaya-Muon-Decay
This project aims at using the RedPitaya board as the only electronic device, in addition to the detector, to perform the muon-decay experiments which  measures the time between a first pulse due to a low-energy muon entering a scintillation detector and a second pulse due to an electron coming from the decay of the muon inside the detector.


It includes Verilog code to program the FPGA of the RedPitaya board to trigger on the occurrence of two pulses within a programmable time window. Code in Python and C to read and plot the digitized pulses is also provided. 


The HDL code was compiled with Vivado v2019.1

## Memory Map

### Memory Loc  Function					      Bits	R/W

- 0x41200000  Trigger Treshold 			    29:16 	Write

- 0x41200000  Address ro Read Port B 		15:4 	Write

- 0x41200000  Clock Port B 				        0:0 	Write

- 0x41200000  Enable Trigger				      1:1 	Write

- 0x41200008  ADC Counts Port B 			15:0 	Read

- 0x41200008  Address at Trigger 			31:16 	Read


- 0x41210000  Pulse Width Generator 		15:4 	Write

- 0x41210000  Delta Time Generator 		31:16 	Write

- 0x41210000  Start 						 0:0 	Write

- 0x41210008  Num Single_Pulse Triggers 	15:0 	Read 

- 0x41210008  Num Doublele_Pulse Triggers 31:16 	Read

- 0x41220000  Points saved after Trigger 	31:16 	Write

- 0x41220000  Window for Dble-Pulse Trig 	15:0 	Write

- 0x41220008  Select Single/Double Mode	 0:0 	Write

- 0x41220008  Clear Counters			 	 1:1 	Write




- 0x41230008  Trigger_Edge 				 0:0 	Write

- 0x41230000  Delta Time Measured 		13:0 	Read


## CAUTION

This project includes a programmable double-pulse generator. 

The pulse generator produces pulses of 3.3 V amplitude. 

If you decide to use this pulse generator, CHANGE THE RANGE SELECTOR OF THE RedPitaya BOARD TO HV.


## Licence
MIT
