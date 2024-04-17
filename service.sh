MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug.log
set -x

# var
API=`getprop ro.build.version.sdk`

# property
if [ "$API" == 26 ]; then
  resetprop -n ro.build.version.sem 2601
  resetprop -n ro.build.version.sep 90000
elif [ "$API" == 27 ]; then
  resetprop -n ro.build.version.sem 2701
  resetprop -n ro.build.version.sep 90500
elif [ "$API" == 28 ]; then
  resetprop -n ro.build.version.sem 2801
  resetprop -n ro.build.version.sep 100000
elif [ "$API" == 29 ]; then
  resetprop -n ro.build.version.sem 2903
  resetprop -n ro.build.version.sep 110500
elif [ "$API" == 30 ]; then
  resetprop -n ro.build.version.sem 3002
  resetprop -n ro.build.version.sep 120500
elif [ "$API" == 31 ]; then
  resetprop -n ro.build.version.sem 3101
  resetprop -n ro.build.version.sep 130000
elif [ "$API" == 32 ]; then
  resetprop -n ro.build.version.sem 3201
  resetprop -n ro.build.version.sep 130500
elif [ "$API" == 33 ]; then
  resetprop -n ro.build.version.sem 3301
  resetprop -n ro.build.version.sep 140100
elif [ "$API" -ge 34 ]; then
  resetprop -n ro.build.version.sem 3401
  resetprop -n ro.build.version.sep 150000
fi
resetprop -n ro.product_ship true








