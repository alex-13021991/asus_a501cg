#!/bin/sh

mkdir -p ~/asus_a501cg/build
mkdir -p ~/asus_a501cg/out
mkdir -p ~/asus_a501cg/build/modules
make -j5 -f KernelMakefile build_bzImage
make -j5 -f KernelMakefile modules_install
find ~/asus_a501cg/out/a500cg/linux/kernel/arch/x86/boot -type f -name bzImage -exec cp {} ~/asus_a501cg/build/ \;
find ~/asus_a501cg/out/a500cg/linux/kernel/modules_install/lib/modules -type f -name *.ko -exec cp {} ~/asus_a501cg/build/modules/ \;
rm -rf ~/asus_a501cg/out
mkdir -p ~/asus_a501cg/boot_img_tool/boot_
cp -Rv ~/asus_a501cg/other/ramdisk/* boot_img_tool/boot_/
cp -v ~/asus_a501cg/build/bzImage boot_img_tool/boot_/PARTS/BZIMAGE
cp -Rv ~/asus_a501cg/build/modules/* boot_img_tool/boot_/ramdisk/lib/modules/
cd boot_img_tool
wine AndImgTool.exe boot_ boot.img
cd ~/asus_a501cg/
mv ~/asus_a501cg/boot_img_tool/boot.img ~/asus_a501cg/build/
rm ~/asus_a501cg/boot_img_tool/boot_
rm ~/asus_a501cg/build/bzImage
rm -rf ~/asus_a501cg/build/modules
