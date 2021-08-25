# Creating SmartDesign IPC_SUBSYSTEM
set sd_name {IPC_SUBSYSTEM}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {presetn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pclk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {E51_IRQ} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {U54_1_IRQ} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {U54_2_IRQ} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {U54_3_IRQ} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {U54_4_IRQ} -port_direction {OUT}

sd_create_bus_port -sd_name ${sd_name} -port_name {PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bif_port -sd_name ${sd_name} -port_name {APB3mmaster} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:PADDR" \
"PSELx:PSEL" \
"PENABLE:PENABLE" \
"PWRITE:PWRITE" \
"PRDATA:PRDATA" \
"PWDATA:PWDATA" \
"PREADY:PREADY" \
"PSLVERR:PSLVERR" } 

# Add APB_ARBITER_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_ARBITER} -instance_name {APB_ARBITER_0}
# Exporting Parameters of instance APB_ARBITER_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0} -params {\
"select_bit:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {APB_ARBITER_0}
sd_update_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0}



# Add CONTEXT_U54_1_TO_U54_4 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {CONTEXT_U54_1_TO_U54_4}
# Exporting Parameters of instance CONTEXT_U54_1_TO_U54_4
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_4} -params {\
"A_HART_ID:1" \
"B_HART_ID:4" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_4}
sd_update_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_4}



# Add CONTEXT_U54_1_TO_U54_2 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {CONTEXT_U54_1_TO_U54_2}
# Exporting Parameters of instance CONTEXT_U54_1_TO_U54_2
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_2} -params {\
"A_HART_ID:1" \
"B_HART_ID:2" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_2}
sd_update_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_2}



# Add CONTEXT_U54_1_TO_U54_3 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {CONTEXT_U54_1_TO_U54_3}
# Exporting Parameters of instance CONTEXT_U54_1_TO_U54_3
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_3} -params {\
"A_HART_ID:1" \
"B_HART_ID:3" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_3}
sd_update_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_1_TO_U54_3}



# Add CONTEXT_U54_2_TO_U54_3 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {CONTEXT_U54_2_TO_U54_3}
# Exporting Parameters of instance CONTEXT_U54_2_TO_U54_3
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_2_TO_U54_3} -params {\
"A_HART_ID:2" \
"B_HART_ID:3" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CONTEXT_U54_2_TO_U54_3}
sd_update_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_2_TO_U54_3}



# Add CONTEXT_U54_2_TO_U54_4 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {CONTEXT_U54_2_TO_U54_4}
# Exporting Parameters of instance CONTEXT_U54_2_TO_U54_4
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_2_TO_U54_4} -params {\
"A_HART_ID:2" \
"B_HART_ID:4" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CONTEXT_U54_2_TO_U54_4}
sd_update_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_2_TO_U54_4}



# Add CONTEXT_U54_3_TO_U54_4 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {CONTEXT_U54_3_TO_U54_4}
# Exporting Parameters of instance CONTEXT_U54_3_TO_U54_4
sd_configure_core_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_3_TO_U54_4} -params {\
"A_HART_ID:3" \
"B_HART_ID:4" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {CONTEXT_U54_3_TO_U54_4}
sd_update_instance -sd_name ${sd_name} -instance_name {CONTEXT_U54_3_TO_U54_4}



# Add E51_IRQ_AGGREGATOR_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_IRQ_AGGREGATOR} -instance_name {E51_IRQ_AGGREGATOR_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {E51_IRQ_AGGREGATOR_0:CH0_MSG_PRESENT_IRQ} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {E51_IRQ_AGGREGATOR_0:CH0_ACK_IRQ} -value {GND}



# Add HSS_E51_TO_U54_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {HSS_E51_TO_U54_1}
# Exporting Parameters of instance HSS_E51_TO_U54_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_1} -params {\
"A_HART_ID:0" \
"B_HART_ID:1" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_1}
sd_update_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_1}



# Add HSS_E51_TO_U54_2 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {HSS_E51_TO_U54_2}
# Exporting Parameters of instance HSS_E51_TO_U54_2
sd_configure_core_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_2} -params {\
"A_HART_ID:0" \
"B_HART_ID:2" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_2}
sd_update_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_2}



# Add HSS_E51_TO_U54_3 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {HSS_E51_TO_U54_3}
# Exporting Parameters of instance HSS_E51_TO_U54_3
sd_configure_core_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_3} -params {\
"A_HART_ID:0" \
"B_HART_ID:3" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_3}
sd_update_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_3}



# Add HSS_E51_TO_U54_4 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_MAILBOX} -instance_name {HSS_E51_TO_U54_4}
# Exporting Parameters of instance HSS_E51_TO_U54_4
sd_configure_core_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_4} -params {\
"A_HART_ID:0" \
"B_HART_ID:4" \
"MESSAGE_DEPTH:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_4}
sd_update_instance -sd_name ${sd_name} -instance_name {HSS_E51_TO_U54_4}



# Add IPC_APB_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IPC_APB} -instance_name {IPC_APB_0}



# Add IPC_APB_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IPC_APB} -instance_name {IPC_APB_1}



# Add U54_1_IRQ_AGGREGATOR instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_IRQ_AGGREGATOR} -instance_name {U54_1_IRQ_AGGREGATOR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_1_IRQ_AGGREGATOR:CH1_MSG_PRESENT_IRQ} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_1_IRQ_AGGREGATOR:CH1_ACK_IRQ} -value {GND}



# Add U54_2_IRQ_AGGREGATOR instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_IRQ_AGGREGATOR} -instance_name {U54_2_IRQ_AGGREGATOR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_2_IRQ_AGGREGATOR:CH2_MSG_PRESENT_IRQ} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_2_IRQ_AGGREGATOR:CH2_ACK_IRQ} -value {GND}



# Add U54_3_IRQ_AGGREGATOR instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_IRQ_AGGREGATOR} -instance_name {U54_3_IRQ_AGGREGATOR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_3_IRQ_AGGREGATOR:CH3_MSG_PRESENT_IRQ} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_3_IRQ_AGGREGATOR:CH3_ACK_IRQ} -value {GND}



# Add U54_4_IRQ_AGGREGATOR instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {IPC_IRQ_AGGREGATOR} -instance_name {U54_4_IRQ_AGGREGATOR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_4_IRQ_AGGREGATOR:CH4_MSG_PRESENT_IRQ} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {U54_4_IRQ_AGGREGATOR:CH4_ACK_IRQ} -value {GND}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_4:a_msg_ack_irq" "U54_4_IRQ_AGGREGATOR:CH1_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_4:a_msg_present_irq" "U54_1_IRQ_AGGREGATOR:CH4_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_4:b_msg_ack_irq" "U54_1_IRQ_AGGREGATOR:CH4_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_4:b_msg_present_irq" "U54_4_IRQ_AGGREGATOR:CH1_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_2:a_msg_ack_irq" "U54_2_IRQ_AGGREGATOR:CH1_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_2:a_msg_present_irq" "U54_1_IRQ_AGGREGATOR:CH2_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_2:b_msg_ack_irq" "U54_1_IRQ_AGGREGATOR:CH2_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_2:b_msg_present_irq" "U54_2_IRQ_AGGREGATOR:CH1_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_3:a_msg_ack_irq" "U54_3_IRQ_AGGREGATOR:CH1_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_3:a_msg_present_irq" "U54_1_IRQ_AGGREGATOR:CH3_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_3:b_msg_ack_irq" "U54_1_IRQ_AGGREGATOR:CH3_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_3:b_msg_present_irq" "U54_3_IRQ_AGGREGATOR:CH1_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_3:a_msg_ack_irq" "U54_3_IRQ_AGGREGATOR:CH2_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_3:a_msg_present_irq" "U54_2_IRQ_AGGREGATOR:CH3_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_3:b_msg_ack_irq" "U54_2_IRQ_AGGREGATOR:CH3_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_3:b_msg_present_irq" "U54_3_IRQ_AGGREGATOR:CH2_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_4_IRQ_AGGREGATOR:CH3_ACK_IRQ" "CONTEXT_U54_3_TO_U54_4:a_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_3_IRQ_AGGREGATOR:CH4_MSG_PRESENT_IRQ" "CONTEXT_U54_3_TO_U54_4:a_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_3_IRQ_AGGREGATOR:CH4_ACK_IRQ" "CONTEXT_U54_3_TO_U54_4:b_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_4_IRQ_AGGREGATOR:CH3_MSG_PRESENT_IRQ" "CONTEXT_U54_3_TO_U54_4:b_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"E51_IRQ" "E51_IRQ_AGGREGATOR_0:IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_1_IRQ_AGGREGATOR:CH0_ACK_IRQ" "HSS_E51_TO_U54_1:a_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"E51_IRQ_AGGREGATOR_0:CH1_MSG_PRESENT_IRQ" "HSS_E51_TO_U54_1:a_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"E51_IRQ_AGGREGATOR_0:CH1_ACK_IRQ" "HSS_E51_TO_U54_1:b_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_1_IRQ_AGGREGATOR:CH0_MSG_PRESENT_IRQ" "HSS_E51_TO_U54_1:b_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_2_IRQ_AGGREGATOR:CH0_ACK_IRQ" "HSS_E51_TO_U54_2:a_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_2:a_msg_present_irq" "E51_IRQ_AGGREGATOR_0:CH2_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_2:b_msg_ack_irq" "E51_IRQ_AGGREGATOR_0:CH2_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_2_IRQ_AGGREGATOR:CH0_MSG_PRESENT_IRQ" "HSS_E51_TO_U54_2:b_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_3_IRQ_AGGREGATOR:CH0_ACK_IRQ" "HSS_E51_TO_U54_3:a_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_3:a_msg_present_irq" "E51_IRQ_AGGREGATOR_0:CH3_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_3:b_msg_ack_irq" "E51_IRQ_AGGREGATOR_0:CH3_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_3_IRQ_AGGREGATOR:CH0_MSG_PRESENT_IRQ" "HSS_E51_TO_U54_3:b_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_4_IRQ_AGGREGATOR:CH0_ACK_IRQ" "HSS_E51_TO_U54_4:a_msg_ack_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_4:a_msg_present_irq" "E51_IRQ_AGGREGATOR_0:CH4_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_4:b_msg_ack_irq" "E51_IRQ_AGGREGATOR_0:CH4_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_4_IRQ_AGGREGATOR:CH0_MSG_PRESENT_IRQ" "HSS_E51_TO_U54_4:b_msg_present_irq" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pclk" "CONTEXT_U54_2_TO_U54_4:pclk" "CONTEXT_U54_2_TO_U54_3:pclk" "CONTEXT_U54_1_TO_U54_3:pclk" "CONTEXT_U54_1_TO_U54_2:pclk" "U54_1_IRQ_AGGREGATOR:pclk" "U54_2_IRQ_AGGREGATOR:pclk" "U54_3_IRQ_AGGREGATOR:pclk" "U54_4_IRQ_AGGREGATOR:pclk" "HSS_E51_TO_U54_2:pclk" "HSS_E51_TO_U54_3:pclk" "HSS_E51_TO_U54_4:pclk" "CONTEXT_U54_1_TO_U54_4:pclk" "CONTEXT_U54_3_TO_U54_4:pclk" "E51_IRQ_AGGREGATOR_0:pclk" "HSS_E51_TO_U54_1:pclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"presetn" "CONTEXT_U54_2_TO_U54_4:presetn" "CONTEXT_U54_2_TO_U54_3:presetn" "CONTEXT_U54_1_TO_U54_3:presetn" "CONTEXT_U54_1_TO_U54_2:presetn" "U54_1_IRQ_AGGREGATOR:presetn" "U54_2_IRQ_AGGREGATOR:presetn" "U54_3_IRQ_AGGREGATOR:presetn" "U54_4_IRQ_AGGREGATOR:presetn" "HSS_E51_TO_U54_2:presetn" "HSS_E51_TO_U54_3:presetn" "HSS_E51_TO_U54_4:presetn" "CONTEXT_U54_1_TO_U54_4:presetn" "CONTEXT_U54_3_TO_U54_4:presetn" "E51_IRQ_AGGREGATOR_0:presetn" "HSS_E51_TO_U54_1:presetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_1_IRQ" "U54_1_IRQ_AGGREGATOR:IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_2_IRQ" "U54_2_IRQ_AGGREGATOR:IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_4:a_msg_ack_irq" "U54_4_IRQ_AGGREGATOR:CH2_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_4:a_msg_present_irq" "U54_2_IRQ_AGGREGATOR:CH4_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_4:b_msg_ack_irq" "U54_2_IRQ_AGGREGATOR:CH4_ACK_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_4:b_msg_present_irq" "U54_4_IRQ_AGGREGATOR:CH2_MSG_PRESENT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_3_IRQ" "U54_3_IRQ_AGGREGATOR:IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_4_IRQ" "U54_4_IRQ_AGGREGATOR:IRQ" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB3mmaster" "APB_ARBITER_0:APB_MMASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MASTER_0x4xxx_xxxx" "IPC_APB_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APB3mmaster" "APB_ARBITER_0:APB_MASTER_0x5xxx_xxxx" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_1:A_SIDE" "IPC_APB_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_2:A_SIDE" "IPC_APB_0:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_3:A_SIDE" "IPC_APB_0:APBmslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_4:A_SIDE" "IPC_APB_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"E51_IRQ_AGGREGATOR_0:APB_SLAVE" "IPC_APB_0:APBmslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_1:B_SIDE" "IPC_APB_0:APBmslave5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_2:A_SIDE" "IPC_APB_0:APBmslave6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_3:A_SIDE" "IPC_APB_0:APBmslave7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_4:A_SIDE" "IPC_APB_0:APBmslave8" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_1_IRQ_AGGREGATOR:APB_SLAVE" "IPC_APB_0:APBmslave9" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_2:B_SIDE" "IPC_APB_0:APBmslave10" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_2:B_SIDE" "IPC_APB_0:APBmslave11" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_3:A_SIDE" "IPC_APB_0:APBmslave12" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_4:A_SIDE" "IPC_APB_0:APBmslave13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"U54_2_IRQ_AGGREGATOR:APB_SLAVE" "IPC_APB_0:APBmslave14" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HSS_E51_TO_U54_3:B_SIDE" "IPC_APB_0:APBmslave15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_3:B_SIDE" "IPC_APB_1:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_2_TO_U54_3:B_SIDE" "IPC_APB_1:APBmslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APBmslave2" "CONTEXT_U54_3_TO_U54_4:A_SIDE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APBmslave3" "U54_3_IRQ_AGGREGATOR:APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APBmslave4" "HSS_E51_TO_U54_4:B_SIDE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CONTEXT_U54_1_TO_U54_4:B_SIDE" "IPC_APB_1:APBmslave5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APBmslave6" "CONTEXT_U54_2_TO_U54_4:B_SIDE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APBmslave7" "CONTEXT_U54_3_TO_U54_4:B_SIDE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IPC_APB_1:APBmslave8" "U54_4_IRQ_AGGREGATOR:APB_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign IPC_SUBSYSTEM
generate_component -component_name ${sd_name}
