@JS()
library central_js_interop;

import 'dart:async';
import 'package:js/js.dart';

/// This file provides JavaScript interop methods for interacting with the Web Bluetooth API on the global JS scope.
///
/// The methods in this class bridge between Dart and JavaScript, allowing the Flutter plugin to access and manipulate
/// web-specific Bluetooth functionalities. It leverages Dart's `js:dart` library to directly call JavaScript functions
/// and interact with the browser's Bluetooth capabilities, such as checking Bluetooth status, scanning for devices,
/// connecting to peripherals, and managing data communication.
///
/// Since these methods directly interfaces with JavaScript, they are annotated with `@JS`. All functions within this
/// file are external methods that correspond to JavaScript methods on the `window` object or other JavaScript objects
/// available in the browser context.

/// Checks the availability of the Bluetooth API on the device using the Web Bluetooth API.
@JS('navigator.bluetooth.getAvailability')
external Future<bool> getBluetoothAvailability();

/// Checks if the browser supports the `getDevieces` method from the  Web Bluetooth API. See
/// [https://developer.mozilla.org/en-US/docs/Web/API/Bluetooth/getDevices](https://developer.mozilla.org/en-US/docs/Web/API/Bluetooth/getDevices)
/// for more information.
@JS('Object.prototype.hasOwnProperty')
external bool hasBluetoothGetDevicesMethod();

/// Gets a list of device information for all Bluetooth devices that are currently connected to the browser.
@JS('navigator.bluetooth.getDevices')
external Future<List<dynamic>> getConnectedDevicesJs();
