// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'co2_sensor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CO2SensorModel {
  int get limit => throw _privateConstructorUsedError;
  List<(DateTime, SensorValue)> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CO2SensorModelCopyWith<CO2SensorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CO2SensorModelCopyWith<$Res> {
  factory $CO2SensorModelCopyWith(
          CO2SensorModel value, $Res Function(CO2SensorModel) then) =
      _$CO2SensorModelCopyWithImpl<$Res, CO2SensorModel>;
  @useResult
  $Res call({int limit, List<(DateTime, SensorValue)> data});
}

/// @nodoc
class _$CO2SensorModelCopyWithImpl<$Res, $Val extends CO2SensorModel>
    implements $CO2SensorModelCopyWith<$Res> {
  _$CO2SensorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<(DateTime, SensorValue)>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CO2SensorModelCopyWith<$Res>
    implements $CO2SensorModelCopyWith<$Res> {
  factory _$$_CO2SensorModelCopyWith(
          _$_CO2SensorModel value, $Res Function(_$_CO2SensorModel) then) =
      __$$_CO2SensorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, List<(DateTime, SensorValue)> data});
}

/// @nodoc
class __$$_CO2SensorModelCopyWithImpl<$Res>
    extends _$CO2SensorModelCopyWithImpl<$Res, _$_CO2SensorModel>
    implements _$$_CO2SensorModelCopyWith<$Res> {
  __$$_CO2SensorModelCopyWithImpl(
      _$_CO2SensorModel _value, $Res Function(_$_CO2SensorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? data = null,
  }) {
    return _then(_$_CO2SensorModel(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<(DateTime, SensorValue)>,
    ));
  }
}

/// @nodoc

class _$_CO2SensorModel implements _CO2SensorModel {
  const _$_CO2SensorModel(
      {required this.limit, required final List<(DateTime, SensorValue)> data})
      : _data = data;

  @override
  final int limit;
  final List<(DateTime, SensorValue)> _data;
  @override
  List<(DateTime, SensorValue)> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CO2SensorModel(limit: $limit, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CO2SensorModel &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, limit, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CO2SensorModelCopyWith<_$_CO2SensorModel> get copyWith =>
      __$$_CO2SensorModelCopyWithImpl<_$_CO2SensorModel>(this, _$identity);
}

abstract class _CO2SensorModel implements CO2SensorModel {
  const factory _CO2SensorModel(
      {required final int limit,
      required final List<(DateTime, SensorValue)> data}) = _$_CO2SensorModel;

  @override
  int get limit;
  @override
  List<(DateTime, SensorValue)> get data;
  @override
  @JsonKey(ignore: true)
  _$$_CO2SensorModelCopyWith<_$_CO2SensorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
