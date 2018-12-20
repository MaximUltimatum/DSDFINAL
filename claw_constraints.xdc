## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

#Buttons
    set_property PACKAGE_PIN U18 [get_ports rst]
        set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Switches
##sw[0]
#set_property PACKAGE_PIN V17 [get_ports {direction}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {direction}]
##sw[1]
#set_property PACKAGE_PIN V16 [get_ports {en}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {en}]
#set_property PACKAGE_PIN W16 [get_ports {direction2}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {direction2}]
#set_property PACKAGE_PIN W17 [get_ports {en2}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {en2}]

##Pmod Header JA
    ##Sch name = JA1
    #set_property PACKAGE_PIN J1 [get_ports {JA[0]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
    ##Sch name = JA2
    #set_property PACKAGE_PIN L2 [get_ports {JA[1]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
    ##Sch name = JA3
    #set_property PACKAGE_PIN J2 [get_ports {JA[2]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
    ##Sch name = JA4
    #set_property PACKAGE_PIN G2 [get_ports {JA[3]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
    #Sch name = JA7
    set_property PACKAGE_PIN H1 [get_ports {rf_input[0]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {rf_input[0]}]
    #Sch name = JA8
    set_property PACKAGE_PIN K2 [get_ports {rf_input[1]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {rf_input[1]}]
    #Sch name = JA9
    set_property PACKAGE_PIN H2 [get_ports {rf_input[2]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {rf_input[2]}]
    #Sch name = JA10
    set_property PACKAGE_PIN G3 [get_ports {rf_input[3]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {rf_input[3]}]


##Pmod Header JC
    ##Sch name = JC1
#    set_property PACKAGE_PIN K17 [get_ports {JC[0]}]
#        set_property IOSTANDARD LVCMOS33 [get_ports {JC[0]}]
    ##Sch name = JC
    #set_property PACKAGE_PIN M18 [get_ports {JC[1]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JC[1]}]
    ##Sch name = JC3
    #set_property PACKAGE_PIN N17 [get_ports {JC[2]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
    ##Sch name = JC4
    #set_property PACKAGE_PIN P18 [get_ports {JC[3]}]
        #set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
    #Sch name = JC7
    set_property PACKAGE_PIN L17 [get_ports {signal_out[0]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[0]}]
    #Sch name = JC8
    set_property PACKAGE_PIN M19 [get_ports {signal_out[1]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[1]}]
    #Sch name = JC9
    set_property PACKAGE_PIN P17 [get_ports {signal_out[2]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[2]}]
    #Sch name = JC10
    set_property PACKAGE_PIN R18 [get_ports {signal_out[3]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[3]}]


##Pmod Header JB
        #Sch name = JB1
        set_property PACKAGE_PIN A14 [get_ports {limit_switches[0]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {limit_switches[0]}]
        #Sch name = JB2
        set_property PACKAGE_PIN A16 [get_ports {limit_switches[1]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {limit_switches[1]}]
        ##Sch name = JB3
        #set_property PACKAGE_PIN B15 [get_ports {JB[2]}]
            #set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
        ##Sch name = JB4
        #set_property PACKAGE_PIN B16 [get_ports {JB[3]}]
            #set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
        #Sch name = JB7
        set_property PACKAGE_PIN A15 [get_ports {second_signal[0]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {second_signal[0]}]
        #Sch name = JB8
        set_property PACKAGE_PIN A17 [get_ports {second_signal[1]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {second_signal[1]}]
        #Sch name = JB9
        set_property PACKAGE_PIN C15 [get_ports {second_signal[2]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {second_signal[2]}]
        #Sch name = JB10
        set_property PACKAGE_PIN C16 [get_ports {second_signal[3]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {second_signal[3]}]



#         #leds
set_property PACKAGE_PIN U16 [get_ports {LED[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN W18 [get_ports {LED[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN U15 [get_ports {LED[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
#set_property PACKAGE_PIN U14 [get_ports {LED[6]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
#set_property PACKAGE_PIN V14 [get_ports {LED[7]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
#set_property PACKAGE_PIN V13 [get_ports {LED[8]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[8]}]
#set_property PACKAGE_PIN V3 [get_ports {LED[9]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[9]}]
#set_property PACKAGE_PIN W3 [get_ports {LED[10]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[10]}]
#set_property PACKAGE_PIN U3 [get_ports {LED[11]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[11]}]
#set_property PACKAGE_PIN P3 [get_ports {LED[12]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[12]}]
#set_property PACKAGE_PIN N3 [get_ports {LED[13]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[13]}]
#set_property PACKAGE_PIN P1 [get_ports {LED[14]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[14]}]
#set_property PACKAGE_PIN L1 [get_ports {LED[15]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {LED[15]}]


               set_property CFGBVS Vcco [current_design]
               set_property config_voltage 3.3 [current_design]
