#!/bin/bash

rm *.img
rm zImage
echo "Old files removed"
echo "Specify kernel version:"
read ver2
kv=$ver2
echo "Copying kernel image from SimpleKernel/arch/arm/boot/"
cp /home/lozohcum/SimpleKernel/arch/arm/boot/zImage /home/lozohcum/SimpleKernel_boot/zImage
echo "Making boot image 'SimpleKernelX"${ver2}".img'"
python mkelf.py -o SimpleKernelX${ver2}.img zImage@0x00208000 sec1-0x01400000.bin@0x01400000,ramdisk sec2-0x00000000.bin@0x00000000,cmdline
echo "Boot image ready."

