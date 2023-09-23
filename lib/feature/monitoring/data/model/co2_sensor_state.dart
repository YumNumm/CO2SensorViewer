import 'package:co2_sensor_viewer/feature/monitoring/data/model/sensor_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'co2_sensor_state.freezed.dart';

@freezed
class CO2SensorModel with _$CO2SensorModel {
  const factory CO2SensorModel({
    required int limit,
    required List<
            (
              DateTime time,
              SensorValue value,
            )>
        data,
  }) = _CO2SensorModel;
}
