import 'package:co2_sensor_viewer/core/providers/serial_console/serial_console_provider.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/co2_sensor_state.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/sensor_value.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:usb_serial/usb_serial.dart';

part 'co2_sensor_state_provider.g.dart';

@riverpod
class CO2Sensor extends _$CO2Sensor {
  @override
  CO2SensorModel build(UsbDevice device) {
    ref.listen(
      serialConsoleProvider(device),
      (_, next) {
        final result = _parse(next.valueOrNull ?? '');
        print(result);
        if (result != null) {
          state = state.copyWith(
            data: [
              ...state.data,
              (DateTime.now(), result),
            ],
          );
        }
      },
    );
    return const CO2SensorModel(
      isConnected: false,
      data: [],
    );
  }

  Future<void> start() async {
    // connect
    await ref.read(serialConsoleProvider(device).notifier).connect();
    print('connected');
    await Future<void>.delayed(const Duration(seconds: 1));
    // 開始処理
    await ref.read(serialConsoleProvider(device).notifier).send('STA');
    // 開始したかどうかの確認
    await Future<void>.delayed(const Duration(seconds: 1));
    // 5回までリトライ
    for (var i = 0; i < 10; i++) {
      final result = state.data.lastOrNull?.$2;
      print(result);
      if (result != null) {
        state = state.copyWith(
          isConnected: true,
          data: [
            ...state.data,
            (DateTime.now(), result),
          ],
        );
        return;
      }
      await ref.read(serialConsoleProvider(device).notifier).send('STA');
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    throw CO2SensorException(CO2SensorExceptionType.failedToStart);
    // 成功
  }

  SensorValue? _parse(String value) {
    try {
      return SensorValue.fromCsv(value);
    } on Error {
      return null;
    } on Exception {
      return null;
    }
  }
}

class CO2SensorException implements Exception {
  CO2SensorException(this.type);
  final CO2SensorExceptionType type;
}

enum CO2SensorExceptionType {
  failedToStart,
  ;
}
