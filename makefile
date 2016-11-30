#
## Makefile for nexus 5X
#
#
## The original zip file, MUST be specified by each product
local-zip-file := stockrom.zip

# All vendor apks needed
local-phone-apps := NfcNci PacProcessor CertInstaller KeyChain \
	Stk qcrilmsgtunnel TimeService UserDictionaryProvider Bluetooth BluetoothMidiService

local-phone-priv-apps := Shell FusedLocation ProxyHandler ExternalStorageProvider \
	SharedStorageBackup DMService ConnMO DiagMon DCMO InputDevices CellBroadcastReceiver \
	BackupRestoreConfirmation 

local-miui-modified-apps := 

local-miui-removed-apps := 

local-density := XXHDPI
local-target-bit := 64

include $(PORT_BUILD)/porting.mk

pre-zip-misc:
	
