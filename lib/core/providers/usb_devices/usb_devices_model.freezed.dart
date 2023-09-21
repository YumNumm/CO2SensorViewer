// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usb_devices_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsbDevicesModel {
  List<UsbDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsbDevicesModelCopyWith<UsbDevicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsbDevicesModelCopyWith<$Res> {
  factory $UsbDevicesModelCopyWith(
          UsbDevicesModel value, $Res Function(UsbDevicesModel) then) =
      _$UsbDevicesModelCopyWithImpl<$Res, UsbDevicesModel>;
  @useResult
  $Res call({List<UsbDevice> devices});
}

/// @nodoc
class _$UsbDevicesModelCopyWithImpl<$Res, $Val extends UsbDevicesModel>
    implements $UsbDevicesModelCopyWith<$Res> {
  _$UsbDevicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<UsbDevice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsbDevicesModelCopyWith<$Res>
    implements $UsbDevicesModelCopyWith<$Res> {
  factory _$$_UsbDevicesModelCopyWith(
          _$_UsbDevicesModel value, $Res Function(_$_UsbDevicesModel) then) =
      __$$_UsbDevicesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UsbDevice> devices});
}

/// @nodoc
class __$$_UsbDevicesModelCopyWithImpl<$Res>
    extends _$UsbDevicesModelCopyWithImpl<$Res, _$_UsbDevicesModel>
    implements _$$_UsbDevicesModelCopyWith<$Res> {
  __$$_UsbDevicesModelCopyWithImpl(
      _$_UsbDevicesModel _value, $Res Function(_$_UsbDevicesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$_UsbDevicesModel(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<UsbDevice>,
    ));
  }
}

/// @nodoc

class _$_UsbDevicesModel implements _UsbDevicesModel {
  const _$_UsbDevicesModel({required final List<UsbDevice> devices})
      : _devices = devices;

  final List<UsbDevice> _devices;
  @override
  List<UsbDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'UsbDevicesModel(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsbDevicesModel &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsbDevicesModelCopyWith<_$_UsbDevicesModel> get copyWith =>
      __$$_UsbDevicesModelCopyWithImpl<_$_UsbDevicesModel>(this, _$identity);
}

abstract class _UsbDevicesModel implements UsbDevicesModel {
  const factory _UsbDevicesModel({required final List<UsbDevice> devices}) =
      _$_UsbDevicesModel;

  @override
  List<UsbDevice> get devices;
  @override
  @JsonKey(ignore: true)
  _$$_UsbDevicesModelCopyWith<_$_UsbDevicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
