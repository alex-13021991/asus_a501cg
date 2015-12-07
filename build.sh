#!/bin/sh

mkdir -p ~/asus_a501cg/build
mkdir -p ~/asus_a501cg/out
rm ~/asus_a501cg/build/bzImage
make -j5 -f KernelMakefile TARGET_DEVICE=a500cg build_bzImage
find ~/asus_a501cg/out/a500cg -type f -name bzImage -exec cp {} ~/asus_a501cg/build/ \;
rm -rf ~/asus_a501cg/out/a500cg
