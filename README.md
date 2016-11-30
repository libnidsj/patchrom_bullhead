# MIUI Sources for Nexus 5X (bullhead)

Downloads at http://forum.xda-developers.com/nexus-5x/development/unofficial-miui-8-marshmallow-nexus-5x-t3495869

If you want to build miui yourself using this repository, setup your linux for android build marshmallow with JDK7 and follow these commands:



- mkdir MIUI
- cd MIUI
- repo init -u git://github.com/MiCode/patchrom.git -b marshmallow
- repo sync
- git clone https://github.com/libnijunior/patchrom_bullhead -b mtc20k bullhead
- . build/envsetup.sh
- cd bullhead
- make fullota
- adb sideload out/fullota.zip



If you use this to build and want to publish your work, please give me the credits for the base.

If you know any way to solve bugs, please make an pull request and receive the credits.

If you have any problems with ROM build, I'm not here to help you, erverything that is on github was tested before.
