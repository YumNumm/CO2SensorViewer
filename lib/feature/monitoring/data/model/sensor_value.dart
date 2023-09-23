import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_value.freezed.dart';

@freezed
class SensorValue with _$SensorValue {
  const factory SensorValue({
    required int co2,
    required double temperature,
    required double humidity,
  }) = _SensorValue;

  factory SensorValue.fromCsv(String csv) {
    // CO2=4000,Temperature=25.00,Humidity=50.00 の形式
    final values = csv.split(',');
    final co2 = int.parse(values[0].split('=')[1]);
    final humidity = double.parse(values[1].split('=')[1]);
    final temperature = double.parse(values[2].split('=')[1]);
    return SensorValue(
      co2: co2,
      temperature: temperature,
      humidity: humidity,
    );
  }
}

enum CO2ConcentrationLevel {
  /// 良好
  good(1000),

  /// やや良い
  normal(1500),

  /// 悪い
  bad(2500),

  /// 非常に悪い(3500)
  veryBad(3500),

  /// 極めて悪い
  extremelyBad(5000);

  const CO2ConcentrationLevel(this.threshould);
  final int threshould;

  // int -> CO2ConcentrationLevel
  static CO2ConcentrationLevel from(int value) => switch (value) {
        _ when CO2ConcentrationLevel.good.threshould >= value =>
          CO2ConcentrationLevel.good,
        _ when CO2ConcentrationLevel.normal.threshould >= value =>
          CO2ConcentrationLevel.normal,
        _ when CO2ConcentrationLevel.bad.threshould >= value =>
          CO2ConcentrationLevel.bad,
        _ when CO2ConcentrationLevel.veryBad.threshould >= value =>
          CO2ConcentrationLevel.veryBad,
        _ =>
          CO2ConcentrationLevel.extremelyBad,
      };
}
