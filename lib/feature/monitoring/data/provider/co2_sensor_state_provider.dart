import 'dart:async';

import 'package:co2_sensor_viewer/core/providers/serial_console/base/serial_console_base.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/co2_sensor_state.dart';
import 'package:co2_sensor_viewer/feature/monitoring/data/model/sensor_value.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'co2_sensor_state_provider.g.dart';

@riverpod
class CO2Sensor extends _$CO2Sensor {
  @override
  CO2SensorModel build(SerialConsoleDeviceBase device) {
    return const CO2SensorModel(
      limit: 60 * 5,
      data: [],
    );
  }

  Future<void> start() async {
    // start
    final stream = await device.createStream();
    final startCompleter = Completer<void>();
    stream.listen((event) {
      print(event);
      if (event == 'OK STA') {
        startCompleter.complete();
      }
      final value = _parse(event);
      if (value != null) {
        _addValue(value);
      }
    });
    await device.write('STA\r\n');
    // wait 10 seconds for start
    await startCompleter.future.timeout(const Duration(seconds: 10));
    if (startCompleter.isCompleted) {
      return;
    }
    throw CO2SensorException(CO2SensorExceptionType.failedToStart);
  }

  SensorValue? _parse(String value) {
    try {
      return SensorValue.fromCsv(value);
      // ignore: avoid_catching_errors
    } on Error {
      return null;
    } on Exception {
      return null;
    }
  }

  void _addValue(SensorValue value) {
    // limitを超えたら先頭を削除
    if (state.data.length >= state.limit) {
      state = state.copyWith(
        data: state.data.sublist(1),
      );
    }
    state = state.copyWith(
      data: [
        ...state.data,
        (DateTime.now(), value),
      ],
    );
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
