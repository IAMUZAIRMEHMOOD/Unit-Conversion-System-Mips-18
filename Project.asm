.data
#
#
#
Options:          .asciiz "Press 1 to Convert Distance \nPress 2 to Convert Acceleration \nPress 3 to Convert Area \nPress 4 to Convert Temperature\nPress 5 to Convert Weight \nPress 6 to Convert Pressure \nPress 7 to Convert Speed \nPress 8 to Convert Time\n"
#
#
#
Nextline:         .asciiz "\n"
#
#
#
#Distance:        .asciiz "Press 1 to Convert Distance"
Distance:         .asciiz "Press 1 to Convert from Meter \nPress 2 to Convert from Km\n"
Distance_Enter:   .asciiz "Enter Distance   = "
Distance_Meter:   .asciiz "Distance in  m   = "
Distance_Cm:      .asciiz "Distance in Cm   = "
Distance_Km:      .asciiz "Distance in km   = "
Distance_Inch:    .asciiz "Distance in inch = "
#
#
#
#Acceleration:    .asciiz "Press 2 to Convert Acceleration"
Acceleration:               .asciiz "Press 1 to Convert from m/s^2 \nPress 2 to Convert from km/s^2\n"
Acceleration_Enter:         .asciiz "Enter Acceleration      = "
Acceleration_Ms2:           .asciiz "Acceleration in m/s^2   = "
Acceleration_Kms2:          .asciiz "Acceleration in km/s^2  = "
#
#
#
#Area:            .asciiz "Press 3 to Convert Area"
Area:             .asciiz "Press 1 to Convert from m^2 \nPress 2 to Convert from km^2\n"
Area_Enter:       .asciiz "Enter Area   = "
Area_M2:          .asciiz "Area in m^2  = "
Area_Km2:         .asciiz "Area in Km^2 = "
#
#
#
#Temperature:     .asciiz "Press 4 to Convert Temperature"
Temperature:                 .asciiz "Press 1 to convert from K (Kelvin) \nPress 2 to Convert from C (Celsius)\n"
Temperature_Enter:           .asciiz "Enter Temperature  = "
Temperature_K:               .asciiz "Temperature in K   = "
Temperature_C:               .asciiz "Temperature in C   = "
#Temperature_F:               .asciiz "Temperature in F  = "
#
#
#
#Weight:          .asciiz "Press 5 to Convert Weight"
Weight:           .asciiz "Press 1 to Convert from kg \nPress 2 to Convert from g\n"
Weight_Enter:     .asciiz "Enter Weight = "
Weight_Kg:        .asciiz "Weight in Kg = "
Weight_G:         .asciiz "Weight in  g = "
Weight_Lb:        .asciiz "Weight in Lb = "
Weight_Oz:        .asciiz "Weight in Oz = "
#
#
#
#Pressure:        .asciiz "Press 6 to Convert Pressure"
Pressure:         .asciiz "Press 1 to Convert from Pa \nPress 2 to Convert from atm\n"
Pressure_Enter:   .asciiz "Enter Pressure = "
Pressure_Mmhg:    .asciiz "Weight in mmHg = "
Pressure_Pa:      .asciiz "Weight in  Pa  = "
Pressure_Atm:     .asciiz "Weight in atm  = "
#
#
#
#Speed:           .asciiz "Press 7 to Covnert Speed"
Speed:            .asciiz "Press 1 to Convert from m/s \nPress 2 to Convert from km/h\n"
Speed_Enter:      .asciiz "Enter Speed   = "
Speed_Kmh:        .asciiz "Speed in Km/h = "
Speed_Ms:         .asciiz "Speed in m/s  = "
#
#
#
#Time:            .asciiz "Press 8 to Convert Time" 
Time:             .asciiz "Press 1 to Convert from Second \nPress 2 to Convert from Minutes\nPress 3 to Convert from Hour\n"
Time_Enter:       .asciiz "Enter  Time = "
Time_S:           .asciiz "Time in Sec = "
Time_M:           .asciiz "Time in Min = "
Time_H:           .asciiz "Time in Hr  = "
##
#### Conversion
##
distance.tom:                         .float 1000
distance.tokm:                        .float 0.001
distance.tocm.from.m:                 .float 100
distance.tocm.from.km:                .float 100000
distance.toinch.from.m:               .float 39.37007874 
distance.toinch.from.km:              .float 39370.07874
#
#
#
acceleartion.tokms2:                  .float 0.001
acceleration.toms2:                   .float 1000
#
#
#
area.tokm2:                           .float 0.000001
area.tom2:                            .float 1000000
#
#
#
temperature.toc:                      .float 273.15
temperature.tok:                      .float 273.15
#
#
#
weight.tokg:                          .float 0.001
weight.tog:                           .float 1000
weight.tolb.fromkg:                   .float 2.204622476
weight.tolb.fromg:                    .float 0.002204622476
weight.tooz.fromkg:                   .float 35.27396584
weight.tooz.fromg:                    .float 0.03527396584
#
#
#
pressure.topa:                        .float 101325
pressure.tommhg.fromatm:              .float 760
pressure.toatm:                       .float 9.86923667E-6     #0.000009869232667
pressure.tommhg.frompa:               .float 7.500616872E-3 
#
#
#
speed.tokmh:                          .float 3.6
speed.toms:                           .float 0.277778
#
#
#
time.tos.fromh:                        .float 3600
time.tos.fromm:                        .float 60
time.tom.froms:                        .float 0.01666666667
time.tom.fromh:                        .float 60
time.tohr.froms:                       .float 2.777777778E-4
time.tohr.fromm:                       .float 0.01666666667
#
#
#
.text
#
#
#
main:                               #mian label
#Printing Option to Enter Conversion
la $a0,Options
li $v0,4
syscall
#Select Option
li $v0,5
syscall
#move Entered value to s1
move $s1,$v0
#if brach is less then equal to zero go to main
blez $v0,main
li $t0,8
#if branch is greater than 8 go to main else continue
bgt $s1,$t0,main
#la $a0,Nextline
#li $v0,4
#syscall
###### Input Value in to Compare #######
li $t1,1
li $t2,2
li $t3,3
li $t4,4
li $t5,5
li $t6,6
li $t7,7
li $t8,8
#if in put value is not equal to 1 then go to Distance_Label else continue
beq $s1,$t1,Distance_Label
#if in put value is not equal to 2 then go to Acceleration_Label else continue
beq $s1,$t2,Acceleration_Label
#if in put value is not equal to 3 then go to Area_Label else continue
beq $s1,$t3,Area_Label
#if in put value is not equal to 4 then go to Temperature_Label else continue
beq $s1,$t4,Temperature_Label
#if in put value is not equal to 5 then go to Weight_Label else continue
beq $s1,$t5,Weight_Label
#if in put value is not equal to 6 then go to Pressure_Label else continue
beq $s1,$t6,Pressure_Label
#if in put value is not equal to 7 then go to Speed_Label else continue
beq $s1,$t7,Speed_Label
#if in put value is not equal to 8 then go to Time_Label else continue
beq $s1,$t8,Time_Label
#
#
#
Distance_Label:                           #Print Label
# Print Options
la $a0,Distance
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
#if brach is less then equal to zero go to Distance_Label
blez $s0,Distance_Label
#if brach equal to 1 go to meter else continue 
beq $s0,$t1,meter
#if brach equal to 2 go to kilometer else continue 
beq $s0,$t2,kilometer
#if is greater than 3 go to Distance_Label else continue 
bgt $s0,$t0,Distance_Label
#
#
meter:
#
#
#Ask user to enter value 
la $a0,Distance_Enter
li $v0,4
Syscall
#
#Take input as integer
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert meter to km
la $a0,Distance_Km
li $v0,4
syscall
#load value of float from label
lwc1 $f1,distance.tokm
#multiply float values
mul.s $f12,$f1,$f11
#print float values to get desired output
li $v0,2
syscall
#Print to move pointer on next line
la $a0,Nextline
li $v0,4
syscall
# Convert meter to Cm
la $a0,Distance_Cm
li $v0,4
syscall
#load value of float from label
lwc1 $f1,distance.tocm.from.m
#multiply float values to get desired output
mul.s $f12,$f1,$f11
#Print answer in float
li $v0,2
syscall
#Print to move pointer on nextline
la $a0,Nextline
li $v0,4
syscall
# Convert meter to Inch
la $a0,Distance_Inch
li $v0,4
syscall
##load value of float from label
lwc1 $f1,distance.toinch.from.m
#multiply float values to get desired output
mul.s $f12,$f1,$f11
#Print answer in float
li $v0,2
syscall
#Print to move pointer on nextline
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
##############################################################################################
########################         Same Process is          ####################################
########################          Continued in             ################################### 
########################          Whole Program           ####################################
##############################################################################################
#
#
#
kilometer:
#
#
#
la $a0,Distance_Enter
li $v0,4
Syscall
#
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert kilo-meter to m
la $a0,Distance_Meter
li $v0,4
syscall
lwc1 $f1,distance.tom
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert kilo-meter to Cm
la $a0,Distance_Cm
li $v0,4
syscall
lwc1 $f1,distance.tocm.from.km
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
#Convert meter to Inch
la $a0,Distance_Inch
li $v0,4
syscall
lwc1 $f1,distance.toinch.from.km
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Acceleration_Label:                       #Print Label
#
#
# Print Options
la $a0,Acceleration
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Acceleration_Label
beq $s0,$t1,m.s.2
beq $s0,$t2,km.s.2
bgt $s0,$t0,Acceleration_Label
#
#
#
m.s.2:
#
#
#
la $a0,Acceleration_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert meter/sec^2 to km/sec^2
la $a0,Acceleration_Kms2
li $v0,4
syscall
lwc1 $f1,acceleartion.tokms2
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
km.s.2:
#
#
#
la $a0,Acceleration_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert km/sec^2 to meter/sec^2
la $a0,Acceleration_Ms2
li $v0,4
syscall
lwc1 $f1,acceleration.toms2
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Area_Label:                               #Print Label
#
#
## Print Options
la $a0,Area
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Area_Label
beq $s0,$t1,m.2
beq $s0,$t2,km.2
bgt $s0,$t0,Area_Label
#
#
#
m.2:
#
#
#
la $a0,Area_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert meter^2 to km^2
la $a0,Area_Km2
li $v0,4
syscall
lwc1 $f1,area.tokm2
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
km.2:
#
#
#
la $a0,Area_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert kilo-meter^2 to meter^2
la $a0,Area_M2
li $v0,4
syscall
lwc1 $f1,area.tom2
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Temperature_Label:                        #Print Label
# Print Options
la $a0,Temperature
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Temperature_Label
beq $s0,$t1,k
beq $s0,$t2,c
bgt $s0,$t0,Temperature_Label
#
#
#
k:
#
#
#
la $a0,Temperature_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert k to c
la $a0,Temperature_C
li $v0,4
syscall
lwc1 $f1,temperature.toc
sub.s $f12,$f11,$f1
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
c:
#
#
#
la $a0,Temperature_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert k to c
la $a0,Temperature_K
li $v0,4
syscall
lwc1 $f1,temperature.tok
add.s $f12,$f11,$f1
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Weight_Label:                             #Print Label
# Print Options
la $a0,Weight
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Weight_Label
beq $s0,$t1,kg
beq $s0,$t2,g
bgt $s0,$t0,Weight_Label
#
#
#
kg:
#
#
#
la $a0,Weight_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert kg to g
la $a0,Weight_G
li $v0,4
syscall
lwc1 $f1,weight.tog
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert kg to oz
la $a0,Weight_Oz
li $v0,4
syscall
lwc1 $f1,weight.tooz.fromkg
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert Kg to lb
la $a0,Weight_Lb
li $v0,4
syscall
lwc1 $f1,weight.tolb.fromkg
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
g:
#
#
#
la $a0,Area_Enter
li $v0,4
Syscall
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert g to Kg
la $a0,Weight_Kg
li $v0,4
syscall
lwc1 $f1,weight.tokg
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert g to Oz
la $a0,Weight_Oz
li $v0,4
syscall
lwc1 $f1,weight.tooz.fromg
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert g to lb
la $a0,Weight_Lb
li $v0,4
syscall
lwc1 $f1,weight.tolb.fromg
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Pressure_Label:                           #Print Label
#
#
#
# Print Options
la $a0,Pressure
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Pressure_Label
beq $s0,$t1,pa
beq $s0,$t2,atm
bgt $s0,$t0,Pressure_Label
#
#
#
pa:
#
#
#
la $a0,Pressure_Enter
li $v0,4
Syscall
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert pa to atm
la $a0,Pressure_Atm
li $v0,4
syscall
lwc1 $f1,pressure.toatm
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert pa to mmHg
la $a0,Pressure_Mmhg
li $v0,4
syscall
lwc1 $f1,pressure.tommhg.frompa
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
atm:
#
#
#
la $a0,Pressure_Enter
li $v0,4
Syscall
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert atm to pa
la $a0,Pressure_Pa
li $v0,4
syscall
lwc1 $f1,pressure.topa
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert atm to mmhg
la $a0,Pressure_Mmhg
li $v0,4
syscall
lwc1 $f1,pressure.tommhg.fromatm
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Speed_Label:                              #Print Label
# Print Options
#
#
la $a0,Speed
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Speed_Label
beq $s0,$t1,m.s
beq $s0,$t2,km.h
bgt $s0,$t0,Speed_Label
#
#
#
m.s:
#
#
#
la $a0,Speed_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert meter/sec to kilo-meter/hour
la $a0,Speed_Kmh
li $v0,4
syscall
lwc1 $f1,speed.tokmh
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
km.h:
#
#
#
la $a0,Speed_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert meter/sec to kilo-meter/hour
la $a0,Speed_Ms
li $v0,4
syscall
lwc1 $f1,speed.toms
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
Time_Label:                               #Print Label
# Print Options
la $a0,Time
li $v0,4
syscall
# Input integer in $s0
li $v0,5
syscall
move $s0,$v0
blez $s0,Time_Label
beq $s0,$t1,s
beq $s0,$t2,min
beq $s0,$t3,hr
bgt $s0,$t0,Time_Label
#
#
#
s:
#
#
#
la $a0,Time_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert sec to min
la $a0,Time_M
li $v0,4
syscall
lwc1 $f1,time.tom.froms
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert sec to hr
la $a0,Time_H
li $v0,4
syscall
lwc1 $f1,time.tohr.froms
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
hr:
#
#
#
la $a0,Time_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert hr to min
la $a0,Time_M
li $v0,4
syscall
lwc1 $f1,time.tom.fromh
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert hr to sec
la $a0,Time_S
li $v0,4
syscall
lwc1 $f1,time.tos.fromh
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
#
#
min:           
#
#
#
la $a0,Time_Enter
li $v0,4
Syscall
#
li $v0,6
syscall
add.s $f11,$f0,$f4
# Convert min to hr
la $a0,Time_H
li $v0,4
syscall
lwc1 $f1,time.tohr.fromm
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
# Convert min to sec
la $a0,Time_S
li $v0,4
syscall
lwc1 $f1,time.tos.fromm
mul.s $f12,$f1,$f11
li $v0,2
syscall
la $a0,Nextline
li $v0,4
syscall
                  # jump to main unconditionally
j main
#Exit
#li $v0,10
#syscall
#
########
################
########################
################################
#######################################    @IAMUZAIRMEHMOOD
########################################
################################
########################
################
########
#