#!/bin/bash

cd /sys/class/backlight/intel_backlight
CURR=$(< brightness)
echo $CURR
expr $CURR - 100
echo $CURR
