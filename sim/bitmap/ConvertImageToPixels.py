#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      עומר מרואני
#
# Created:     11/05/2025
# Copyright:   (c) עומר מרואני 2025
# Licence:     <your licence>
#-------------------------------------------------------------------------------



from PIL import Image, ImageEnhance



# Resize image to 640x480 and load pixels
#image_name = "BirdImage.jpg"



BAYER_MATRIX = [
    [ 0,  8,  2, 10],
    [12,  4, 14,  6],
    [ 3, 11,  1,  9],
    [15,  7, 13,  5]
]


def ImageOpen(image_name,tuple_size, contrast_factor = 1.0, brightness_factor=1.0):
    img = Image.open(image_name)
    img = img.convert("RGB")
    img = img.resize( tuple_size )


    if brightness_factor != 1.0:
        enhancer = ImageEnhance.Brightness(img)
        img = enhancer.enhance(brightness_factor)

    if contrast_factor != 1.0:
        enhancer = ImageEnhance.Contrast(img)
        img = enhancer.enhance(contrast_factor)


    return img


def rgb888_to_rgb332(r,g,b):



    r3 = (r * 7) // 255  # round to 0–7
    g3 = (g * 7) // 255  # round to 0–7
    b2 = (b * 3) // 255  # round to 0–3

    return (r3 <<5) | (g3 << 2) | b2

def gamma_correct(value):
    return int(pow(value / 255.0, 1 / 2.2) * 255)

def apply_ordered_dither(r, g, b, x, y):
    threshold = BAYER_MATRIX[y % 4][x % 4] / 16.0
    r = min(255, r + int(threshold * 32))
    g = min(255, g + int(threshold * 32))
    b = min(255, b + int(threshold * 32))
    return r, g, b


def PixelGenerator(image_name, width = 320, height = 240, contrast_factor = 1.0, brightness_factor=1.0):


    img = ImageOpen(image_name, (width,height), contrast_factor, brightness_factor )
    rgb_8bit_data = []

    for y in range(height):
        for x in range(width):
            r,g,b = img.getpixel( (x,y) )
            r,g,b = apply_ordered_dither(r,g,b,x,y)
            value_8bit = rgb888_to_rgb332(r,g,b)
            rgb_8bit_data.append(value_8bit)


    # Padding in the MIFGenerator
    #for i in range(width*height, pow(2,18) ):  # Pad power
        #rgb_8bit_data.append(0)

    return rgb_8bit_data











###############3









# Preview image

def rgb332_to_rgb888(rgb332):
    r = ((rgb332 >> 5) & 0x07) * 255 // 7
    g = ((rgb332 >> 2) & 0x07) * 255 // 7
    b = (rgb332 & 0x03) * 255 // 3
    return r, g, b

def preview_rgb332_dithered(image_path, output_path=None, resize_to=(320, 240), brightness=1.0, contrast=1.0):
    img = Image.open(image_path).convert("RGB").resize(resize_to)

    if brightness != 1.0:
        img = ImageEnhance.Brightness(img).enhance(brightness)
    if contrast != 1.0:
        img = ImageEnhance.Contrast(img).enhance(contrast)

    w, h = img.size
    new_img = Image.new("RGB", (w, h))

    for y in range(h):
        for x in range(w):
            r, g, b = img.getpixel((x, y))
            r, g, b = apply_ordered_dither(r, g, b, x, y)
            value_8bit = rgb888_to_rgb332(r, g, b)
            r_out, g_out, b_out = rgb332_to_rgb888(value_8bit)
            new_img.putpixel((x, y), (r_out, g_out, b_out))

    new_img.show()

    if output_path:
        new_img.save(output_path)



if __name__ == '__main__':
    preview_rgb332_dithered("bird_image_2.png", output_path=None, brightness=1.1, contrast=1.1)



