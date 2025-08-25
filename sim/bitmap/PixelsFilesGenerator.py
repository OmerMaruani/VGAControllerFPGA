#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      עומר מרואני
#
# Created:     22/05/2025
# Copyright:   (c) עומר מרואני 2025
# Licence:     <your licence>
#-------------------------------------------------------------------------------

def main():
    pass

if __name__ == '__main__':
    main()


from ConvertImageToPixels import PixelGenerator
from LinesSeparatedGenerator import LinesSeparatedGenerator
from MIFGenerator import MIFGenerator






image_name = "bird_image.png"
rgb_8bit_data = PixelGenerator(image_name, 320, 240, contrast_factor= 1.5, brightness_factor = 1.2)

#LinesSeparatedGenerator(image_name,rgb_8bit_data)

MIFGenerator(image_name,rgb_8bit_data, pow(2,18))







