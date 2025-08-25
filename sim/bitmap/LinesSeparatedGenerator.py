#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      עומר מרואני
#
# Created:     06/04/2025
# Copyright:   (c) עומר מרואני 2025
# Licence:     <your licence>
#-------------------------------------------------------------------------------

def main():
    pass

if __name__ == '__main__':
    main()



def Decimal2HexConvertor(value):

    value = int(value)
    if value < 0:
        # For negative numbers, convert to two's complement in 8-bit
        return hex((value + 256) & 0x1FF)[2:].upper()  # Mask to ensure 8-bit, and remove the '0x'
    else:
        # For positive numbers, directly convert to hex
        return hex(value & 0x1FF)[2:].upper()  # Mask to ensure 8-bit, and remove the '0x'


def LinesSeparatedGenerator(file_name,rgb_8bit_data):
    with open(file_name[:-4]+"LinesSeparated"+ ".txt", 'w') as file:

        #print(len(rgb_8bit_data))
        for value in rgb_8bit_data:
            value = Decimal2HexConvertor(value)
            value += "\n"
            file.write(value)


