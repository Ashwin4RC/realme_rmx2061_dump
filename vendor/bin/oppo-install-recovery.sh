#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:d4c72cab01e52eb12f93a05db3a5a422ade43be1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:db7b1d9e60d8a3b5f13f6c4486f6822fe4231dd4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:d4c72cab01e52eb12f93a05db3a5a422ade43be1 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
