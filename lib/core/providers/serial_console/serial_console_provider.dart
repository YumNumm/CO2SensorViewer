import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:co2_sensor_viewer/core/providers/usb_event/usb_event_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

part 'serial_console_provider.g.dart';

@riverpod
class SerialConsole extends _$SerialConsole {
  final _controller = StreamController<String>();

  late final UsbPort port;

  @override
  Stream<String> build(UsbDevice device) {
    return _controller.stream.asBroadcastStream();
  }

  Future<void> connect() async {
    final port = await device.create();
    if (!(await port!.open())) {
      throw SerialConsoleException(SerialConsoleExceptionType.failedToOpenPort);
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

    final transaction = Transaction.stringTerminated(
      port.inputStream!,
      Uint8List.fromList([13, 10]),
    );

    transaction.stream.listen(_controller.add);
    transaction.stream.listen((e) => log('CONSOLE: $e'));
    ref.listen(
      usbEventProvider,
      (_, next) {
        if (next.value?.event == 'ACTION_USB_DETACHED') {
          _controller.close();
          throw SerialConsoleException(SerialConsoleExceptionType.disconnected);
        }
      },
    );
  }

  Future<void> send(String data) async => port.write(
        Uint8List.fromList('$data\r\n'.codeUnits),
      );
}

class SerialConsoleException implements Exception {
  SerialConsoleException(this.type);
  final SerialConsoleExceptionType type;
}

enum SerialConsoleExceptionType {
  failedToOpenPort,
  failedToSendData,
  disconnected,
  ;
}
