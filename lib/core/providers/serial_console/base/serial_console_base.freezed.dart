// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serial_console_base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SerialPortDevice {
  String? get name => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;

  /// Androidの場合は[us.UsbDevice]、それ以外は[lsp.SerialPort]
  (UsbDevice?, SerialPort?) get device => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SerialPortDeviceCopyWith<SerialPortDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SerialPortDeviceCopyWith<$Res> {
  factory $SerialPortDeviceCopyWith(
          SerialPortDevice value, $Res Function(SerialPortDevice) then) =
      _$SerialPortDeviceCopyWithImpl<$Res, SerialPortDevice>;
  @useResult
  $Res call(
      {String? name,
      String? manufacturer,
      String? serialNumber,
      (UsbDevice?, SerialPort?) device});
}

/// @nodoc
class _$SerialPortDeviceCopyWithImpl<$Res, $Val extends SerialPortDevice>
    implements $SerialPortDeviceCopyWith<$Res> {
  _$SerialPortDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? manufacturer = freezed,
    Object? serialNumber = freezed,
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as (UsbDevice?, SerialPort?),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SerialPortDeviceCopyWith<$Res>
    implements $SerialPortDeviceCopyWith<$Res> {
  factory _$$_SerialPortDeviceCopyWith(
          _$_SerialPortDevice value, $Res Function(_$_SerialPortDevice) then) =
      __$$_SerialPortDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? manufacturer,
      String? serialNumber,
      (UsbDevice?, SerialPort?) device});
}

/// @nodoc
class __$$_SerialPortDeviceCopyWithImpl<$Res>
    extends _$SerialPortDeviceCopyWithImpl<$Res, _$_SerialPortDevice>
    implements _$$_SerialPortDeviceCopyWith<$Res> {
  __$$_SerialPortDeviceCopyWithImpl(
      _$_SerialPortDevice _value, $Res Function(_$_SerialPortDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? manufacturer = freezed,
    Object? serialNumber = freezed,
    Object? device = null,
  }) {
    return _then(_$_SerialPortDevice(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as (UsbDevice?, SerialPort?),
    ));
  }
}

/// @nodoc

class _$_SerialPortDevice implements _SerialPortDevice {
  const _$_SerialPortDevice(
      {required this.name,
      required this.manufacturer,
      required this.serialNumber,
      required this.device});

  @override
  final String? name;
  @override
  final String? manufacturer;
  @override
  final String? serialNumber;

  /// Androidの場合は[us.UsbDevice]、それ以外は[lsp.SerialPort]
  @override
  final (UsbDevice?, SerialPort?) device;

  @override
  String toString() {
    return 'SerialPortDevice(name: $name, manufacturer: $manufacturer, serialNumber: $serialNumber, device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SerialPortDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, manufacturer, serialNumber, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SerialPortDeviceCopyWith<_$_SerialPortDevice> get copyWith =>
      __$$_SerialPortDeviceCopyWithImpl<_$_SerialPortDevice>(this, _$identity);
}

abstract class _SerialPortDevice implements SerialPortDevice {
  const factory _SerialPortDevice(
      {required final String? name,
      required final String? manufacturer,
      required final String? serialNumber,
      required final (UsbDevice?, SerialPort?) device}) = _$_SerialPortDevice;

  @override
  String? get name;
  @override
  String? get manufacturer;
  @override
  String? get serialNumber;
  @override

  /// Androidの場合は[us.UsbDevice]、それ以外は[lsp.SerialPort]
  (UsbDevice?, SerialPort?) get device;
  @override
  @JsonKey(ignore: true)
  _$$_SerialPortDeviceCopyWith<_$_SerialPortDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
