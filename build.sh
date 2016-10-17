#!/bin/sh

mkdir -p ~/asus_a501cg/build
mkdir -p ~/asus_a501cg/out
rm ~/asus_a501cg/build/bzImage
rm -rf ~/asus_a501cg/build/modules
mkdir -p ~/asus_a501cg/build/modules
make -j5 -f KernelMakefile build_bzImage
make -j5 -f KernelMakefile modules_install
find ~/asus_a501cg/out/a500cg/linux/kernel/arch/x86/boot -type f -name bzImage -exec cp {} ~/asus_a501cg/build/ \;
find ~/asus_a501cg/out/a500cg/linux/kernel/modules_install/lib/modules -type f -name *.ko -exec cp {} ~/asus_a501cg/build/modules/ \;
rm -rf ~/asus_a501cg/out
