#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/soc.0/f9824900.sdhci/by-name/recovery:12846314:6edad90a2703c4308172b5d42226e2e419ac96b1; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot:11769062:eb12bf58a0733af209275875f5d30127a6fdf1c0 EMMC:/dev/block/platform/soc.0/f9824900.sdhci/by-name/recovery 6edad90a2703c4308172b5d42226e2e419ac96b1 12846314 eb12bf58a0733af209275875f5d30127a6fdf1c0:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
