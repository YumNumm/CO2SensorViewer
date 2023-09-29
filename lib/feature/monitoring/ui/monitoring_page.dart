import 'package:co2_sensor_viewer/core/providers/serial_console/base/serial_console_base.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/sensor_value.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/provider/co2_sensor_state_provider.dart';
import 'package:co2_sensor_viewer/gen/fonts.gen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class MonitoringPage extends HookConsumerWidget {
  const MonitoringPage({super.key, required this.device});
  final SerialConsoleDeviceBase device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

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
          title: Text(
            'Connecting...',
            style: textTheme.headlineSmall!.copyWith(
              fontFamily: FontFamily.jetBrainsMono,
              fontFamilyFallback: [FontFamily.notoSansJP],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '接続中...',
                style: textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      );
    }
    final children = <Widget>[
      Expanded(
        child: _CO2Status(data.last),
      ),
      Expanded(
        flex: 2,
        child: _Graph(data: state.data),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connected: ${device.portDevice.name}',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontFamily: FontFamily.jetBrainsMono,
                fontFamilyFallback: [FontFamily.notoSansJP],
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: CO2ConcentrationLevel.from(data.last.$2.co2)
                .color
                .withOpacity(0.2),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final shouldPortrait =
                  constraints.maxWidth < constraints.maxHeight * 1.5;
              final child = shouldPortrait
                  ? Column(
                      key: const Key('portrait'),
                      children: children,
                    )
                  : Row(
                      key: const Key('landscape'),
                      children: children,
                    );
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: SafeArea(child: child),
              );
            },
          ),
        ),
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

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: co2ConcentrationLevel.color.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'CO',
                            style: textTheme.titleLarge!.copyWith(
                              fontSize: 40,
                              fontFamily: FontFamily.jetBrainsMono,
                              fontFamilyFallback: [FontFamily.notoSansJP],
                            ),
                          ),
                          TextSpan(
                            text: '2',
                            style: textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                              fontFamilyFallback: [FontFamily.notoSansJP],
                            ),
                          ),
                          TextSpan(
                            text: '濃度',
                            style: textTheme.titleLarge!.copyWith(
                              fontSize: 40,
                              fontFamily: FontFamily.jetBrainsMono,
                              fontFamilyFallback: [FontFamily.notoSansJP],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$co2',
                            style: textTheme.titleLarge!.copyWith(
                              fontSize: 80,
                              fontFamily: FontFamily.jetBrainsMono,
                              fontFamilyFallback: [FontFamily.notoSansJP],
                            ),
                          ),
                          TextSpan(
                            text: 'ppm',
                            style: textTheme.titleLarge!.copyWith(
                              fontSize: 30,
                              fontFamily: FontFamily.jetBrainsMono,
                              fontFamilyFallback: [FontFamily.notoSansJP],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      co2ConcentrationLevel.description,
                      style: textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.jetBrainsMono,
                        fontFamilyFallback: [FontFamily.notoSansJP],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          children: [
            Text(
              '温度: ${value.$2.temperature}℃',
              style: textTheme.titleMedium!.copyWith(
                fontFamily: FontFamily.jetBrainsMono,
                fontFamilyFallback: [FontFamily.notoSansJP],
              ),
            ),
            Text(
              '湿度: ${value.$2.humidity}%',
              style: textTheme.titleMedium!.copyWith(
                fontFamily: FontFamily.jetBrainsMono,
                fontFamilyFallback: [FontFamily.notoSansJP],
              ),
            ),
            Text(
              '最終更新: '
              '${DateFormat('yyyy/MM/dd HH:mm:ss').format(value.$1)}',
              style: textTheme.bodyLarge!.copyWith(
                fontFamily: FontFamily.jetBrainsMono,
                fontFamilyFallback: [FontFamily.notoSansJP],
              ),
            ),
          ],
        ),
      ],
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

  String get description {
    switch (this) {
      case CO2ConcentrationLevel.good:
        return '良好';
      case CO2ConcentrationLevel.normal:
        return 'やや良い';
      case CO2ConcentrationLevel.bad:
        return '悪い';
      case CO2ConcentrationLevel.veryBad:
        return '非常に悪い';
      case CO2ConcentrationLevel.extremelyBad:
        return '極めて悪い';
    }
  }
}

class _Graph extends HookWidget {
  const _Graph({
    required this.data,
  });
  final List<(DateTime, SensorValue)> data;

  @override
  Widget build(BuildContext context) {
    final lineChartData = LineChartData(
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(
          axisNameWidget: Text('CO2濃度 (ppm)'),
          axisNameSize: 30,
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 60 * 60 * 1000,
            getTitlesWidget: (value, meta) => Text(
              DateFormat('HH:mm:ss').format(
                DateTime.fromMillisecondsSinceEpoch(
                  value.toInt(),
                ),
              ),
            ),
          ),
        ),
        rightTitles: const AxisTitles(
          axisNameSize: 30,
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: data
              .map(
                (e) => FlSpot(
                  e.$1.millisecondsSinceEpoch.toDouble(),
                  e.$2.co2.toDouble(),
                ),
              )
              .toList(),
          isStrokeCapRound: true,
          isStrokeJoinRound: true,
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    );
    final key = useMemoized(GlobalKey.new, []);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: LineChart(
        lineChartData,
        chartRendererKey: key,
      ),
    );
  }
}
