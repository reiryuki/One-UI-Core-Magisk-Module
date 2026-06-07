# One UI Core Magisk Module

## DISCLAIMER
- One UI blobs are owned by Samsung™.
- The MIT license specified here is for the Magisk Module only, not for One UI blobs.

## Descriptions
System core framework library of One UI ROM ported from Samsung Galaxy S10 (beyond1q) as a dependency of any One UI/Samsung Magisk Modules

## For Samsung Apps Porter
- You need to declare this line bellow in your app AndroidManifest.xml at `<application />` to use this One UI Core:

  `<uses-library android:name="oneui" android:required="false" />`

- Do not do above if your app has it's own library!
- Do not white list the library with your own Magisk Module /system/etc/permissions/ because there might be a conflict!

## Sources
- https://dumps.tadiphone.dev/dumps/samsung/beyond1q beyond1qltesq-user-11-RP1A.200720.012-G973USQU6GUH4-release-keys
- https://dumps.tadiphone.dev/dumps/samsung/t2s t2sxxx-user-12-SP1A.210812.016-G996BXXS3BUL1-release-keys
- https://dumps.tadiphone.dev/dumps/samsung/z3s z3sxxx-user-13-TP1A.220624.014-G988BXXUHHWF1-release-keys
- https://dumps.tadiphone.dev/dumps/samsung/pa2q pa2qsqw-user-15-AP3A.240905.015.A2-S936USQU1AYA1-release-keys
- https://dumps.tadiphone.dev/dumps/google/husky husky-user-15-AP3A.241001.005-12231455-release-keys
- /system/etc/permissions/: https://dumps.tadiphone.dev/dumps/samsung/z3s z3sxxx-user-13-TP1A.220624.014-G988BXXUHHWF1-release-keys
- floating_feature.xml: https://dumps.tadiphone.dev/dumps/samsung/pa2q pa2qsqw-user-15-AP3A.240905.015.A2-S936USQU1AYA1-release-keys

## Changelog

v2.5
- Fix crash in com.samsung.android.app.sharelive

v2.4
- Fix wrong target in latest KernelSU

v2.3
- Add new optional for foldable device

v2.2
- Add android.app.slice.widget classes to fix crashes while using Work Profile in One UI Home

v2.1
- Fix a crash

v2.0
- Add One UI Home 36 support
- Fix crashes

v1.9
- Add oneui.ddt optional

v1.8
- Fix a crash
- Disable dark background by default
- Add a new optional to enable dark background

v1.7
- WARNING!!! You have to update One UI Home or Sound Alive module to the latest version first before using this version, otherwise they will crash.
- Dark background
- Update floating_feature.xml from pa2qsqw-user-15-AP3A.240905.015.A2-S936USQU1AYA1-release-keys
- Fix crashes

v1.6
- Fix a crash

## Requirements
- NOT in One UI nor Touchwiz ROM
- Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings and install https://github.com/KernelSU-Modules-Repo/meta-overlayfs or https://github.com/KernelSU-Modules-Repo/magic_mount_rs or https://github.com/KernelSU-Modules-Repo/hybrid_mount first depending on ROM compatibility
- Install this module via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Install any One UI/Samsung Magisk Module which depends on this module
- Reboot

## Optionals
- https://t.me/ryukinotes/33
- Global: https://t.me/ryukinotes/35

## Troubleshootings
- https://t.me/ryukinotes/33
- Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
https://t.me/ryukinotes/25


