// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'serial_console_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serialConsoleHash() => r'38229a56ac8a0e4126f0e06c96fe15b8e993b763';

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

abstract class _$SerialConsole
    extends BuildlessAutoDisposeStreamNotifier<String> {
  late final UsbDevice device;

  Stream<String> build(
    UsbDevice device,
  );
}

/// See also [SerialConsole].
@ProviderFor(SerialConsole)
const serialConsoleProvider = SerialConsoleFamily();

/// See also [SerialConsole].
class SerialConsoleFamily extends Family<AsyncValue<String>> {
  /// See also [SerialConsole].
  const SerialConsoleFamily();

  /// See also [SerialConsole].
  SerialConsoleProvider call(
    UsbDevice device,
  ) {
    return SerialConsoleProvider(
      device,
    );
  }

  @override
  SerialConsoleProvider getProviderOverride(
    covariant SerialConsoleProvider provider,
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
  String? get name => r'serialConsoleProvider';
}

/// See also [SerialConsole].
class SerialConsoleProvider
    extends AutoDisposeStreamNotifierProviderImpl<SerialConsole, String> {
  /// See also [SerialConsole].
  SerialConsoleProvider(
    UsbDevice device,
  ) : this._internal(
          () => SerialConsole()..device = device,
          from: serialConsoleProvider,
          name: r'serialConsoleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serialConsoleHash,
          dependencies: SerialConsoleFamily._dependencies,
          allTransitiveDependencies:
              SerialConsoleFamily._allTransitiveDependencies,
          device: device,
        );

  SerialConsoleProvider._internal(
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
  Stream<String> runNotifierBuild(
    covariant SerialConsole notifier,
  ) {
    return notifier.build(
      device,
    );
  }

  @override
  Override overrideWith(SerialConsole Function() create) {
    return ProviderOverride(
      origin: this,
      override: SerialConsoleProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<SerialConsole, String>
      createElement() {
    return _SerialConsoleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SerialConsoleProvider && other.device == device;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, device.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SerialConsoleRef on AutoDisposeStreamNotifierProviderRef<String> {
  /// The parameter `device` of this provider.
  UsbDevice get device;
}

class _SerialConsoleProviderElement
    extends AutoDisposeStreamNotifierProviderElement<SerialConsole, String>
    with SerialConsoleRef {
  _SerialConsoleProviderElement(super.provider);

  @override
  UsbDevice get device => (origin as SerialConsoleProvider).device;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
