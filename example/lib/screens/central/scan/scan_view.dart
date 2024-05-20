import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_splendid_ble_example/screens/central/scan/scan_controller.dart';

import '../../components/loading_indicator.dart';
import '../../components/main_app_bar.dart';
import 'components/scan_result_tile.dart';

/// View for the [ScanRoute]. The view is dumb, and purely declarative. References values
/// on the controller and widget.
class ScanView extends StatelessWidget {
  final ScanController state;

  const ScanView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        actions: [
          IconButton(
            onPressed: state.onActionButtonPressed,
            icon: Icon(state.scanInProgress ? Icons.stop_outlined : Icons.play_arrow_outlined),
          ),
          IconButton(
            onPressed: state.onFiltersPressed,
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (state.discoveredDevices.isEmpty)
            const SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingIndicator(),
                ],
              ),
            ),
          if (state.discoveredDevices.isNotEmpty)
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
                  state.discoveredDevices.length,
                  (index) => ScanResultTile(
                    device: state.discoveredDevices[index],
                    onTap: () => state.onResultTap(state.discoveredDevices[index]),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
