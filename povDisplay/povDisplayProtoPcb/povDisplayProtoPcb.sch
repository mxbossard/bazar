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
P 2300 1300
F 0 "Shift0" H 2450 1900 50  0000 C CNN
F 1 "74LS595" H 2300 700 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 2300 1300 50  0001 C CNN
F 3 "" H 2300 1300 50  0001 C CNN
	1    2300 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 850  3600 850 
Wire Wire Line
	3000 950  3600 950 
Wire Wire Line
	3000 1050 3600 1050
Wire Wire Line
	3000 1150 3600 1150
Wire Wire Line
	3000 1250 3600 1250
Wire Wire Line
	3000 1350 3600 1350
Wire Wire Line
	3000 1450 3600 1450
Wire Wire Line
	3000 1550 3600 1550
Wire Wire Line
	4100 850  4950 850 
Wire Wire Line
	4100 950  4950 950 
Wire Wire Line
	4100 1050 4950 1050
Wire Wire Line
	4100 1150 4950 1150
Wire Wire Line
	4100 1250 4950 1250
Wire Wire Line
	4100 1350 4950 1350
Wire Wire Line
	4100 1450 4950 1450
Wire Wire Line
	4100 1550 4950 1550
Wire Wire Line
	4950 850  4950 900 
Wire Wire Line
	4950 900  5550 900 
Wire Wire Line
	4950 950  4950 1000
Wire Wire Line
	4950 1000 5550 1000
Wire Wire Line
	4950 1050 4950 1100
Wire Wire Line
	4950 1100 5550 1100
Wire Wire Line
	4950 1150 4950 1200
Wire Wire Line
	4950 1200 5550 1200
Wire Wire Line
	4950 1250 4950 1300
Wire Wire Line
	4950 1300 5550 1300
Wire Wire Line
	4950 1350 4950 1400
Wire Wire Line
	4950 1400 5550 1400
Wire Wire Line
	4950 1450 4950 1500
Wire Wire Line
	4950 1500 5550 1500
Wire Wire Line
	4950 1550 4950 1600
Wire Wire Line
	4950 1600 5550 1600
$Comp
L IRF4905 Ta1
U 1 1 5AA00D6B
P 10100 950
F 0 "Ta1" H 10350 1025 50  0000 L CNN
F 1 "BUZ11" H 10350 950 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Horizontal2_Inline_Narrow_Oval" H 10350 875 50  0001 L CIN
F 3 "" H 10100 950 50  0001 L CNN
	1    10100 950 
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
Text GLabel 1250 1050 0    60   Input ~ 0
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
Alim_led_A
Text GLabel 10600 1500 0    60   Input ~ 0
Alime_led_B
Text GLabel 6100 1950 2    60   Input ~ 0
Alime_led_B
Text GLabel 5250 1900 0    60   Input ~ 0
Alim_led_A
Text GLabel 1250 850  0    60   Input ~ 0
Serial_Data_0
Wire Wire Line
	1250 850  1600 850 
Wire Wire Line
	1250 1050 1600 1050
Text GLabel 1200 1350 0    60   Input ~ 0
Lock
Wire Wire Line
	1200 1350 1600 1350
$Comp
L 74LS595 Shift1
U 1 1 5AA03953
P 2300 2550
F 0 "Shift1" H 2450 3150 50  0000 C CNN
F 1 "74LS595" H 2300 1950 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 2300 2550 50  0001 C CNN
F 3 "" H 2300 2550 50  0001 C CNN
	1    2300 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2100 3600 2100
Wire Wire Line
	3000 2200 3600 2200
Wire Wire Line
	3000 2300 3600 2300
Wire Wire Line
	3000 2400 3600 2400
Wire Wire Line
	3000 2500 3600 2500
Wire Wire Line
	3000 2600 3600 2600
Wire Wire Line
	3000 2700 3600 2700
Wire Wire Line
	3000 2800 3600 2800
Text GLabel 1250 2300 0    60   Input ~ 0
Clock
Text GLabel 1250 2100 0    60   Input ~ 0
Serial_Data_1
Wire Wire Line
	1250 2100 1600 2100
Wire Wire Line
	1250 2300 1600 2300
Text GLabel 1200 2600 0    60   Input ~ 0
Lock
Wire Wire Line
	1200 2600 1600 2600
$Comp
L 74LS595 Shift2
U 1 1 5AA03BFA
P 2300 3900
F 0 "Shift2" H 2450 4500 50  0000 C CNN
F 1 "74LS595" H 2300 3300 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 2300 3900 50  0001 C CNN
F 3 "" H 2300 3900 50  0001 C CNN
	1    2300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3450 3600 3450
Wire Wire Line
	3000 3550 3600 3550
Wire Wire Line
	3000 3650 3600 3650
Wire Wire Line
	3000 3750 3600 3750
Wire Wire Line
	3000 3850 3600 3850
Wire Wire Line
	3000 3950 3600 3950
Wire Wire Line
	3000 4050 3600 4050
Wire Wire Line
	3000 4150 3600 4150
Text GLabel 1250 3650 0    60   Input ~ 0
Clock
Text GLabel 1250 3450 0    60   Input ~ 0
Serial_Data_2
Wire Wire Line
	1250 3450 1600 3450
Wire Wire Line
	1250 3650 1600 3650
Text GLabel 1200 3950 0    60   Input ~ 0
Lock
Wire Wire Line
	1200 3950 1600 3950
$Comp
L 74LS595 Shift3
U 1 1 5AA04DAF
P 2300 5200
F 0 "Shift3" H 2450 5800 50  0000 C CNN
F 1 "74LS595" H 2300 4600 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 2300 5200 50  0001 C CNN
F 3 "" H 2300 5200 50  0001 C CNN
	1    2300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4750 3600 4750
Wire Wire Line
	3000 4850 3600 4850
Wire Wire Line
	3000 4950 3600 4950
Wire Wire Line
	3000 5050 3600 5050
Wire Wire Line
	3000 5150 3600 5150
Wire Wire Line
	3000 5250 3600 5250
Wire Wire Line
	3000 5350 3600 5350
Wire Wire Line
	3000 5450 3600 5450
Text GLabel 1250 4950 0    60   Input ~ 0
Clock
Text GLabel 1250 4750 0    60   Input ~ 0
Serial_Data_3
Wire Wire Line
	1250 4750 1600 4750
Wire Wire Line
	1250 4950 1600 4950
Text GLabel 1200 5250 0    60   Input ~ 0
Lock
Wire Wire Line
	1200 5250 1600 5250
$Comp
L 74LS595 Shift4
U 1 1 5AA05925
P 2300 6500
F 0 "Shift4" H 2450 7100 50  0000 C CNN
F 1 "74LS595" H 2300 5900 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket_LongPads" H 2300 6500 50  0001 C CNN
F 3 "" H 2300 6500 50  0001 C CNN
	1    2300 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6050 3600 6050
Wire Wire Line
	3000 6150 3600 6150
Wire Wire Line
	3000 6250 3600 6250
Wire Wire Line
	3000 6350 3600 6350
Wire Wire Line
	3000 6450 3600 6450
Wire Wire Line
	3000 6550 3600 6550
Wire Wire Line
	3000 6650 3600 6650
Wire Wire Line
	3000 6750 3600 6750
Text GLabel 1250 6250 0    60   Input ~ 0
Clock
Text GLabel 1250 6050 0    60   Input ~ 0
Serial_Data_4
Wire Wire Line
	1250 6050 1600 6050
Wire Wire Line
	1250 6250 1600 6250
Text GLabel 1200 6550 0    60   Input ~ 0
Lock
Wire Wire Line
	1200 6550 1600 6550
Wire Wire Line
	4100 2100 4500 2100
Wire Wire Line
	4500 1650 4950 1650
Wire Wire Line
	4100 2200 4950 2200
Wire Wire Line
	4500 2100 4500 1650
Wire Wire Line
	4100 3450 4450 3450
Wire Wire Line
	4450 3450 4450 2900
Wire Wire Line
	4100 3550 4550 3550
Wire Wire Line
	4550 3550 4550 3000
Wire Wire Line
	4100 3650 4950 3650
Wire Wire Line
	4100 3750 4950 3750
Wire Wire Line
	4100 4750 4500 4750
Wire Wire Line
	4100 4850 4600 4850
Wire Wire Line
	4100 4950 4700 4950
Wire Wire Line
	4100 5050 4950 5050
Wire Wire Line
	4100 5150 4950 5150
Wire Wire Line
	4100 5250 4950 5250
Wire Wire Line
	5550 1700 4950 1700
Wire Wire Line
	4950 1700 4950 1650
$Comp
L C C0
U 1 1 5AA0B691
P 9550 3350
F 0 "C0" H 9575 3450 50  0000 L CNN
F 1 "C" H 9575 3250 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9588 3200 50  0001 C CNN
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
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9838 3200 50  0001 C CNN
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
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 10088 3200 50  0001 C CNN
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
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 10338 3200 50  0001 C CNN
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
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 10588 3200 50  0001 C CNN
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
Connection ~ 4950 850 
Connection ~ 4950 950 
Connection ~ 4950 1050
Connection ~ 4950 1150
Connection ~ 4950 1250
Connection ~ 4950 1350
Connection ~ 4950 1450
Connection ~ 4950 1550
Connection ~ 4950 1650
Wire Wire Line
	10050 1150 10200 1150
Wire Wire Line
	10600 1500 10800 1500
Text GLabel 9900 950  0    60   Input ~ 0
Command_TA
Text GLabel 10500 1300 0    60   Input ~ 0
Command_TB
Text GLabel 10450 4150 2    60   Input ~ 0
Serial_Data_0
Text GLabel 10450 3950 2    60   Input ~ 0
Serial_Data_1
Text GLabel 9050 4500 0    60   Input ~ 0
Serial_Data_2
Text GLabel 9050 4650 0    60   Input ~ 0
Serial_Data_3
Text GLabel 9050 4800 0    60   Input ~ 0
Serial_Data_4
Text GLabel 9050 4350 0    60   Input ~ 0
Clock
Text GLabel 9050 4200 0    60   Input ~ 0
Lock
Text GLabel 10450 4450 2    60   Input ~ 0
Command_TA
Text GLabel 10450 4600 2    60   Input ~ 0
Command_TB
NoConn ~ 3000 1750
NoConn ~ 3000 3000
NoConn ~ 3000 4350
NoConn ~ 3000 5650
NoConn ~ 3000 6950
Wire Wire Line
	10050 4250 10250 4250
NoConn ~ 10450 4300
Connection ~ 9550 3200
Connection ~ 9550 3500
Wire Wire Line
	9450 3500 10550 3500
Wire Wire Line
	8800 1600 8700 1800
Text GLabel 9050 4050 0    60   Input ~ 0
GND
Text GLabel 1600 5350 0    60   Input ~ 0
GND
Text GLabel 1600 4050 0    60   Input ~ 0
GND
Text GLabel 1600 6650 0    60   Input ~ 0
GND
Text GLabel 1600 6350 0    60   Input ~ 0
VCC
Text GLabel 1600 5050 0    60   Input ~ 0
VCC
Text GLabel 1600 3750 0    60   Input ~ 0
VCC
Text GLabel 1600 2700 0    60   Input ~ 0
GND
Text GLabel 1600 2400 0    60   Input ~ 0
VCC
Text GLabel 1600 1150 0    60   Input ~ 0
VCC
Text GLabel 1600 1450 0    60   Input ~ 0
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
Text GLabel 8700 1800 0    60   Output ~ 0
GND
Text GLabel 8700 1100 0    60   Output ~ 0
Vbat
Wire Wire Line
	8700 1100 8800 1300
Text GLabel 9350 2100 0    60   Input ~ 0
Vbat
$Comp
L Conn_01x02 Bat0
U 1 1 5AA235AF
P 9000 1400
F 0 "Bat0" H 9000 1500 50  0000 C CNN
F 1 "Conn_01x02" H 9000 1200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 9000 1400 50  0001 C CNN
F 3 "" H 9000 1400 50  0001 C CNN
	1    9000 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1300 8800 1400
Wire Wire Line
	8800 1500 8800 1600
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
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 10538 2100 50  0001 C CNN
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
$Comp
L R_Network09 RNA0
U 1 1 5AA3B624
P 5150 1250
F 0 "RNA0" V 4650 1250 50  0000 C CNN
F 1 "R_Network09" V 5650 1250 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 5725 1250 50  0001 C CNN
F 3 "" H 5150 1250 50  0001 C CNN
	1    5150 1250
	0    1    -1   0   
$EndComp
$Comp
L R_Network09 RNB0
U 1 1 5AA3B6B8
P 5750 1300
F 0 "RNB0" V 5250 1300 50  0000 C CNN
F 1 "R_Network09" V 6250 1300 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 6325 1300 50  0001 C CNN
F 3 "" H 5750 1300 50  0001 C CNN
	1    5750 1300
	0    1    -1   0   
$EndComp
Wire Wire Line
	4950 2250 5550 2250
Wire Wire Line
	4950 2350 5550 2350
Wire Wire Line
	4950 2450 5550 2450
Wire Wire Line
	4950 2550 5550 2550
Wire Wire Line
	4950 2650 5550 2650
Wire Wire Line
	4950 2750 5550 2750
Wire Wire Line
	4950 2850 5550 2850
Wire Wire Line
	4950 2950 5550 2950
Wire Wire Line
	5550 3050 4950 3050
$Comp
L R_Network09 RNA1
U 1 1 5AA3C842
P 5150 2600
F 0 "RNA1" V 4650 2600 50  0000 C CNN
F 1 "R_Network09" V 5650 2600 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 5725 2600 50  0001 C CNN
F 3 "" H 5150 2600 50  0001 C CNN
	1    5150 2600
	0    1    1    0   
$EndComp
$Comp
L R_Network09 RNB1
U 1 1 5AA3C849
P 5750 2650
F 0 "RNB1" V 5250 2650 50  0000 C CNN
F 1 "R_Network09" V 6250 2650 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 6325 2650 50  0001 C CNN
F 3 "" H 5750 2650 50  0001 C CNN
	1    5750 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 3700 5550 3700
Wire Wire Line
	4950 3800 5550 3800
Wire Wire Line
	4950 3900 5550 3900
Wire Wire Line
	4950 4000 5550 4000
Wire Wire Line
	4950 4100 5550 4100
Wire Wire Line
	4950 4200 5550 4200
Wire Wire Line
	4950 4300 5550 4300
Wire Wire Line
	4950 4400 5550 4400
Text GLabel 6150 4750 2    60   Input ~ 0
Alime_led_B
Text GLabel 5300 4750 0    60   Input ~ 0
Alim_led_A
Wire Wire Line
	5550 4500 4950 4500
$Comp
L R_Network09 RNA2
U 1 1 5AA3C9D5
P 5150 4050
F 0 "RNA2" V 4650 4050 50  0000 C CNN
F 1 "R_Network09" V 5650 4050 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 5725 4050 50  0001 C CNN
F 3 "" H 5150 4050 50  0001 C CNN
	1    5150 4050
	0    1    -1   0   
$EndComp
$Comp
L R_Network09 RNB2
U 1 1 5AA3C9DC
P 5750 4100
F 0 "RNB2" V 5250 4100 50  0000 C CNN
F 1 "R_Network09" V 6250 4100 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 6325 4100 50  0001 C CNN
F 3 "" H 5750 4100 50  0001 C CNN
	1    5750 4100
	0    1    -1   0   
$EndComp
Wire Wire Line
	4950 5100 5550 5100
Wire Wire Line
	4950 5200 5550 5200
Wire Wire Line
	4950 5300 5550 5300
Wire Wire Line
	4950 5400 5550 5400
Wire Wire Line
	4950 5500 5550 5500
Wire Wire Line
	4950 5600 5550 5600
Wire Wire Line
	4950 5700 5550 5700
Wire Wire Line
	4950 5800 5550 5800
Wire Wire Line
	5550 5900 4950 5900
$Comp
L R_Network09 RNA3
U 1 1 5AA3CB22
P 5150 5450
F 0 "RNA3" V 4650 5450 50  0000 C CNN
F 1 "R_Network09" V 5650 5450 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 5725 5450 50  0001 C CNN
F 3 "" H 5150 5450 50  0001 C CNN
	1    5150 5450
	0    1    1    0   
$EndComp
$Comp
L R_Network09 RNB3
U 1 1 5AA3CB29
P 5750 5500
F 0 "RNB3" V 5250 5500 50  0000 C CNN
F 1 "R_Network09" V 6250 5500 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 6325 5500 50  0001 C CNN
F 3 "" H 5750 5500 50  0001 C CNN
	1    5750 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 2200 4950 2250
Connection ~ 4950 2200
Wire Wire Line
	4950 2300 4100 2300
Wire Wire Line
	4100 2400 4950 2400
Wire Wire Line
	4950 2500 4100 2500
Wire Wire Line
	4100 2600 4950 2600
Wire Wire Line
	4950 2700 4100 2700
Wire Wire Line
	4100 2800 4950 2800
Wire Wire Line
	4950 2350 4950 2300
Wire Wire Line
	4950 2400 4950 2450
Wire Wire Line
	4950 2550 4950 2500
Wire Wire Line
	4950 2600 4950 2650
Wire Wire Line
	4950 2750 4950 2700
Wire Wire Line
	4950 2800 4950 2850
Connection ~ 4950 2300
Connection ~ 4950 2400
Connection ~ 4950 2500
Connection ~ 4950 2600
Connection ~ 4950 2700
Connection ~ 4950 2800
Wire Wire Line
	4450 2900 4950 2900
Wire Wire Line
	4950 2900 4950 2950
Connection ~ 4950 2900
Wire Wire Line
	4550 3000 4950 3000
Wire Wire Line
	4950 3000 4950 3050
Connection ~ 4950 3000
Wire Wire Line
	4950 3650 4950 3700
Connection ~ 4950 3650
Wire Wire Line
	4950 3750 4950 3800
Connection ~ 4950 3750
Wire Wire Line
	4100 3850 4950 3850
Wire Wire Line
	4950 3850 4950 3900
Wire Wire Line
	4950 4000 4950 3950
Wire Wire Line
	4950 3950 4100 3950
Wire Wire Line
	4100 4050 4950 4050
Wire Wire Line
	4950 4050 4950 4100
Wire Wire Line
	4950 4150 4100 4150
Wire Wire Line
	4700 4950 4700 4450
Wire Wire Line
	4700 4450 4950 4450
Wire Wire Line
	4950 4450 4950 4500
Wire Wire Line
	4600 4850 4600 4350
Wire Wire Line
	4600 4350 4950 4350
Wire Wire Line
	4500 4750 4500 4250
Wire Wire Line
	4500 4250 4950 4250
Wire Wire Line
	4950 4200 4950 4150
Wire Wire Line
	4950 4250 4950 4300
Wire Wire Line
	4950 4350 4950 4400
Connection ~ 4950 3850
Connection ~ 4950 3950
Connection ~ 4950 4050
Connection ~ 4950 4150
Connection ~ 4950 4250
Connection ~ 4950 4350
Connection ~ 4950 4450
Wire Wire Line
	4950 5050 4950 5100
Wire Wire Line
	4950 5150 4950 5200
Wire Wire Line
	4950 5250 4950 5300
Wire Wire Line
	4100 5350 4950 5350
Wire Wire Line
	4950 5350 4950 5400
Wire Wire Line
	4100 5450 4950 5450
Wire Wire Line
	4950 5450 4950 5500
Wire Wire Line
	4950 5600 4950 5550
Wire Wire Line
	4950 5550 4450 5550
Wire Wire Line
	4450 5550 4450 6050
Wire Wire Line
	4450 6050 4100 6050
Wire Wire Line
	4100 6150 4550 6150
Wire Wire Line
	4550 6150 4550 5650
Wire Wire Line
	4550 5650 4950 5650
Wire Wire Line
	4950 5650 4950 5700
Wire Wire Line
	4950 5800 4950 5750
Wire Wire Line
	4950 5750 4650 5750
Wire Wire Line
	4650 5750 4650 6250
Wire Wire Line
	4650 6250 4100 6250
Wire Wire Line
	4100 6350 4750 6350
Wire Wire Line
	4750 6350 4750 5850
Wire Wire Line
	4750 5850 4950 5850
Wire Wire Line
	4950 5850 4950 5900
Connection ~ 4950 5050
Connection ~ 4950 5150
Connection ~ 4950 5250
Connection ~ 4950 5350
Connection ~ 4950 5450
Connection ~ 4950 5550
Connection ~ 4950 5650
Connection ~ 4950 5750
Connection ~ 4950 5850
Wire Wire Line
	9050 4350 9550 4350
Wire Wire Line
	9550 4250 9200 4250
Wire Wire Line
	9050 4200 9200 4200
Wire Wire Line
	9200 4200 9200 4250
Wire Wire Line
	9050 4500 9200 4500
Wire Wire Line
	9200 4500 9200 4450
Wire Wire Line
	9200 4450 9550 4450
Wire Wire Line
	9050 4050 9300 4050
Wire Wire Line
	9300 4050 9300 4150
Wire Wire Line
	9300 4150 9550 4150
Wire Wire Line
	9050 4650 9300 4650
Wire Wire Line
	10250 4250 10250 4150
Wire Wire Line
	10250 4150 10450 4150
$Comp
L R_Network09 RNA4
U 1 1 5AA43728
P 5150 6650
F 0 "RNA4" V 4650 6650 50  0000 C CNN
F 1 "R_Network09" V 5650 6650 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 5725 6650 50  0001 C CNN
F 3 "" H 5150 6650 50  0001 C CNN
	1    5150 6650
	0    1    -1   0   
$EndComp
$Comp
L R_Network09 RNB4
U 1 1 5AA437CB
P 5750 6700
F 0 "RNB4" V 5250 6700 50  0000 C CNN
F 1 "R_Network09" V 6250 6700 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP10" V 6325 6700 50  0001 C CNN
F 3 "" H 5750 6700 50  0001 C CNN
	1    5750 6700
	0    1    -1   0   
$EndComp
Text GLabel 5350 7500 0    60   Input ~ 0
Alim_led_A
Text GLabel 6100 7300 2    60   Input ~ 0
Alime_led_B
Wire Wire Line
	4100 6450 4950 6450
Wire Wire Line
	4100 6550 4950 6550
Wire Wire Line
	4950 6650 4100 6650
Wire Wire Line
	4100 6750 4950 6750
Wire Wire Line
	4950 6450 4950 6500
Wire Wire Line
	4950 6500 5550 6500
Wire Wire Line
	5550 6600 4950 6600
Wire Wire Line
	4950 6600 4950 6550
Wire Wire Line
	4950 6650 4950 6700
Wire Wire Line
	4950 6700 5550 6700
Wire Wire Line
	5550 6800 4950 6800
Wire Wire Line
	4950 6800 4950 6750
Connection ~ 4950 6450
Connection ~ 4950 6550
Connection ~ 4950 6650
Connection ~ 4950 6750
NoConn ~ 4950 6850
NoConn ~ 4950 6950
NoConn ~ 4950 7050
NoConn ~ 4950 6250
NoConn ~ 4950 6350
NoConn ~ 5550 6900
NoConn ~ 5550 7000
NoConn ~ 5550 7100
NoConn ~ 5550 6300
NoConn ~ 5550 6400
$Comp
L Conn_02x06_Odd_Even J5
U 1 1 5AA4640D
P 9750 4350
F 0 "J5" H 9800 4650 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 9800 3950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x06_Pitch2.54mm" H 9750 4350 50  0001 C CNN
F 3 "" H 9750 4350 50  0001 C CNN
	1    9750 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1650 5350 2200
Wire Wire Line
	5250 1900 5350 1900
Connection ~ 5350 1900
Wire Wire Line
	5950 1700 5950 2250
Wire Wire Line
	6100 1950 5950 1950
Connection ~ 5950 1950
Wire Wire Line
	5350 4450 5400 4450
Wire Wire Line
	5400 4450 5400 5050
Wire Wire Line
	5400 4750 5300 4750
Wire Wire Line
	5400 5050 5350 5050
Connection ~ 5400 4750
Wire Wire Line
	5950 4500 5950 5100
Wire Wire Line
	6150 4750 5950 4750
Connection ~ 5950 4750
Wire Wire Line
	5950 7300 6100 7300
Wire Wire Line
	10050 4550 10350 4550
Wire Wire Line
	10350 4550 10350 4600
Wire Wire Line
	10350 4600 10450 4600
Wire Wire Line
	10450 4750 10300 4750
Wire Wire Line
	10300 4750 10300 4650
Wire Wire Line
	10300 4650 10050 4650
Wire Wire Line
	10050 4450 10450 4450
Wire Wire Line
	10050 4350 10350 4350
Wire Wire Line
	10350 4350 10350 4300
Wire Wire Line
	10350 4300 10450 4300
$Comp
L Conn_01x03 Hall_sensor0
U 1 1 5AA62B61
P 8250 2600
F 0 "Hall_sensor0" H 8250 2800 50  0000 C CNN
F 1 "Conn_01x03" H 8250 2400 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Horizontal2_Inline_Narrow_Oval" H 8250 2600 50  0001 C CNN
F 3 "" H 8250 2600 50  0001 C CNN
	1    8250 2600
	0    -1   -1   0   
$EndComp
$Comp
L C C_Hall0
U 1 1 5AA62CB7
P 8250 2200
F 0 "C_Hall0" H 8275 2300 50  0000 L CNN
F 1 "C" H 8275 2100 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8288 2050 50  0001 C CNN
F 3 "" H 8250 2200 50  0001 C CNN
	1    8250 2200
	0    1    1    0   
$EndComp
Text GLabel 8800 2900 2    60   Input ~ 0
GND
Text GLabel 7750 2900 0    60   Input ~ 0
VCC
$Comp
L R R_Hall_0
U 1 1 5AA63285
P 8050 3150
F 0 "R_Hall_0" V 8130 3150 50  0000 C CNN
F 1 "R" V 8050 3150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7980 3150 50  0001 C CNN
F 3 "" H 8050 3150 50  0001 C CNN
	1    8050 3150
	0    1    1    0   
$EndComp
$Comp
L C C_Hall1
U 1 1 5AA63401
P 8500 3150
F 0 "C_Hall1" H 8525 3250 50  0000 L CNN
F 1 "C" H 8525 3050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8538 3000 50  0001 C CNN
F 3 "" H 8500 3150 50  0001 C CNN
	1    8500 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 2900 8150 2900
Wire Wire Line
	8150 2900 8150 2800
Wire Wire Line
	8350 2800 8350 2900
Wire Wire Line
	8350 2900 8800 2900
Wire Wire Line
	8100 2200 7900 2200
Wire Wire Line
	7900 2200 7900 3150
Wire Wire Line
	7900 2900 7950 2900
Connection ~ 7900 2900
Wire Wire Line
	8400 2200 8650 2200
Wire Wire Line
	8650 2200 8650 3150
Connection ~ 8650 2900
Wire Wire Line
	8200 3150 8350 3150
Wire Wire Line
	8250 2800 8250 3550
Connection ~ 8250 3150
Text GLabel 7900 3550 0    60   Input ~ 0
Hall_Sensor
Wire Wire Line
	8250 3550 7900 3550
Text GLabel 10450 4750 2    60   Input ~ 0
Hall_Sensor
Wire Wire Line
	10050 4150 10150 4150
Wire Wire Line
	10150 4150 10150 3950
Wire Wire Line
	10150 3950 10450 3950
$Comp
L IRF4905 Tb1
U 1 1 5AA7037D
P 10700 1300
F 0 "Tb1" H 10950 1375 50  0000 L CNN
F 1 "BUZ11" H 10950 1300 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Horizontal2_Inline_Narrow_Oval" H 10950 1225 50  0001 L CIN
F 3 "" H 10700 1300 50  0001 L CNN
	1    10700 1300
	1    0    0    1   
$EndComp
$Comp
L Conn_02x04_Odd_Even Led00
U 1 1 5AA95C7B
P 3800 950
F 0 "Led00" H 3850 1150 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 950 50  0001 C CNN
F 3 "" H 3800 950 50  0001 C CNN
	1    3800 950 
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led01
U 1 1 5AA9611B
P 3800 1350
F 0 "Led01" H 3850 1550 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 1050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 1350 50  0001 C CNN
F 3 "" H 3800 1350 50  0001 C CNN
	1    3800 1350
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led10
U 1 1 5AA9620F
P 3800 2200
F 0 "Led10" H 3850 2400 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 1900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 2200 50  0001 C CNN
F 3 "" H 3800 2200 50  0001 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led11
U 1 1 5AA962A7
P 3800 2600
F 0 "Led11" H 3850 2800 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 2600 50  0001 C CNN
F 3 "" H 3800 2600 50  0001 C CNN
	1    3800 2600
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led30
U 1 1 5AA9632E
P 3800 4850
F 0 "Led30" H 3850 5050 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 4550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 4850 50  0001 C CNN
F 3 "" H 3800 4850 50  0001 C CNN
	1    3800 4850
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led21
U 1 1 5AA963D6
P 3800 3950
F 0 "Led21" H 3850 4150 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 3650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 3950 50  0001 C CNN
F 3 "" H 3800 3950 50  0001 C CNN
	1    3800 3950
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led20
U 1 1 5AA96463
P 3800 3550
F 0 "Led20" H 3850 3750 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 3250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 3550 50  0001 C CNN
F 3 "" H 3800 3550 50  0001 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led31
U 1 1 5AA968A1
P 3800 5250
F 0 "Led31" H 3850 5450 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 4950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 5250 50  0001 C CNN
F 3 "" H 3800 5250 50  0001 C CNN
	1    3800 5250
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led40
U 1 1 5AA96A47
P 3800 6150
F 0 "Led40" H 3850 6350 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 5850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 6150 50  0001 C CNN
F 3 "" H 3800 6150 50  0001 C CNN
	1    3800 6150
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x04_Odd_Even Led41
U 1 1 5AA96AF3
P 3800 6550
F 0 "Led41" H 3850 6750 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3850 6250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 3800 6550 50  0001 C CNN
F 3 "" H 3800 6550 50  0001 C CNN
	1    3800 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 7050 5350 7500
Wire Wire Line
	9300 4650 9300 4550
Wire Wire Line
	9300 4550 9550 4550
Wire Wire Line
	9050 4800 9400 4800
Wire Wire Line
	9400 4800 9400 4650
Wire Wire Line
	9400 4650 9550 4650
Wire Wire Line
	5950 7100 5950 7300
$EndSCHEMATC
