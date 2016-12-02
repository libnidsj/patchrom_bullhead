#!/sbin/sh
OUTFD=$2
ZIP=$3

SYSTEMLIB=/system/lib

ui_print() {
  echo -n -e "ui_print $1\n" > /proc/self/fd/$OUTFD
  echo -n -e "ui_print\n" > /proc/self/fd/$OUTFD
}

ch_con() {
  LD_LIBRARY_PATH=$SYSTEMLIB /system/toolbox chcon -h u:object_r:system_file:s0 $1
  LD_LIBRARY_PATH=$SYSTEMLIB /system/bin/toolbox chcon -h u:object_r:system_file:s0 $1
  chcon -h u:object_r:system_file:s0 $1
  LD_LIBRARY_PATH=$SYSTEMLIB /system/toolbox chcon u:object_r:system_file:s0 $1
  LD_LIBRARY_PATH=$SYSTEMLIB /system/bin/toolbox chcon u:object_r:system_file:s0 $1
  chcon u:object_r:system_file:s0 $1
}

ch_con_ext() {
  LD_LIBRARY_PATH=$SYSTEMLIB /system/toolbox chcon $2 $1
  LD_LIBRARY_PATH=$SYSTEMLIB /system/bin/toolbox chcon $2 $1
  chcon $2 $1
}

ln_con() {
  LD_LIBRARY_PATH=$SYSTEMLIB /system/toolbox ln -s $1 $2
  LD_LIBRARY_PATH=$SYSTEMLIB /system/bin/toolbox ln -s $1 $2
  ln -s $1 $2
  ch_con $2
}

set_perm() {
  chown $1.$2 $4
  chown $1:$2 $4
  chmod $3 $4
  ch_con $4
  ch_con_ext $4 $5
}

cp_perm() {
  rm $5
  if [ -f "$4" ]; then
    cat $4 > $5
    set_perm $1 $2 $3 $5 $6
  fi
}

cat /system/bin/toolbox > /system/toolbox
chmod 0755 /system/toolbox
ch_con /system/toolbox

# Normal/vendor config locations
CONFIG_FILE=/system/etc/audio_effects.conf
VENDOR_CONFIG=/system/vendor/etc/audio_effects.conf

# If vendor exists, patch it
if [ -f $VENDOR_CONFIG ];
then
	# Remove library & effect
 sed -i '/v4a_fx {/,/}/d' $VENDOR_CONFIG

 # Remove library & effect
 sed -i '/v4a_standard_fx {/,/}/d' $VENDOR_CONFIG

 # Remove library & effect
 sed -i '/dap {/,/}/d' $VENDOR_CONFIG
  fi
 
 # Remove library & effect
 sed -i '/v4a_fx {/,/}/d' $CONFIG_FILE

 # Remove library & effect
 sed -i '/v4a_standard_fx {/,/}/d' $CONFIG_FILE

 # Remove library & effect
 sed -i '/dap {/,/}/d' $CONFIG_FILE

# Normal/vendor config locations
CONFIG_FILE=/system/etc/audio_effects.conf
VENDOR_CONFIG=/system/vendor/etc/audio_effects.conf
# If vendor exists, patch it
if [ -f $VENDOR_CONFIG ];
then
 # Add libary
	sed -i 's/^libraries {/libraries {\n  v4a_fx {\n    path \/system\/lib\/soundfx\/libv4a_fx_ics.so\n  }/g' $VENDOR_CONFIG
	
	# Add effect
	sed -i 's/^effects {/effects {\n  v4a_standard_fx {\n    library v4a_fx\n    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n  }/g' $VENDOR_CONFIG

 # Add library
 sed -i 's/^libraries {/libraries {\n  dap {\n    path \/system\/lib\/soundfx\/libswdap-mod.so\n  }/g' $VENDOR_CONFIG
	
	# Add effect
	sed -i 's/^effects {/effects {\n  dap {\n    library dap\n    uuid 9d4921da-8225-4f29-aefa-39537a041337\n  }/g' $VENDOR_CONFIG
 fi

 # Add libary
 sed -i 's/^libraries {/libraries {\n  v4a_fx {\n    path \/system\/lib\/soundfx\/libv4a_fx_ics.so\n  }/g' $CONFIG_FILE

 # Add effect
 sed -i 's/^effects {/effects {\n  v4a_standard_fx {\n    library v4a_fx\n    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n  }/g' $CONFIG_FILE

 # Add libary
 sed -i 's/^libraries {/libraries {\n  dap {\n    path \/system\/lib\/soundfx\/libswdap-mod.so\n  }/g' $CONFIG_FILE

 # Add effect
 sed -i 's/^effects {/effects {\n  dap {\n    library dap\n    uuid 9d4921da-8225-4f29-aefa-39537a041337\n  }/g' $CONFIG_FILE

# Normal/vendor config locations
CONFIG_FILE=/system/etc/htc_audio_effects.conf
VENDOR_CONFIG=/vendor/etc/audio_effects.conf
# If vendor exists, patch it
if [ -f $VENDOR_CONFIG ];
then
 # Remove library & effect
 sed -i '/v4a_fx {/,/}/d' $VENDOR_CONFIG

 # Remove library & effect
 sed -i '/v4a_standard_fx {/,/}/d' $VENDOR_CONFIG

 # Remove library & effect
 sed -i '/dap {/,/}/d' $VENDOR_CONFIG
 fi

 # Remove library & effect
 sed -i '/v4a_fx {/,/}/d' $CONFIG_FILE

 # Remove library & effect
 sed -i '/v4a_standard_fx {/,/}/d' $CONFIG_FILE

 # Remove library & effect
 sed -i '/dap {/,/}/d' $CONFIG_FILE

# Normal/vendor config locations
CONFIG_FILE=/system/etc/htc_audio_effects.conf
VENDOR_CONFIG=/vendor/etc/audio_effects.conf
# If vendor exists, patch it
if [ -f $VENDOR_CONFIG ];
then
 # Add libary
	sed -i 's/^libraries {/libraries {\n  v4a_fx {\n    path \/system\/lib\/soundfx\/libv4a_fx_ics.so\n  }/g' $VENDOR_CONFIG
	
	# Add effect
	sed -i 's/^effects {/effects {\n  v4a_standard_fx {\n    library v4a_fx\n    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n  }/g' $VENDOR_CONFIG

 # Add library
 sed -i 's/^libraries {/libraries {\n  dap {\n    path \/system\/lib\/soundfx\/libswdap-mod.so\n  }/g' $VENDOR_CONFIG
	
	# Add effect
	sed -i 's/^effects {/effects {\n  dap {\n    library dap\n    uuid 9d4921da-8225-4f29-aefa-39537a041337\n  }/g' $VENDOR_CONFIG
 fi

 # Add libary
	sed -i 's/^libraries {/libraries {\n  v4a_fx {\n    path \/system\/lib\/soundfx\/libv4a_fx_ics.so\n  }/g' $CONFIG_FILE
	
	# Add effect
	sed -i 's/^effects {/effects {\n  v4a_standard_fx {\n    library v4a_fx\n    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n  }/g' $CONFIG_FILE

 # Add libary
 sed -i 's/^libraries {/libraries {\n  dap {\n    path \/system\/lib\/soundfx\/libswdap-mod.so\n  }/g' $CONFIG_FILE

 # Add effect
 sed -i 's/^effects {/effects {\n  dap {\n    library dap\n    uuid 9d4921da-8225-4f29-aefa-39537a041337\n  }/g' $CONFIG_FILE

#!/sbin/sh

sed -i '/deep_buffer {/,/}/d' /system/etc/audio_policy.conf
