#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      עומר מרואני
#
# Created:     30/04/2025
# Copyright:   (c) עומר מרואני 2025
# Licence:     <your licence>
#-------------------------------------------------------------------------------

def main():
    pass

if __name__ == '__main__':
    main()




import os




def convert_hex(num):
    num = hex( int(num) )
    if num[0] == "-":
        num = num[3:]
        num = hex( (~int(num,16) + 1) & 0xFF  )[2:]
    else:
        num = num[2:]

    return num



def MIFGenerator(file_name,rgb_8bit_data,address_depth):

    with open(file_name[:-4]+".mif", "w") as file:

        DEPTH = address_depth


        file.write(f"DEPTH =  {DEPTH} ;\n")
        file.write("WIDTH = 8;\n")
        file.write("ADDRESS_RADIX = DEC;\n")
        file.write("DATA_RADIX = HEX;\n")
        file.write("CONTENT BEGIN\n")


        for i in range(len(rgb_8bit_data)):
            value =  rgb_8bit_data[i]
            file.write(f"  {i:02} : {value:02X};\n")


        for i in range(len(rgb_8bit_data), DEPTH):
            value=  int(str(0),16)
            file.write(f"  {i:02} : {value:02X};\n")



        file.write("END;\n")





