import 'dart:typed_data';

import 'package:co2_sensor_viewer/core/providers/serial_console/base/serial_console_base.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class OthersSerialConsoleImpl implements SerialConsoleBase {
  @override
  Future<List<SerialPortDevice>> listDevices() async {
    final availablePorts = SerialPort.availablePorts;
    final devices = availablePorts.map(SerialPort.new);
    return devices
        .map(
          (device) => SerialPortDevice(
            name: device.description,
            manufacturer: device.manufacturer,
            serialNumber: device.serialNumber,
            device: (null, device),
          ),
        )
        .toList();
  }

  @override
  SerialConsoleDeviceBase createDevice(SerialPortDevice device) =>
      OthersSerialConsoleDeviceImpl(port: device.device.$2!, device: device);
}

class OthersSerialConsoleDeviceImpl implements SerialConsoleDeviceBase {
  OthersSerialConsoleDeviceImpl({required this.device, required this.port});
  final SerialPortDevice device;

  final SerialPort port;

  @override
  Future<Stream<String>> createStream() async {
    port.open(mode: SerialPortMode.readWrite);
    final reader = SerialPortReader(port);
    return reader.stream.asyncMap(String.fromCharCodes);
  }

  @override
  Future<void> close() async => port.close();

  @override
  Future<void> write(String data) async =>
      port.write(Uint8List.fromList(data.codeUnits));

  @override
  SerialPortDevice get portDevice => device;
}
