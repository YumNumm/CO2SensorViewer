import 'dart:async';

import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usb_serial/usb_serial.dart';

part 'serial_console_base.freezed.dart';

abstract class SerialConsoleBase {
  Future<List<SerialPortDevice>> listDevices();
  SerialConsoleDeviceBase createDevice(SerialPortDevice device);
}

abstract class SerialConsoleDeviceBase {
  Future<Stream<String>> createStream();
  Future<void> close();
  Future<void> write(String data);
  SerialPortDevice get portDevice;
}

@freezed
class SerialPortDevice with _$SerialPortDevice {
  const factory SerialPortDevice({
    required String? name,
    required String? manufacturer,
    required String? serialNumber,

    /// Androidの場合は[us.UsbDevice]、それ以外は[lsp.SerialPort]
    required (UsbDevice? android, SerialPort? others) device,
  }) = _SerialPortDevice;
}

class SerialPortException implements Exception {
  SerialPortException(this.message);

  final String message;

  @override
  String toString() => message;
}
