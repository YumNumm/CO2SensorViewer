// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'co2_sensor_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cO2SensorHash() => r'19089c6e1afa8c1c7e8eb83e1e4288ab9c4f35b5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CO2Sensor
    extends BuildlessAutoDisposeNotifier<CO2SensorModel> {
  late final UsbDevice device;

  CO2SensorModel build(
    UsbDevice device,
  );
}

/// See also [CO2Sensor].
@ProviderFor(CO2Sensor)
const cO2SensorProvider = CO2SensorFamily();

/// See also [CO2Sensor].
class CO2SensorFamily extends Family<CO2SensorModel> {
  /// See also [CO2Sensor].
  const CO2SensorFamily();

  /// See also [CO2Sensor].
  CO2SensorProvider call(
    UsbDevice device,
  ) {
    return CO2SensorProvider(
      device,
    );
  }

  @override
  CO2SensorProvider getProviderOverride(
    covariant CO2SensorProvider provider,
  ) {
    return call(
      provider.device,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cO2SensorProvider';
}

/// See also [CO2Sensor].
class CO2SensorProvider
    extends AutoDisposeNotifierProviderImpl<CO2Sensor, CO2SensorModel> {
  /// See also [CO2Sensor].
  CO2SensorProvider(
    UsbDevice device,
  ) : this._internal(
          () => CO2Sensor()..device = device,
          from: cO2SensorProvider,
          name: r'cO2SensorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cO2SensorHash,
          dependencies: CO2SensorFamily._dependencies,
          allTransitiveDependencies: CO2SensorFamily._allTransitiveDependencies,
          device: device,
        );

  CO2SensorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.device,
  }) : super.internal();

  final UsbDevice device;

  @override
  CO2SensorModel runNotifierBuild(
    covariant CO2Sensor notifier,
  ) {
    return notifier.build(
      device,
    );
  }

  @override
  Override overrideWith(CO2Sensor Function() create) {
    return ProviderOverride(
      origin: this,
      override: CO2SensorProvider._internal(
        () => create()..device = device,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        device: device,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CO2Sensor, CO2SensorModel>
      createElement() {
    return _CO2SensorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CO2SensorProvider && other.device == device;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, device.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CO2SensorRef on AutoDisposeNotifierProviderRef<CO2SensorModel> {
  /// The parameter `device` of this provider.
  UsbDevice get device;
}

class _CO2SensorProviderElement
    extends AutoDisposeNotifierProviderElement<CO2Sensor, CO2SensorModel>
    with CO2SensorRef {
  _CO2SensorProviderElement(super.provider);

  @override
  UsbDevice get device => (origin as CO2SensorProvider).device;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
