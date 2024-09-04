import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/loading_indicator.dart';
import '../../components/main_app_bar.dart';
import 'components/connected_device_tile.dart';
import 'connected_devices_controller.dart';
import 'connected_devices_route.dart';

/// View for the [ConnectedDevicesRoute]. The view is dumb, and purely declarative. References values
/// on the controller and widget.
class ConnectedDevicesView extends StatelessWidget {
  /// A reference to the controller for the [ConnectedDevicesRoute].
  final ConnectedDevicesController state;

  /// Creates an instance of [ConnectedDevicesView].
  const ConnectedDevicesView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: CustomScrollView(
        slivers: [
          // If there was an error getting devices, show the error.
          if (state.errorMessage != null)
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red[900],
                      size: 48,
                    ),
                  ),
                  Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.red[900],
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

          // Show a loading indicator while getting connected devices
          if (state.connectedDevices == null && state.errorMessage == null)
            const SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingIndicator(),
                ],
              ),
            ),

          // If at last one connected device is found, show them in a list
          if (state.connectedDevices?.isNotEmpty ?? false)
            SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    AppLocalizations.of(context)!.discoveredDevices,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                ...List.generate(
                  state.connectedDevices!.length,
                  (index) => ConnectedDeviceTile(
                    device: state.connectedDevices![index],
                    onTap: () => state.onResultTap(state.connectedDevices![index]),
                  ),
                ),
              ],
            ),

          // If no connected devices were found, show a message
          if (state.connectedDevices?.isEmpty ?? false)
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.noConnectedDevices,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
