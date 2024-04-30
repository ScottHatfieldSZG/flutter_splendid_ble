# Changelog

All notable changes to the `flutter_splendid_ble` plugin will be documented in this file.

## [0.1.0] 2023/10/07

- Initial support for Bluetooth operations on Android:
    - Bluetooth status checking.
    - Emitting current Bluetooth status.
    - Bluetooth device scanning.
    - Bluetooth device connection handling.
    - Bluetooth service and characteristic discovery and subscription.
    - Reading from Bluetooth characteristics.
    - Writing to Bluetooth characteristics.
    - Terminating a connection to a BLE device.
- Android example application to demonstrate basic usage.
- Comprehensive documentation for Android functionality.

## [0.2.0] 2023/11/02

- Finalized support for Android.
- Added support for Bluetooth operations MacOS:
    - Bluetooth status checking.
    - Emitting current Bluetooth status.
    - Bluetooth device scanning.
    - Bluetooth device connection handling.
    - Bluetooth service and characteristic discovery and subscription.
    - Reading from Bluetooth characteristics.
    - Writing to Bluetooth characteristics.
    - Terminating a connection to a BLE device.
- Added MacOS support to the example application.
- Comprehensive documentation for MacOS functionality.
- Added automated test for all plugin methods.

## [0.3.0] 2023/11/07

- Added support for Bluetooth operations on iOS:
    - Bluetooth status checking.
    - Emitting current Bluetooth status.
    - Bluetooth device scanning.
    - Bluetooth device connection handling.
    - Bluetooth service and characteristic discovery and subscription.
    - Reading from Bluetooth characteristics.
    - Writing to Bluetooth characteristics.
    - Terminating a connection to a BLE device.
- Added iOS support to the example application.
- Comprehensive documentation for iOS functionality.
- Added extensive usage/tutorials content to README.

## [0.4.0] 2023/11/08

- Fixed linter issues
- Updated documentation, especially around handling of streams

## [0.4.1] 2023/11/08

- Cosmetic updates to README

## [0.4.2] 2023/11/08

- README updates

## [0.5.0] 2023/11/17

- Updated example app
- Wrote extensive tutorial article

## [0.6.0] 2023/12/16

- Updated dependencies
- Updated scan filtering by UUID

## [0.7.0] 2023/01/11

- Updated dependencies
- Updated documentation
- Updated formatting to meet Dart standards

## [0.8.0] 2023/01/15

- Clear scan results when restarting BLE scan
- Updated documentation for example app

## [1.0.0] 2023/01/24

- Fixed bug causing failure to check Bluetooth adapter status on MacOS
- Added support for BLE peripheral mode for iOS

### Breaking Changes

- Renamed FlutterSplendidBle to SplendidBleCentral as part of module division.
- Added SplendidBlePeripheral for BLE peripheral mode support on iOS.

### Migration Guide

1. **Class Name Change**: Update all references of FlutterSplendidBle to SplendidBleCentral in your
   code.