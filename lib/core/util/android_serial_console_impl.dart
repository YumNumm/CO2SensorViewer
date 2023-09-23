import 'dart:async';
import 'dart:typed_data';

import 'package:co2_sensor_viewer/core/providers/serial_console/base/serial_console_base.dart';
import 'package:usb_serial/usb_serial.dart';

class AndroidSerialConsoleImpl implements SerialConsoleBase {
  @override
  Future<List<SerialPortDevice>> listDevices() async {
    final devices = await UsbSerial.listDevices();
    return devices
        .map(
          (device) => SerialPortDevice(
            name: device.deviceName,
            manufacturer: device.manufacturerName,
            serialNumber: device.serial,
            device: (device, null),
          ),
        )
        .toList();
  }

  @override
  SerialConsoleDeviceBase createDevice(SerialPortDevice device) =>
      AndroidSerialConsoleDeviceImpl(device: device);
}

class AndroidSerialConsoleDeviceImpl implements SerialConsoleDeviceBase {
  AndroidSerialConsoleDeviceImpl({
    required this.device,
  });

  final SerialPortDevice device;
  late UsbPort port;

  final StreamController<String> _controller = StreamController<String>();

  @override
  Future<Stream<String>> createStream() async {
    final base = device.device.$1!;
    final port = await base.create();
    if (port == null) {
      throw SerialPortException('Failed to open port.');
    }
    this.port = port;
    await port.setDTR(true);
    await port.setRTS(true);

    await port.setPortParameters(
      115200,
      UsbPort.DATABITS_8,
      UsbPort.STOPBITS_1,
      UsbPort.PARITY_NONE,
    );
    await port.open();
    port.inputStream?.listen((data) {
      _controller.add(String.fromCharCodes(data));
    });
    return _controller.stream.asBroadcastStream();
  }

  @override
  Future<void> close() async => port.close();

  @override
  Future<void> write(String data) async => port.write(
        Uint8List.fromList(data.codeUnits),
      );

  @override
  SerialPortDevice get portDevice => device;
}
