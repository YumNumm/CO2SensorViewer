import 'package:co2_sensor_viewer/core/providers/usb_devices/usb_devices_provider.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/sensor_value.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/provider/co2_sensor_state_provider.dart';
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

class MonitoringPage extends HookConsumerWidget {
  const MonitoringPage({super.key, required this.device});
  final UsbDevice device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CO2SensorProvider(device));
    final data = state.data;
    useEffect(
      () {
        ref.read(CO2SensorProvider(device).notifier).start();
        return null;
      },
      [device],
    );

    if (data.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Connecting...'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Text('接続中...'),
            SizedBox(height: 8),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Connected: ${device.productName ?? 'Unknown'}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _CO2Status(data.last),
          ),
          const Expanded(
            flex: 2,
            child: Placeholder(
              child: Center(child: Text('GRAPH')),
            ),
          ),
        ],
      ),
    );
  }
}

class _CO2Status extends StatelessWidget {
  const _CO2Status(this.value);
  final (DateTime, SensorValue) value;

  @override
  Widget build(BuildContext context) {
    final co2 = value.$2.co2;
    final co2ConcentrationLevel = CO2ConcentrationLevel.from(co2);

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Card(
          key: Key(co2ConcentrationLevel.toString()),
          color: co2ConcentrationLevel.color.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$co2 ppm',
                    style: textTheme.titleLarge!.copyWith(
                      fontSize: 80,
                      fontFamily: FontFamily.jetBrainsMono,
                      fontFamilyFallback: [FontFamily.notoSansJP],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '最終更新: ${DateFormat('yyyy/MM/dd HH:mm:ss').format(value.$1)}',
                    style: textTheme.bodyLarge!.copyWith(
                      fontFamily: FontFamily.jetBrainsMono,
                      fontFamilyFallback: [FontFamily.notoSansJP],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension CO2ConcentrationLevelEx on CO2ConcentrationLevel {
  Color get color {
    switch (this) {
      case CO2ConcentrationLevel.good:
        return Colors.green;
      case CO2ConcentrationLevel.normal:
        return Colors.yellow;
      case CO2ConcentrationLevel.bad:
        return Colors.orange;
      case CO2ConcentrationLevel.veryBad:
        return Colors.red;
      case CO2ConcentrationLevel.extremelyBad:
        return Colors.purple;
    }
  }
}
