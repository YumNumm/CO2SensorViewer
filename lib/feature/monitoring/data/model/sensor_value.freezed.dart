// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SensorValue {
  int get co2 => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SensorValueCopyWith<SensorValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorValueCopyWith<$Res> {
  factory $SensorValueCopyWith(
          SensorValue value, $Res Function(SensorValue) then) =
      _$SensorValueCopyWithImpl<$Res, SensorValue>;
  @useResult
  $Res call({int co2, double temperature, double humidity});
}

/// @nodoc
class _$SensorValueCopyWithImpl<$Res, $Val extends SensorValue>
    implements $SensorValueCopyWith<$Res> {
  _$SensorValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? co2 = null,
    Object? temperature = null,
    Object? humidity = null,
  }) {
    return _then(_value.copyWith(
      co2: null == co2
          ? _value.co2
          : co2 // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SensorValueCopyWith<$Res>
    implements $SensorValueCopyWith<$Res> {
  factory _$$_SensorValueCopyWith(
          _$_SensorValue value, $Res Function(_$_SensorValue) then) =
      __$$_SensorValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int co2, double temperature, double humidity});
}

/// @nodoc
class __$$_SensorValueCopyWithImpl<$Res>
    extends _$SensorValueCopyWithImpl<$Res, _$_SensorValue>
    implements _$$_SensorValueCopyWith<$Res> {
  __$$_SensorValueCopyWithImpl(
      _$_SensorValue _value, $Res Function(_$_SensorValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? co2 = null,
    Object? temperature = null,
    Object? humidity = null,
  }) {
    return _then(_$_SensorValue(
      co2: null == co2
          ? _value.co2
          : co2 // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_SensorValue implements _SensorValue {
  const _$_SensorValue(
      {required this.co2, required this.temperature, required this.humidity});

  @override
  final int co2;
  @override
  final double temperature;
  @override
  final double humidity;

  @override
  String toString() {
    return 'SensorValue(co2: $co2, temperature: $temperature, humidity: $humidity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SensorValue &&
            (identical(other.co2, co2) || other.co2 == co2) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, co2, temperature, humidity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SensorValueCopyWith<_$_SensorValue> get copyWith =>
      __$$_SensorValueCopyWithImpl<_$_SensorValue>(this, _$identity);
}

abstract class _SensorValue implements SensorValue {
  const factory _SensorValue(
      {required final int co2,
      required final double temperature,
      required final double humidity}) = _$_SensorValue;

  @override
  int get co2;
  @override
  double get temperature;
  @override
  double get humidity;
  @override
  @JsonKey(ignore: true)
  _$$_SensorValueCopyWith<_$_SensorValue> get copyWith =>
      throw _privateConstructorUsedError;
}
