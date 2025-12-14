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

# cleaning
ui_print "- Cleaning..."
remove_sepolicy_rule
ui_print " "

# function
floating_feature_false() {
NAME2=\<$NAME\>TRUE
NAME3=\<$NAME\>FALSE
sed -i "s|$NAME2|$NAME3|g" $FILE
}
floating_feature_true() {
NAME2=\<$NAME\>FALSE
NAME3=\<$NAME\>TRUE
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
  floating_feature_false
  NAME=SEC_FLOATING_FEATURE_GRAPHICS_SUPPORT_CAPTURED_BLUR
  floating_feature_false
  NAME=SEC_FLOATING_FEATURE_GRAPHICS_SUPPORT_PARTIAL_BLUR
  floating_feature_false
  ui_print " "
fi
if [ "`grep_prop oneui.foldable $OPTIONALS`" == 1 ]; then
  ui_print "- Activating foldable support"
  NAME=SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_FOLDABLE_TYPE_FOLD
  floating_feature_true
  NAME=SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_FOLDABLE_TYPE_FLIP
  floating_feature_true
  NAME=SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_HALF_FOLDED_MODE
  floating_feature_true
  ui_print " "
  if [ "`grep_prop oneui.foldable $OPTIONALS`" == 2 ]; then
    ui_print "- Activating multi fold support"
    NAME=SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_MULTI_FOLD
    floating_feature_true
    ui_print " "
  fi
fi







