# space
ui_print " "

# var
UID=`id -u`
[ ! "$UID" ] && UID=0

# log
if [ "$BOOTMODE" != true ]; then
  FILE=/data/media/"$UID"/$MODID\_recovery.log
  ui_print "- Log will be saved at $FILE"
  exec 2>$FILE
  ui_print " "
fi

# optionals
OPTIONALS=/data/media/"$UID"/optionals.prop
if [ ! -f $OPTIONALS ]; then
  touch $OPTIONALS
fi

# debug
if [ "`grep_prop debug.log $OPTIONALS`" == 1 ]; then
  ui_print "- The install log will contain detailed information"
  set -x
  ui_print " "
fi

# recovery
if [ "$BOOTMODE" != true ]; then
  MODPATH_UPDATE=`echo $MODPATH | sed 's|modules/|modules_update/|g'`
  rm -f $MODPATH/update
  rm -rf $MODPATH_UPDATE
fi

# run
. $MODPATH/function.sh

# info
MODVER=`grep_prop version $MODPATH/module.prop`
MODVERCODE=`grep_prop versionCode $MODPATH/module.prop`
ui_print " ID=$MODID"
ui_print " Version=$MODVER"
ui_print " VersionCode=$MODVERCODE"
if [ "$KSU" == true ]; then
  ui_print " KSUVersion=$KSU_VER"
  ui_print " KSUVersionCode=$KSU_VER_CODE"
  ui_print " KSUKernelVersionCode=$KSU_KERNEL_VER_CODE"
else
  ui_print " MagiskVersion=$MAGISK_VER"
  ui_print " MagiskVersionCode=$MAGISK_VER_CODE"
fi
ui_print " "


# sepolicy
FILE=$MODPATH/sepolicy.rule
DES=$MODPATH/sepolicy.pfsd
if [ "`grep_prop sepolicy.sh $OPTIONALS`" == 1 ]\
&& [ -f $FILE ]; then
  mv -f $FILE $DES
fi

# cleaning
ui_print "- Cleaning..."
remove_sepolicy_rule
ui_print " "

# function
patch_floating_feature() {
NAME2=\<$NAME\>TRUE
NAME3=\<$NAME\>FALSE
sed -i "s|$NAME2|$NAME3|g" $FILE
}

# features
FILE=`find $MODPATH/system -type f -name floating_feature.xml`
if [ "`grep_prop oneui.features $OPTIONALS`" == 0 ]; then
  ui_print "- Does not use One UI features"
  rm -f $MODPATH/system/etc/permissions/com.* $FILE
  ui_print " "
elif [ "`grep_prop oneui.dark_background $OPTIONALS`" == 1 ]; then
  ui_print "- Using dark background"
  NAME=SEC_FLOATING_FEATURE_GRAPHICS_SUPPORT_3D_SURFACE_TRANSITION_FLAG
  patch_floating_feature
  NAME=SEC_FLOATING_FEATURE_GRAPHICS_SUPPORT_CAPTURED_BLUR
  patch_floating_feature
  NAME=SEC_FLOATING_FEATURE_GRAPHICS_SUPPORT_PARTIAL_BLUR
  patch_floating_feature
  ui_print " "
fi

# display device type
FILE=$MODPATH/service.sh
DDT=`grep_prop oneui.ddt $OPTIONALS`
if [ "$DDT" ]; then
  ui_print "- Sets display device type to $DDT"
  sed -i "s|#resetprop -n ro.samsung.display.device.type 0|resetprop -n ro.samsung.display.device.type $DDT|g" $FILE
  ui_print " "
fi







