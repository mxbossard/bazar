EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:povDisplayProtoPcb-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74LS595 Shift0
U 1 1 5A9F9E11
P 4650 1300
F 0 "Shift0" H 4800 1900 50  0000 C CNN
F 1 "74LS595" H 4650 700 50  0000 C CNN
F 2 "" H 4650 1300 50  0001 C CNN
F 3 "" H 4650 1300 50  0001 C CNN
	1    4650 1300
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Row_Letter_Last Led0
U 1 1 5A9F9E82
P 6150 1150
F 0 "Led0" H 6200 1550 50  0000 C CNN
F 1 "Conn_02x08_Row_Letter_Last" H 6200 650 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x08_Pitch2.54mm" H 6150 1150 50  0001 C CNN
F 3 "" H 6150 1150 50  0001 C CNN
	1    6150 1150
	1    0    0    -1  
$EndComp
$Comp
L R_Network09 RNa0
U 1 1 5A9F9F0F
P 7500 1350
F 0 "RNa0" V 6900 1350 50  0000 C CNN
F 1 "R_Network10" V 8000 1350 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8075 1350 50  0001 C CNN
F 3 "" H 7500 1350 50  0001 C CNN
	1    7500 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 850  5950 850 
Wire Wire Line
	5350 950  5950 950 
Wire Wire Line
	5350 1050 5950 1050
Wire Wire Line
	5350 1150 5950 1150
Wire Wire Line
	5350 1250 5950 1250
Wire Wire Line
	5350 1350 5950 1350
Wire Wire Line
	5350 1450 5950 1450
Wire Wire Line
	5350 1550 5950 1550
Wire Wire Line
	6450 850  7300 850 
Wire Wire Line
	6450 950  7300 950 
Wire Wire Line
	6450 1050 7300 1050
Wire Wire Line
	6450 1150 7300 1150
Wire Wire Line
	6450 1250 7300 1250
Wire Wire Line
	6450 1350 7300 1350
Wire Wire Line
	6450 1450 7300 1450
Wire Wire Line
	6450 1550 7300 1550
$Comp
L R_Network10 RNb0
U 1 1 5A9FA336
P 8100 1400
F 0 "RNb0" V 7500 1400 50  0000 C CNN
F 1 "R_Network10" V 8600 1400 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8675 1400 50  0001 C CNN
F 3 "" H 8100 1400 50  0001 C CNN
	1    8100 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 850  7300 900 
Wire Wire Line
	7300 900  7900 900 
Wire Wire Line
	7300 950  7300 1000
Wire Wire Line
	7300 1000 7900 1000
Wire Wire Line
	7300 1050 7300 1100
Wire Wire Line
	7300 1100 7900 1100
Wire Wire Line
	7300 1150 7300 1200
Wire Wire Line
	7300 1200 7900 1200
Wire Wire Line
	7300 1250 7300 1300
Wire Wire Line
	7300 1300 7900 1300
Wire Wire Line
	7300 1350 7300 1400
Wire Wire Line
	7300 1400 7900 1400
Wire Wire Line
	7300 1450 7300 1500
Wire Wire Line
	7300 1500 7900 1500
Wire Wire Line
	7300 1550 7300 1600
Wire Wire Line
	7300 1600 7900 1600
$Comp
L BUZ11 Ta1
U 1 1 5AA00D6B
P 10100 950
F 0 "Ta1" H 10350 1025 50  0000 L CNN
F 1 "BUZ11" H 10350 950 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 10350 875 50  0001 L CIN
F 3 "" H 10100 950 50  0001 L CNN
	1    10100 950 
	1    0    0    1   
$EndComp
$Comp
L BUZ11 Tb1
U 1 1 5AA00E19
P 10700 1300
F 0 "Tb1" H 10950 1375 50  0000 L CNN
F 1 "BUZ11" H 10950 1300 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 10950 1225 50  0001 L CIN
F 3 "" H 10700 1300 50  0001 L CNN
	1    10700 1300
	1    0    0    1   
$EndComp
$Comp
L LM7805_TO220 LM7805
U 1 1 5AA00EAC
P 10050 2100
F 0 "LM7805" H 9900 2225 50  0000 C CNN
F 1 "LM7805_TO220" H 10050 2225 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 10050 2325 50  0001 C CIN
F 3 "" H 10050 2050 50  0001 C CNN
	1    10050 2100
	1    0    0    -1  
$EndComp
Text GLabel 3600 1050 0    60   Input ~ 0
Clock
$Comp
L VCC #PWR01
U 1 1 5AA01B63
P 10200 750
F 0 "#PWR01" H 10200 600 50  0001 C CNN
F 1 "VCC" H 10200 900 50  0000 C CNN
F 2 "" H 10200 750 50  0001 C CNN
F 3 "" H 10200 750 50  0001 C CNN
	1    10200 750 
	1    0    0    1   
$EndComp
Text GLabel 10050 1150 0    60   Input ~ 0
Alim_led_1
Text GLabel 10600 1500 0    60   Input ~ 0
Alime_led_2
Text GLabel 8300 900  2    60   Input ~ 0
Alime_led_2
Text GLabel 7700 600  0    60   Input ~ 0
Alim_led_1
Wire Wire Line
	7700 600  7700 850 
Text GLabel 3600 850  0    60   Input ~ 0
Serial_Data_0
Wire Wire Line
	3600 850  3950 850 
Wire Wire Line
	3600 1050 3950 1050
Text GLabel 3550 1350 0    60   Input ~ 0
Lock
Wire Wire Line
	3550 1350 3950 1350
$Comp
L 74LS595 Shift1
U 1 1 5AA03953
P 4650 2550
F 0 "Shift1" H 4800 3150 50  0000 C CNN
F 1 "74LS595" H 4650 1950 50  0000 C CNN
F 2 "" H 4650 2550 50  0001 C CNN
F 3 "" H 4650 2550 50  0001 C CNN
	1    4650 2550
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Row_Letter_Last Led1
U 1 1 5AA0395A
P 6150 2400
F 0 "Led1" H 6200 2800 50  0000 C CNN
F 1 "Conn_02x08_Row_Letter_Last" H 6200 1900 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x08_Pitch2.54mm" H 6150 2400 50  0001 C CNN
F 3 "" H 6150 2400 50  0001 C CNN
	1    6150 2400
	1    0    0    -1  
$EndComp
$Comp
L R_Network10 RNa1
U 1 1 5AA03961
P 7500 2800
F 0 "RNa1" V 6900 2800 50  0000 C CNN
F 1 "R_Network10" V 8000 2800 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8075 2800 50  0001 C CNN
F 3 "" H 7500 2800 50  0001 C CNN
	1    7500 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 2100 5950 2100
Wire Wire Line
	5350 2200 5950 2200
Wire Wire Line
	5350 2300 5950 2300
Wire Wire Line
	5350 2400 5950 2400
Wire Wire Line
	5350 2500 5950 2500
Wire Wire Line
	5350 2600 5950 2600
Wire Wire Line
	5350 2700 5950 2700
Wire Wire Line
	5350 2800 5950 2800
$Comp
L R_Network10 RNb1
U 1 1 5AA03978
P 8100 2850
F 0 "RNb1" V 7500 2850 50  0000 C CNN
F 1 "R_Network10" V 8600 2850 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8675 2850 50  0001 C CNN
F 3 "" H 8100 2850 50  0001 C CNN
	1    8100 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2300 7300 2350
Wire Wire Line
	7300 2350 7900 2350
Wire Wire Line
	7300 2400 7300 2450
Wire Wire Line
	7300 2450 7900 2450
Wire Wire Line
	7300 2500 7300 2550
Wire Wire Line
	7300 2550 7900 2550
Wire Wire Line
	7300 2600 7300 2650
Wire Wire Line
	7300 2650 7900 2650
Wire Wire Line
	7300 2700 7300 2750
Wire Wire Line
	7300 2750 7900 2750
Wire Wire Line
	7300 2800 7300 2850
Wire Wire Line
	7300 2850 7900 2850
Wire Wire Line
	7300 2900 7300 2950
Wire Wire Line
	7300 2950 7900 2950
Wire Wire Line
	7300 3000 7300 3050
Wire Wire Line
	7300 3050 7900 3050
Text GLabel 3600 2300 0    60   Input ~ 0
Clock
Text GLabel 8300 2350 2    60   Input ~ 0
Alime_led_2
Text GLabel 7700 2050 0    60   Input ~ 0
Alim_led_1
Wire Wire Line
	7700 2050 7700 2300
Text GLabel 3600 2100 0    60   Input ~ 0
Serial_Data_1
Wire Wire Line
	3600 2100 3950 2100
Wire Wire Line
	3600 2300 3950 2300
Text GLabel 3550 2600 0    60   Input ~ 0
Lock
Wire Wire Line
	3550 2600 3950 2600
$Comp
L 74LS595 Shift2
U 1 1 5AA03BFA
P 4650 3900
F 0 "Shift2" H 4800 4500 50  0000 C CNN
F 1 "74LS595" H 4650 3300 50  0000 C CNN
F 2 "" H 4650 3900 50  0001 C CNN
F 3 "" H 4650 3900 50  0001 C CNN
	1    4650 3900
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Row_Letter_Last Led2
U 1 1 5AA03C01
P 6150 3750
F 0 "Led2" H 6200 4150 50  0000 C CNN
F 1 "Conn_02x08_Row_Letter_Last" H 6200 3250 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x08_Pitch2.54mm" H 6150 3750 50  0001 C CNN
F 3 "" H 6150 3750 50  0001 C CNN
	1    6150 3750
	1    0    0    -1  
$EndComp
$Comp
L R_Network10 RNa2
U 1 1 5AA03C08
P 7500 4350
F 0 "RNa2" V 6900 4350 50  0000 C CNN
F 1 "R_Network10" V 8000 4350 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8075 4350 50  0001 C CNN
F 3 "" H 7500 4350 50  0001 C CNN
	1    7500 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 3450 5950 3450
Wire Wire Line
	5350 3550 5950 3550
Wire Wire Line
	5350 3650 5950 3650
Wire Wire Line
	5350 3750 5950 3750
Wire Wire Line
	5350 3850 5950 3850
Wire Wire Line
	5350 3950 5950 3950
Wire Wire Line
	5350 4050 5950 4050
Wire Wire Line
	5350 4150 5950 4150
$Comp
L R_Network10 RNb2
U 1 1 5AA03C1F
P 8100 4400
F 0 "RNb2" V 7500 4400 50  0000 C CNN
F 1 "R_Network10" V 8600 4400 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8675 4400 50  0001 C CNN
F 3 "" H 8100 4400 50  0001 C CNN
	1    8100 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3850 7300 3900
Wire Wire Line
	7300 3900 7900 3900
Wire Wire Line
	7300 3950 7300 4000
Wire Wire Line
	7300 4000 7900 4000
Wire Wire Line
	7300 4050 7300 4100
Wire Wire Line
	7300 4100 7900 4100
Wire Wire Line
	7300 4150 7300 4200
Wire Wire Line
	7300 4200 7900 4200
Wire Wire Line
	7300 4250 7300 4300
Wire Wire Line
	7300 4300 7900 4300
Wire Wire Line
	7300 4350 7300 4400
Wire Wire Line
	7300 4400 7900 4400
Wire Wire Line
	7300 4450 7300 4500
Wire Wire Line
	7300 4500 7900 4500
Wire Wire Line
	7300 4550 7300 4600
Wire Wire Line
	7300 4600 7900 4600
Text GLabel 3600 3650 0    60   Input ~ 0
Clock
Text GLabel 8300 3900 2    60   Input ~ 0
Alime_led_2
Text GLabel 7700 3600 0    60   Input ~ 0
Alim_led_1
Wire Wire Line
	7700 3600 7700 3850
Text GLabel 3600 3450 0    60   Input ~ 0
Serial_Data_2
Wire Wire Line
	3600 3450 3950 3450
Wire Wire Line
	3600 3650 3950 3650
Text GLabel 3550 3950 0    60   Input ~ 0
Lock
Wire Wire Line
	3550 3950 3950 3950
$Comp
L 74LS595 Shift3
U 1 1 5AA04DAF
P 4650 5200
F 0 "Shift3" H 4800 5800 50  0000 C CNN
F 1 "74LS595" H 4650 4600 50  0000 C CNN
F 2 "" H 4650 5200 50  0001 C CNN
F 3 "" H 4650 5200 50  0001 C CNN
	1    4650 5200
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Row_Letter_Last Led3
U 1 1 5AA04DB6
P 6150 5050
F 0 "Led3" H 6200 5450 50  0000 C CNN
F 1 "Conn_02x08_Row_Letter_Last" H 6200 4550 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x08_Pitch2.54mm" H 6150 5050 50  0001 C CNN
F 3 "" H 6150 5050 50  0001 C CNN
	1    6150 5050
	1    0    0    -1  
$EndComp
$Comp
L R_Network10 RNa3
U 1 1 5AA04DBD
P 7500 5850
F 0 "RNa3" V 6900 5850 50  0000 C CNN
F 1 "R_Network10" V 8000 5850 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8075 5850 50  0001 C CNN
F 3 "" H 7500 5850 50  0001 C CNN
	1    7500 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 4750 5950 4750
Wire Wire Line
	5350 4850 5950 4850
Wire Wire Line
	5350 4950 5950 4950
Wire Wire Line
	5350 5050 5950 5050
Wire Wire Line
	5350 5150 5950 5150
Wire Wire Line
	5350 5250 5950 5250
Wire Wire Line
	5350 5350 5950 5350
Wire Wire Line
	5350 5450 5950 5450
$Comp
L R_Network10 RNb3
U 1 1 5AA04DD4
P 8100 5900
F 0 "RNb3" V 7500 5900 50  0000 C CNN
F 1 "R_Network10" V 8600 5900 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 8675 5900 50  0001 C CNN
F 3 "" H 8100 5900 50  0001 C CNN
	1    8100 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 5350 7300 5400
Wire Wire Line
	7300 5400 7900 5400
Wire Wire Line
	7300 5450 7300 5500
Wire Wire Line
	7300 5500 7900 5500
Wire Wire Line
	7300 5550 7300 5600
Wire Wire Line
	7300 5600 7900 5600
Wire Wire Line
	7300 5650 7300 5700
Wire Wire Line
	7300 5700 7900 5700
Wire Wire Line
	7300 5750 7300 5800
Wire Wire Line
	7300 5800 7900 5800
Wire Wire Line
	7300 5850 7300 5900
Wire Wire Line
	7300 5900 7900 5900
Wire Wire Line
	7300 5950 7300 6000
Wire Wire Line
	7300 6000 7900 6000
Wire Wire Line
	7300 6050 7300 6100
Wire Wire Line
	7300 6100 7900 6100
Text GLabel 3600 4950 0    60   Input ~ 0
Clock
Text GLabel 8300 5400 2    60   Input ~ 0
Alime_led_2
Text GLabel 7700 5100 0    60   Input ~ 0
Alim_led_1
Wire Wire Line
	7700 5100 7700 5350
Text GLabel 3600 4750 0    60   Input ~ 0
Serial_Data_3
Wire Wire Line
	3600 4750 3950 4750
Wire Wire Line
	3600 4950 3950 4950
Text GLabel 3550 5250 0    60   Input ~ 0
Lock
Wire Wire Line
	3550 5250 3950 5250
$Comp
L 74LS595 Shift4
U 1 1 5AA05925
P 4650 6500
F 0 "Shift4" H 4800 7100 50  0000 C CNN
F 1 "74LS595" H 4650 5900 50  0000 C CNN
F 2 "" H 4650 6500 50  0001 C CNN
F 3 "" H 4650 6500 50  0001 C CNN
	1    4650 6500
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Row_Letter_Last Led4
U 1 1 5AA0592C
P 6150 6350
F 0 "Led4" H 6200 6750 50  0000 C CNN
F 1 "Conn_02x08_Row_Letter_Last" H 6200 5850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x08_Pitch2.54mm" H 6150 6350 50  0001 C CNN
F 3 "" H 6150 6350 50  0001 C CNN
	1    6150 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6050 5950 6050
Wire Wire Line
	5350 6150 5950 6150
Wire Wire Line
	5350 6250 5950 6250
Wire Wire Line
	5350 6350 5950 6350
Wire Wire Line
	5350 6450 5950 6450
Wire Wire Line
	5350 6550 5950 6550
Wire Wire Line
	5350 6650 5950 6650
Wire Wire Line
	5350 6750 5950 6750
Text GLabel 3600 6250 0    60   Input ~ 0
Clock
Text GLabel 3600 6050 0    60   Input ~ 0
Serial_Data_4
Wire Wire Line
	3600 6050 3950 6050
Wire Wire Line
	3600 6250 3950 6250
Text GLabel 3550 6550 0    60   Input ~ 0
Lock
Wire Wire Line
	3550 6550 3950 6550
Wire Wire Line
	6450 2100 6850 2100
Wire Wire Line
	6850 1650 7300 1650
Wire Wire Line
	6450 2200 6950 2200
Wire Wire Line
	6950 1750 7300 1750
Wire Wire Line
	6850 2100 6850 1650
Wire Wire Line
	6950 2200 6950 1750
Wire Wire Line
	6450 2300 7300 2300
Wire Wire Line
	6450 2400 7300 2400
Wire Wire Line
	6450 2500 7300 2500
Wire Wire Line
	6450 2600 7300 2600
Wire Wire Line
	6450 2700 7300 2700
Wire Wire Line
	6450 2800 7300 2800
Wire Wire Line
	6450 3450 6800 3450
Wire Wire Line
	6800 3450 6800 2900
Wire Wire Line
	6450 3550 6900 3550
Wire Wire Line
	6900 3550 6900 3000
Wire Wire Line
	6450 3650 7000 3650
Wire Wire Line
	7000 3650 7000 3100
Wire Wire Line
	6450 3750 7100 3750
Wire Wire Line
	7100 3750 7100 3200
Wire Wire Line
	6450 3850 7300 3850
Wire Wire Line
	6450 3950 7300 3950
Wire Wire Line
	6450 4050 7300 4050
Wire Wire Line
	6450 4150 7300 4150
Wire Wire Line
	7100 3200 7300 3200
Wire Wire Line
	7000 3100 7300 3100
Wire Wire Line
	6900 3000 7300 3000
Wire Wire Line
	6800 2900 7300 2900
Wire Wire Line
	7300 4250 6750 4250
Wire Wire Line
	6750 4250 6750 4750
Wire Wire Line
	6750 4750 6450 4750
Wire Wire Line
	7300 4350 6850 4350
Wire Wire Line
	6850 4350 6850 4850
Wire Wire Line
	6850 4850 6450 4850
Wire Wire Line
	7300 4450 6950 4450
Wire Wire Line
	6950 4450 6950 4950
Wire Wire Line
	6950 4950 6450 4950
Wire Wire Line
	7300 4550 7000 4550
Wire Wire Line
	7000 4550 7000 5050
Wire Wire Line
	7000 5050 6450 5050
Wire Wire Line
	7300 4650 7050 4650
Wire Wire Line
	7050 4650 7050 5150
Wire Wire Line
	7050 5150 6450 5150
Wire Wire Line
	7300 4750 7100 4750
Wire Wire Line
	7100 4750 7100 5250
Wire Wire Line
	7100 5250 6450 5250
Wire Wire Line
	6450 5350 7300 5350
Wire Wire Line
	6450 5450 7300 5450
Wire Wire Line
	6450 6050 6800 6050
Wire Wire Line
	6800 6050 6800 5550
Wire Wire Line
	6800 5550 7300 5550
Wire Wire Line
	7300 5650 6850 5650
Wire Wire Line
	6850 5650 6850 6150
Wire Wire Line
	6850 6150 6450 6150
Wire Wire Line
	6450 6250 6900 6250
Wire Wire Line
	6900 6250 6900 5750
Wire Wire Line
	6900 5750 7300 5750
Wire Wire Line
	7300 5850 6950 5850
Wire Wire Line
	6950 5850 6950 6350
Wire Wire Line
	6950 6350 6450 6350
Wire Wire Line
	6450 6450 7000 6450
Wire Wire Line
	7000 6450 7000 5950
Wire Wire Line
	7000 5950 7300 5950
Wire Wire Line
	7300 6050 7050 6050
Wire Wire Line
	7050 6050 7050 6550
Wire Wire Line
	7050 6550 6450 6550
Wire Wire Line
	6450 6650 7100 6650
Wire Wire Line
	7100 6650 7100 6150
Wire Wire Line
	7100 6150 7300 6150
Wire Wire Line
	7300 6250 7150 6250
Wire Wire Line
	7150 6250 7150 6750
Wire Wire Line
	7150 6750 6450 6750
Wire Wire Line
	7900 6200 7300 6200
Wire Wire Line
	7300 6200 7300 6150
Wire Wire Line
	7900 6300 7300 6300
Wire Wire Line
	7300 6300 7300 6250
Wire Wire Line
	7900 4700 7300 4700
Wire Wire Line
	7300 4700 7300 4650
Wire Wire Line
	7900 4800 7300 4800
Wire Wire Line
	7300 4800 7300 4750
Wire Wire Line
	7900 3150 7300 3150
Wire Wire Line
	7300 3150 7300 3100
Wire Wire Line
	7900 3250 7300 3250
Wire Wire Line
	7300 3250 7300 3200
Wire Wire Line
	7900 1700 7300 1700
Wire Wire Line
	7300 1700 7300 1650
Wire Wire Line
	7900 1800 7300 1800
Wire Wire Line
	7300 1800 7300 1750
$Comp
L C C0
U 1 1 5AA0B691
P 9550 3350
F 0 "C0" H 9575 3450 50  0000 L CNN
F 1 "C" H 9575 3250 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 9588 3200 50  0001 C CNN
F 3 "" H 9550 3350 50  0001 C CNN
	1    9550 3350
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5AA0B75A
P 9800 3350
F 0 "C1" H 9825 3450 50  0000 L CNN
F 1 "C" H 9825 3250 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 9838 3200 50  0001 C CNN
F 3 "" H 9800 3350 50  0001 C CNN
	1    9800 3350
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5AA0B7B9
P 10050 3350
F 0 "C2" H 10075 3450 50  0000 L CNN
F 1 "C" H 10075 3250 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 10088 3200 50  0001 C CNN
F 3 "" H 10050 3350 50  0001 C CNN
	1    10050 3350
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5AA0B81B
P 10300 3350
F 0 "C3" H 10325 3450 50  0000 L CNN
F 1 "C" H 10325 3250 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 10338 3200 50  0001 C CNN
F 3 "" H 10300 3350 50  0001 C CNN
	1    10300 3350
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5AA0B87C
P 10550 3350
F 0 "C4" H 10575 3450 50  0000 L CNN
F 1 "C" H 10575 3250 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 10588 3200 50  0001 C CNN
F 3 "" H 10550 3350 50  0001 C CNN
	1    10550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3200 10550 3200
Connection ~ 10300 3200
Connection ~ 10050 3200
Connection ~ 9800 3200
Connection ~ 9800 3500
Connection ~ 10050 3500
Connection ~ 10300 3500
Connection ~ 7300 3850
Connection ~ 7300 3950
Connection ~ 7300 4050
Connection ~ 7300 4150
Connection ~ 7300 4250
Connection ~ 7300 4350
Connection ~ 7300 4450
Connection ~ 7300 4550
Connection ~ 7300 4650
Connection ~ 7300 4750
Connection ~ 7300 5350
Connection ~ 7300 5450
Connection ~ 7300 5550
Connection ~ 7300 5650
Connection ~ 7300 5750
Connection ~ 7300 5850
Connection ~ 7300 5950
Connection ~ 7300 6050
Connection ~ 7300 6150
Connection ~ 7300 6250
Connection ~ 7300 3200
Connection ~ 7300 3100
Connection ~ 7300 3000
Connection ~ 7300 2900
Connection ~ 7300 2800
Connection ~ 7300 2700
Connection ~ 7300 2600
Connection ~ 7300 2500
Connection ~ 7300 2400
Connection ~ 7300 2300
Connection ~ 7300 850 
Connection ~ 7300 950 
Connection ~ 7300 1050
Connection ~ 7300 1150
Connection ~ 7300 1250
Connection ~ 7300 1350
Connection ~ 7300 1450
Connection ~ 7300 1550
Connection ~ 7300 1650
Connection ~ 7300 1750
Wire Wire Line
	10050 1150 10200 1150
Wire Wire Line
	10600 1500 10800 1500
Text GLabel 9900 950  0    60   Input ~ 0
Command_TA
Text GLabel 10500 1300 0    60   Input ~ 0
Command_TB
Text GLabel 1150 4900 3    60   Input ~ 0
Serial_Data_0
Text GLabel 1350 4900 3    60   Input ~ 0
Serial_Data_1
Text GLabel 1550 4900 3    60   Input ~ 0
Serial_Data_2
Text GLabel 1750 4900 3    60   Input ~ 0
Serial_Data_3
Text GLabel 1950 4900 3    60   Input ~ 0
Serial_Data_4
Text GLabel 1350 2950 1    60   Input ~ 0
Clock
Text GLabel 1550 2950 1    60   Input ~ 0
Lock
Text GLabel 1750 2950 1    60   Input ~ 0
Command_TA
Text GLabel 1950 2950 1    60   Input ~ 0
Command_TB
NoConn ~ 5350 1750
NoConn ~ 5350 3000
NoConn ~ 5350 4350
NoConn ~ 5350 5650
NoConn ~ 5350 6950
$Comp
L Conn_02x06_Counter_Clockwise Conn0
U 1 1 5AA1044A
P 1550 4050
F 0 "Conn0" H 1600 4350 50  0000 C CNN
F 1 "Conn_02x06_Counter_Clockwise" H 1600 3750 50  0000 C CNN
F 2 "" H 1550 4050 50  0001 C CNN
F 3 "" H 1550 4050 50  0001 C CNN
	1    1550 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 4900 1150 4450
Wire Wire Line
	1150 4450 1350 4450
Wire Wire Line
	1350 4450 1350 4250
Wire Wire Line
	1350 4900 1350 4600
Wire Wire Line
	1350 4600 1450 4600
Wire Wire Line
	1450 4600 1450 4250
Wire Wire Line
	1550 4250 1550 4900
Wire Wire Line
	1750 4900 1750 4750
Wire Wire Line
	1750 4750 1650 4750
Wire Wire Line
	1650 4750 1650 4250
Wire Wire Line
	1750 4250 1750 4650
Wire Wire Line
	1750 4650 1950 4650
Wire Wire Line
	1950 4650 1950 4900
Wire Wire Line
	1550 2950 1550 3750
Wire Wire Line
	1350 2950 1350 3300
Wire Wire Line
	1350 3300 1450 3300
Wire Wire Line
	1450 3300 1450 3750
Wire Wire Line
	1650 3750 1650 3100
Wire Wire Line
	1650 3100 1750 3100
Wire Wire Line
	1750 3100 1750 2950
Wire Wire Line
	1950 2950 1950 3200
Wire Wire Line
	1950 3200 1750 3200
Wire Wire Line
	1750 3200 1750 3750
NoConn ~ 1350 3750
NoConn ~ 1850 3750
Connection ~ 9550 3200
Connection ~ 9550 3500
Wire Wire Line
	9450 3500 10550 3500
Wire Wire Line
	1400 1300 1300 1500
Wire Wire Line
	1850 4250 1850 4300
Wire Wire Line
	1850 4300 2450 4300
Text GLabel 2450 4300 2    60   Input ~ 0
GND
Text GLabel 3950 5350 0    60   Input ~ 0
GND
Text GLabel 3950 4050 0    60   Input ~ 0
GND
Text GLabel 3950 6650 0    60   Input ~ 0
GND
Text GLabel 3950 6350 0    60   Input ~ 0
VCC
Text GLabel 3950 5050 0    60   Input ~ 0
VCC
Text GLabel 3950 3750 0    60   Input ~ 0
VCC
Text GLabel 3950 2700 0    60   Input ~ 0
GND
Text GLabel 3950 2400 0    60   Input ~ 0
VCC
Text GLabel 3950 1150 0    60   Input ~ 0
VCC
Text GLabel 3950 1450 0    60   Input ~ 0
GND
Text GLabel 10200 650  0    60   Input ~ 0
VCC
Wire Wire Line
	10200 650  10200 750 
Text GLabel 10800 800  0    60   Input ~ 0
VCC
Wire Wire Line
	10800 800  10800 1100
Text GLabel 9750 2650 0    60   Input ~ 0
GND
Text GLabel 10800 2100 2    60   Output ~ 0
VCC
Text GLabel 9450 3200 0    60   Input ~ 0
VCC
Text GLabel 9450 3500 0    60   Input ~ 0
GND
Text GLabel 1300 1500 0    60   Output ~ 0
GND
Text GLabel 1300 800  0    60   Output ~ 0
Vbat
Wire Wire Line
	1300 800  1400 1000
Text GLabel 9350 2100 0    60   Input ~ 0
Vbat
$Comp
L Conn_01x02 J0
U 1 1 5AA235AF
P 1600 1100
F 0 "J0" H 1600 1200 50  0000 C CNN
F 1 "Conn_01x02" H 1600 900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 1600 1100 50  0001 C CNN
F 3 "" H 1600 1100 50  0001 C CNN
	1    1600 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1000 1400 1100
Wire Wire Line
	1400 1200 1400 1300
Wire Wire Line
	9350 2100 9750 2100
Wire Wire Line
	10350 2100 10800 2100
Wire Wire Line
	10050 2650 9750 2650
$Comp
L PWR_FLAG #FLG02
U 1 1 5AA26E1E
P 9550 2100
F 0 "#FLG02" H 9550 2175 50  0001 C CNN
F 1 "PWR_FLAG" H 9550 2250 50  0000 C CNN
F 2 "" H 9550 2100 50  0001 C CNN
F 3 "" H 9550 2100 50  0001 C CNN
	1    9550 2100
	1    0    0    -1  
$EndComp
Connection ~ 9550 2100
Wire Wire Line
	10050 2400 10050 2650
Connection ~ 10050 2550
$Comp
L C CI0
U 1 1 5AA29E6F
P 9650 2250
F 0 "CI0" H 9675 2350 50  0000 L CNN
F 1 "C" H 9675 2150 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 9688 2100 50  0001 C CNN
F 3 "" H 9650 2250 50  0001 C CNN
	1    9650 2250
	1    0    0    -1  
$EndComp
$Comp
L C CO0
U 1 1 5AA2A3AF
P 10500 2250
F 0 "CO0" H 10525 2350 50  0000 L CNN
F 1 "C" H 10525 2150 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 10538 2100 50  0001 C CNN
F 3 "" H 10500 2250 50  0001 C CNN
	1    10500 2250
	1    0    0    -1  
$EndComp
Connection ~ 9650 2100
Connection ~ 10500 2100
Wire Wire Line
	9650 2400 9650 2450
Wire Wire Line
	9650 2450 10500 2450
Connection ~ 10050 2450
Wire Wire Line
	10500 2450 10500 2400
Wire Wire Line
	10700 2400 10800 2400
Connection ~ 10700 2100
$Comp
L PWR_FLAG #FLG03
U 1 1 5AA2B63F
P 10600 2550
F 0 "#FLG03" H 10600 2625 50  0001 C CNN
F 1 "PWR_FLAG" H 10600 2700 50  0000 C CNN
F 2 "" H 10600 2550 50  0001 C CNN
F 3 "" H 10600 2550 50  0001 C CNN
	1    10600 2550
	1    0    0    -1  
$EndComp
Connection ~ 10600 2550
Wire Wire Line
	10050 2550 10600 2550
$EndSCHEMATC
