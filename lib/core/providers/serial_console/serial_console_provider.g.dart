// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'serial_console_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serialConsoleHash() => r'427fc78b936313e5c25978296a4be83e330780de';

/// See also [serialConsole].
@ProviderFor(serialConsole)
final serialConsoleProvider = Provider<SerialConsoleBase>.internal(
  serialConsole,
  name: r'serialConsoleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serialConsoleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SerialConsoleRef = ProviderRef<SerialConsoleBase>;
String _$serialConsoleDevicesHash() =>
    r'55f30ed371401bd78e6fa86db2c07c7217636d1d';

/// See also [serialConsoleDevices].
@ProviderFor(serialConsoleDevices)
final serialConsoleDevicesProvider =
    FutureProvider<List<SerialPortDevice>>.internal(
  serialConsoleDevices,
  name: r'serialConsoleDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serialConsoleDevicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SerialConsoleDevicesRef = FutureProviderRef<List<SerialPortDevice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
