#!/bin/sh

mkdir -p ~/asus_a501cg/build
mkdir -p ~/asus_a501cg/out
rm ~/asus_a501cg/build/bzImage
rm -rf ~/asus_a501cg/build/lib
make -j5 -f KernelMakefile modules_install
find ~/asus_a501cg/out/a500cg -type f -name bzImage -exec cp {} ~/asus_a501cg/build/ \;
mkdir -p ~/asus_a501cg/build/lib
mkdir -p ~/asus_a501cg/build/lib/modules
find ~/asus_a501cg/out/a500cg -type f -name atomisp-css2300.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name bcm_bt_lpm.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name bcm43362.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name cfg80211.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name gc2155.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name hm2056.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name imx111.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name imx219.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name kxtj9.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name mac80211.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name pnwdisp.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name pvrsgx.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name rmi4.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name rt8515.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name st_drv.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name t4k35_180.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name t4k35.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name test_nx.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name videobuf-core.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
find ~/asus_a501cg/out/a500cg -type f -name videobuf-vmalloc.ko -exec cp {} ~/asus_a501cg/build/lib/modules/ \;
mkdir -p ~/asus_a501cg/build/lib/other_modules
find ~/asus_a501cg/out/a500cg -type f -name *.ko -exec cp {} ~/asus_a501cg/build/lib/other_modules/ \;
rm -rf ~/asus_a501cg/out
