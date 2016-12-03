#
## Makefile for nexus 5X
#
#
## The original zip file, MUST be specified by each product
local-zip-file := stockrom.zip

PORT_PRODUCT = bullhead_global

# All vendor apks needed
local-phone-apps := NfcNci PacProcessor CertInstaller KeyChain \
	Stk qcrilmsgtunnel TimeService UserDictionaryProvider Bluetooth BluetoothMidiService

local-phone-priv-apps := Shell FusedLocation ProxyHandler ExternalStorageProvider \
	SharedStorageBackup DMService ConnMO DiagMon DCMO InputDevices CellBroadcastReceiver \
	BackupRestoreConfirmation ViPER4AndroidFX-2.4.0.1 MusicFX

local-miui-modified-apps := InCallUI

local-miui-removed-apps := SogouInput FM MiuiSuperMarket Email GameCenter

local-density := XXHDPI
local-target-bit := 64

include $(PORT_BUILD)/porting.mk

pre-zip-misc:
	@echo copy files
	cp -rf extras/runme.sh $(ZIP_DIR)/
	chmod 777 -R $(ZIP_DIR)/runme.sh
	echo "mount("ext4", "EMMC", "/dev/block/platform/soc.0/f9824900.sdhci/by-name/system", "/system", "");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "mount("ext4", "EMMC", "/dev/block/platform/soc.0/f9824900.sdhci/by-name/userdata", "/data", "");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_perm_recursive(0, 0, 0755, 0755, "/system/addon.d");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_perm_recursive(0, 0, 0755, 0755, "/system/su.d");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "package_extract_file("runme.sh", "/tmp/runme.sh");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "set_perm(0, 0, 0777, "/tmp/runme.sh");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "run_program("/tmp/runme.sh");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "delete("/tmp/runme.sh");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "unmount("/data");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	echo "unmount("/system");" >> $(ZIP_DIR)/META-INF/com/google/android/updater-script
	cp -rf extras/system/* $(ZIP_DIR)/system/
	cp -rf extras/data/* $(ZIP_DIR)/data/

