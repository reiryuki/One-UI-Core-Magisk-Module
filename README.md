# One UI Core Magisk Module

## DISCLAIMER
- One UI blobs are owned by Samsung™.
- The MIT license specified here is for the Magisk Module only, not for One UI blobs.

## Descriptions
- System core framework library of One UI ROM ported from Samsung Galaxy S10 (beyond1q) as a dependency of any One UI/Samsung Magisk Module

## For Samsung App Porter
- You need to declare this line bellow in your app AndroidManifest.xml after `<application />` to use this One UI Core:

  `<uses-library android:name="oneui" android:required="false" />`

- Do not do above if your app have it's own library!
- Do not white list the library with your own Magisk Module /system/etc/permissions/ because there might be a conflict.

## Sources
- https://dumps.tadiphone.dev/dumps/samsung/beyond1q beyond1qltesq-user-11-RP1A.200720.012-G973USQU6GUH4-release-keys
- https://dumps.tadiphone.dev/dumps/samsung/t2s t2sxxx-user-12-SP1A.210812.016-G996BXXS3BUL1-release-keys
- https://dumps.tadiphone.dev/dumps/samsung/z3s z3sxxx-user-13-TP1A.220624.014-G988BXXUHHWF1-release-keys
- /system/etc/permissions/: https://dumps.tadiphone.dev/dumps/samsung/z3s z3sxxx-user-13-TP1A.220624.014-G988BXXUHHWF1-release-keys
- floating_feature.xml: https://github.com/ItsLynix/samsung_a53x_dump a53xnaxx-user-13-TP1A.220624.014-A536BXXU4BVJG-release-keys

## Requirements
- NOT in One UI nor Touchwiz ROM
- Magisk or KernelSU installed

## Installation Guide & Download Link
- Install this module https://www.pling.com/p/2083894/ via Magisk app or KernelSU app or Recovery if Magisk installed
- Install any One UI/Samsung Magisk Module which depends on this module
- Reboot

## Tested on
- Android 11 DotOS ROM
- Android 12 AncientOS ROM
- Android 12.1 Nusantara ROM
- Android 13 AOSP ROM & CrDroid ROM
- Android 14 LineageOS ROM

## Optionals & Troubleshootings
- https://t.me/androidryukimodsdiscussions/46153
- Global: https://t.me/androidryukimodsdiscussions/60861
- Global: https://t.me/androidryukimodsdiscussions/29836

## Support & Bug Report
- https://t.me/androidryukimodsdiscussions/2618
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
- https://t.me/androidryukimodsdiscussions/2619


