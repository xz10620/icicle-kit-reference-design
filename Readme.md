# PolarFire SoC Icicle Kit Reference Design Generation Tcl Scripts - Libero v12.5

## Description

This repository can be used to generate a reference design for the PolarFire SoC Icicle Kit. This reference design will have the same or extended functionality compared to the pre-programmed FPGA design on the Icicle Kit.
Tcl scripts are provided to generate a reference design using Libero SoC, these Tcl scripts have been tested using Libero SoC v12.5 and Libero SoC v12.5 SP1.

## Using the Reference Design Generation Tcl Scripts

A script is provided for both eMMC and SD card configurations, previously eMMC and SD could only be used exclusivly but updates now permit dynamic switching between eMMC and SD card. Both scripts now connect the SDIO SEL signals to MSS GPIO_2 bit 0, by default this bit is low which selects the eMMC MUX conifguration, setting this bit selects the SD card MUX configuraion. Each script will enable its respective configuration in the PolarFire SoC MSS while allowing for dynamic switching, to use the SD card ensure that GPIO_2 bit 0 is set. See the section titled "eMMC and SD card switching" for more information. 

1. Clone the repository - note the path to this repository must not contain any spaces
2. Open Libero v12.5
3. Open the execute script dialog (CTRL + U)
4. Execute the script for the design required (e.g "ICICLE_KIT_eMMC.tcl") - there are no arguments
5. The libero design will be created in the same folder as the script
6. Configure if required and run the flow to program a device

## Programming the FPGA

The scripts will automatically import IO constraints and generate timing constraints for the design. The flow can be run by double clicking on a stage in the design flow - selecting an option requiring previous steps to be completed will run the full flow, i.e double clicking "Run Program Action" will run synthesis, place and route, etc and then program the device.

## MSS Configuration
The Microprocessor Subsystem (MSS) is configured using the PolarFire SoC MSS Configurator. 
This software tool takes user inputs and generates an MSS configuration file (.xml) along with an MSS component file (.cxz). 
The XML file is used by the PolarFire SoC Configuration Generator to generate configuration header files for bare metal applications. 
The MSS component file can be imported into a Libero design and used in the FPGA design flow.

A saved configuration for the PolarFire SoC MSS Configurator is available for both the eMMC and SD card designs in the "script_support" folder. These configurations will match the MSS configuration used in the design and can be used to regenerate XML and a Libero component.

## XML

The Microprocessor Subsystem (MSS) configuration is captured in an XML file that is then used by the PolarFire SoC Configuration Generator to generate configuration header files. These header files are compiled as part of the MPFS HAL startup code to configure the system on startup.

XML generated by both of the configurations provided is available in the "XML" folder.

## Programming the eNVM and setting the boot mode

If the eNVM is to be used (for example to store the HSS or a bare metal application) it can be programmed using SoftConsole v6.4 or later. 

Build the application using the reference XML provided (XML will also be generated in the script_support/components/[target] folder when an MSS component is generated as part of the flow) and run the "PolarFire SoC program non secure boot mode 1" external tool in SoftConsole.

## Board configuration

For jumper configurations to use this design and Linux images for eMMC and SD Cards see: [Updating PolarFire SoC Icicle-Kit FPGA Design and Linux Image](https://github.com/polarfire-soc/polarfire-soc-documentation/blob/master/boards/mpfs-icicle-kit-es/updating-icicle-kit/updating-icicle-kit-design-and-linux.md) 

## Design description

### Block diagram

The diagram below outlines the FPGA fabric configuration and shows MSS I/Os used in this design:

![Block diagram](./block_diagram.svg)

### MSS peripherals
The following MSS peripherals are enabled:

| Peripheral 	| Routing           	| Notes                                     	|
|------------	|-------------------	|-------------------------------------------	|
| eMMC       	| MSS I/Os BANK 4   	| See "eMMC and SD card switching"          	|
| USB        	| MSS I/Os BANK 2   	|                                           	|
| SD/SDIO    	| MSS I/Os BANK 4   	| See "eMMC and SD card switching"          	|
| GEM 0      	| SGMII I/Os BANK 5 	|                                           	|
| GEM 1      	| SGMII I/Os BANK 5 	| Management through MSS I/Os BANK 2 B      	|
| SPI 1      	| MSS I/Os BANK 2 B 	|                                           	|
| MMUART 0   	| Fabric            	|                                           	|
| MMUART 1   	| Fabric            	|                                           	|
| MMUART 2   	| Fabric            	|                                           	|
| MMUART 3   	| Fabric            	|                                           	|
| I2C 1      	| MSS I/Os BANK 2 B 	|                                           	|
| CAN 0      	| Fabric            	|                                           	|
| CAN 1      	| MSS I/Os BANK 2 B 	|                                           	|
| GPIO 2     	| Fabric            	| See block diagram for enabled GPIOs       	|

### Memory map

| Server                  	| Bus          	| Receiver                	| Address range                 	|
|-------------------------	|--------------	|-------------------------	|-------------------------------	|
| MSS: FIC0               	| AXI4_mslave0 	| PF_PCIE_C0_0            	| 0x7000_0000 -> 0x2f_ffff_ffff 	|
| MSS: FIC0               	| AXI4_mslave1 	| LSRAM_0                 	| 0x6100_0000 -> 0x6fff_ffff    	|
| MSS: FIC0               	| AXI4_mslave2 	| COREAXI4DMACONTROLLER_0 	| 0x6002_0000 -> 0x6002_ffff    	|
| MSS: FIC3               	| APBmslave3   	| PF_DRI_C0_0             	| 0x4000_0000 -> 0x4fff_ffff    	|
| PF_PCIE_C0_0            	| AXI4_mslave0 	| MSS: FIC0               	| 0x6000_0000 -> 0xbfff_ffff    	|
| PF_PCIE_C0_0            	| AXI4_mslave1 	| LSRAM_1                 	| 0x0 -> 0xfff                  	|
| COREAXI4DMACONTROLLER_0 	| AXI4_mslave0 	| MSS: FIC1               	| 0xc000_0000 -> 0xcfff_ffff    	|

### eMMC and SD card switching

In previous versions of this design the SDIO SEL signals were tied low to enable eMMC or tied high to enable the SD card. The Icicle Kit reference design and MPFS HAL have been updated to support dynamically switching between these configurations without having to re-program the FPGA. 

The SDIO SEL signals are now driven by MSS GPIO_2 bit 0 - this bit resets to output 0 selecting the eMMC configuration, to select an SD card configuration set GPIO_2 bit 0 high.

HSS build v0.99.14 and greater has support for dynamic switching.

**Note:** currently these updates are not fully supported by the Libero SoC design suite - to accomidate this the MPFS HAL has been updated with a define to allow dynamic switching - which will support the MPFS250T part on the Icicle Kit only and no other PolarFire SoC parts. As a result of this we will continue to provide separte eMMC and SD card scripts to generate MSS XML for each configuration until Libero SoC has full support for these updates. 