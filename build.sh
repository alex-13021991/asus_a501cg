#!/bin/sh

rm /home/dell/asus_a501cg/build/bzImage
make -j5 -f KernelMakefile TARGET_DEVICE=a500cg build_bzImage
find /home/dell/asus_a501cg/out/a500cg -type f -name bzImage -exec cp {} /home/dell/asus_a501cg/build/ \;
rm -rf /home/dell/asus_a501cg/out/a500cg
