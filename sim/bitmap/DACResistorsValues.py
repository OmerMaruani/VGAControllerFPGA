#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      עומר מרואני
#
# Created:     20/05/2025
# Copyright:   (c) עומר מרואני 2025
# Licence:     <your licence>
#-------------------------------------------------------------------------------

def main():
    pass

if __name__ == '__main__':
    main()


rMSB= 544
rMID= 1200
rLSB= 2400
rTER= 75

rMSB= 500
rMID= 1000
rLSB= 2000
rTER= 75



def function1(vLSB,vMID,vMSB):
    mone = (vMSB/rMSB) + (vMID/rMID) +(vLSB/rLSB) # Comment out to use 2bits only
    return mone/ mehane

def calc_voltage(i,bit_index):
    if ( i >> bit_index) & 1: return 3.3
    else: return 0


mehane = (1/rMSB) + (1/rMID) +(1/rLSB)+ (1/rTER) # Comment out to use 2bits only


voltage_results = []
for i in range(8):
    vLSB = calc_voltage(i,0)
    vMID = calc_voltage(i,1)
    vMSB = calc_voltage(i,2)
    voltage = function1(vLSB,vMID,vMSB)
    #print(f" {i:03b}: {voltage}")
    voltage_results.append(round(voltage,2))

print(voltage_results)





