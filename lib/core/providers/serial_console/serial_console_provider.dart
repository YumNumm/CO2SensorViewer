import 'dart:io';

import 'package:co2_sensor_viewer/core/providers/serial_console/base/others_serial_console_impl.dart';
import 'package:co2_sensor_viewer/core/providers/serial_console/base/serial_console_base.dart';
import 'package:co2_sensor_viewer/core/util/android_serial_console_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'serial_console_provider.g.dart';

@Riverpod(keepAlive: true)
SerialConsoleBase serialConsole(SerialConsoleRef ref) => (Platform.isAndroid)
    ? AndroidSerialConsoleImpl()
    : OthersSerialConsoleImpl();

@Riverpod(keepAlive: true)
Future<List<SerialPortDevice>> serialConsoleDevices(
  SerialConsoleDevicesRef ref,
) =>
    ref.watch(serialConsoleProvider).listDevices();
