#!/sbin/busybox sh
LD_LIBRARY_PATH=/system/lib:/system/lib/hw
export TOUCH_CONF_DIR=/mnt/factory/touchscreen
/system/bin/rm_ts_wrapper
