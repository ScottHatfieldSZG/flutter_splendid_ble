import 'package:flutter/material.dart';
import 'package:flutter_ble_example/screens/scan/scan_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io' show Platform;

import 'package:flutter_ble_example/screens/start_scan/start_scan_route.dart';
import 'package:flutter_ble_example/screens/start_scan/start_scan_view.dart';
import 'package:permission_handler/permission_handler.dart';

/// A controller for the [StartScanRoute] that manages the state and owns all business logic.
class StartScanController extends State<StartScanRoute> {
  /// Determines if Bluetooth permissions have been granted.
  ///
  /// A null value indicates that permissions have neither been granted nor denied. It is simply a mystery.
  bool? _permissionsGranted;

  bool? get permissionsGranted => _permissionsGranted;

  @override
  void initState() {
    if (Platform.isAndroid) {
      _requestAndroidPermissions();
    }

    super.initState();
  }

  /// Requests Bluetooth and location permissions.
  ///
  /// The user will be prompted to allow the app to use various Bluetooth features of their mobile device. These
  /// permissions must be granted for the app to function since its whole deal is doing Bluetooth stuff. The app
  /// will also request location permissions, which are necessary for performing a Bluetooth scan.
  Future<void> _requestAndroidPermissions() async {
    // Request the Bluetooth Scan permission
    PermissionStatus bluetoothScanPermissionStatus = await Permission.bluetoothScan.request();
    PermissionStatus bluetoothConnectPermissionStatus = await Permission.bluetoothConnect.request();
    PermissionStatus locationPermissionStatus = await Permission.location.request();

    // Check if permission has been granted or not
    if (bluetoothScanPermissionStatus.isDenied || bluetoothConnectPermissionStatus.isDenied) {
      // If permission is denied, show a SnackBar with a relevant message
      debugPrint('Bluetooth permissions denied.');

      setState(() {
        _permissionsGranted = false;
      });

      _showPermissionsErrorSnackBar();
    } else if (locationPermissionStatus.isDenied) {
      // If permission is denied, show a SnackBar with a relevant message
      debugPrint('Location permissions denied.');

      setState(() {
        _permissionsGranted = false;
      });

      _showPermissionsErrorSnackBar();
    } else {
      // If permissions were granted, we go on our merry way
      debugPrint('Bluetooth and location permissions granted.');

      setState(() {
        _permissionsGranted = true;
      });
    }
  }

  /// Handles taps on the "start scan" button.
  ///
  /// If Bluetooth scanning permissions have been granted or if the app is running on an iOS device (in which case
  /// the boolean indicating if permissions have been granted is true by default), navigate to the [ScanRoute].
  /// Otherwise, show a [SnackBar] to indicate that permissions have not been granted yet.
  void onStartScanTap() {
    if (_permissionsGranted == true) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const ScanRoute(),
        ),
      );
    } else if (_permissionsGranted == false) {
      _showPermissionsErrorSnackBar();
    }
  }

  /// Shows a [SnackBar] explaining that Bluetooth permissions have not been granted.
  void _showPermissionsErrorSnackBar() {
    if (!mounted) return;
    SnackBar snackBar = SnackBar(
      content: Text(AppLocalizations.of(context)!.permissionsError),
      duration: const Duration(seconds: 8),
      behavior: SnackBarBehavior.floating,
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) => StartScanView(this);
}
