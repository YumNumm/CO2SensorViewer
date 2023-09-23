import 'package:co2_sensor_viewer/core/providers/serial_console/base/serial_console_base.dart';
import 'package:co2_sensor_viewer/core/providers/serial_console/serial_console_provider.dart';
import 'package:co2_sensor_viewer/feature/monitoring/ui/monitoring_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeviceSelectorPage extends ConsumerWidget {
  const DeviceSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CO2 Monitor'),
        // refresh button with text, icon
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
            onPressed: () => ref.invalidate(serialConsoleDevicesProvider),
          ),
        ],
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

  final void Function(SerialConsoleDeviceBase device) onDeviceSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final state = ref.watch(serialConsoleDevicesProvider);
    return switch ((state.valueOrNull, state.isLoading, state.error)) {
      (final List<SerialPortDevice> devices, _, _) when devices.isEmpty =>
        Center(
          child: Text(
            'No devices found.',
            style: textTheme.headlineMedium,
          ),
        ),
      (final List<SerialPortDevice> devices, _, _) => ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            final device = devices[index];
            return ListTile(
              title: Text(
                device.name ?? 'Unknown',
              ),
              subtitle: Text(device.manufacturer ?? 'Unknown'),
              trailing: const Icon(Icons.chevron_right),
              leading: const Icon(Icons.usb),
              onTap: () => onDeviceSelected(
                ref.read(serialConsoleProvider).createDevice(device),
              ),
            );
          },
        ),
      (_, true, _) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      (_, _, final Object? error) => Center(
          child: Text(
            error.toString(),
            style: textTheme.headlineMedium,
          ),
        ),
    };
  }
}
