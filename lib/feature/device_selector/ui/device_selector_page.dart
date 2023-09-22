import 'package:co2_sensor_viewer/core/providers/usb_devices/usb_devices_provider.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/sensor_value.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/provider/co2_sensor_state_provider.dart';
import 'package:co2_sensor_viewer/feature/monitoring/ui/monitoring_page.dart';
import 'package:co2_sensor_viewer/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:usb_serial/usb_serial.dart';

class DeviceSelectorPage extends StatelessWidget {
  const DeviceSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CO2 Monitor'),
      ),
      body: _DeviceSelectorBody(
        onDeviceSelected: (device) => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => MonitoringPage(device: device),
          ),
        ),
      ),
    );
  }
}

class _DeviceSelectorBody extends HookConsumerWidget {
  const _DeviceSelectorBody({
    required this.onDeviceSelected,
  });

  final void Function(UsbDevice device) onDeviceSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final state = ref.watch(usbDevicesProvider);
    useEffect(
      () {
        // 初回のみ実行
        ref.read(usbDevicesProvider.notifier).refresh();
        return null;
      },
      [],
    );
    if (state.devices.isEmpty) {
      return Center(
        child: Text(
          'No devices found.',
          style: textTheme.headlineMedium,
        ),
      );
    }
    return ListView.builder(
      itemCount: state.devices.length,
      itemBuilder: (context, index) {
        final device = state.devices[index];
        return ListTile(
          title: Text(
            device.productName ?? 'Unknown',
          ),
          subtitle: Text(device.manufacturerName ?? 'Unknown'),
          trailing: const Icon(Icons.chevron_right),
          leading: const Icon(Icons.usb),
          onTap: () => onDeviceSelected(device),
        );
      },
    );
  }
}
