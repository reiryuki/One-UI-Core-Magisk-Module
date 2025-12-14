MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug.log
set -x

# var
API=`getprop ro.build.version.sdk`

# property
PROP=ro.build.version.sep
if [ ! "`getprop $PROP`" ]; then
  if [ "$API" == 26 ]; then
    resetprop -n $PROP 90000
  elif [ "$API" == 27 ]; then
    resetprop -n $PROP 90500
  elif [ "$API" == 28 ]; then
    resetprop -n $PROP 100000
  elif [ "$API" == 29 ]; then
    resetprop -n $PROP 110500
  elif [ "$API" == 30 ]; then
    resetprop -n $PROP 120500
  elif [ "$API" == 31 ]; then
    resetprop -n $PROP 130000
  elif [ "$API" == 32 ]; then
    resetprop -n $PROP 130500
  elif [ "$API" == 33 ]; then
    resetprop -n $PROP 140100
  elif [ "$API" == 34 ]; then
    resetprop -n $PROP 150000
  elif [ "$API" == 35 ]; then
    resetprop -n $PROP 160000
  elif [ "$API" -ge 36 ]; then
    resetprop -n $PROP 170000
  fi
fi
PROP=ro.build.version.sem
if [ ! "`getprop $PROP`" ]; then
  if [ "$API" == 26 ]; then
    resetprop -n $PROP 2601
  elif [ "$API" == 27 ]; then
    resetprop -n $PROP 2701
  elif [ "$API" == 28 ]; then
    resetprop -n $PROP 2801
  elif [ "$API" == 29 ]; then
    resetprop -n $PROP 2903
  elif [ "$API" == 30 ]; then
    resetprop -n $PROP 3002
  elif [ "$API" == 31 ]; then
    resetprop -n $PROP 3101
  elif [ "$API" == 32 ]; then
    resetprop -n $PROP 3201
  elif [ "$API" == 33 ]; then
    resetprop -n $PROP 3301
  elif [ "$API" == 34 ]; then
    resetprop -n $PROP 3401
  elif [ "$API" == 35 ]; then
    resetprop -n $PROP 3501
  elif [ "$API" -ge 36 ]; then
    resetprop -n $PROP 3601
  fi
fi
PROP=ro.product_ship
if [ ! "`getprop $PROP`" ]; then
  resetprop -n $PROP true
fi









