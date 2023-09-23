import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:usb_serial/usb_serial.dart';

part 'usb_event_provider.g.dart';

@riverpod
Stream<UsbEvent> usbEvent(UsbEventRef ref) => UsbSerial.usbEventStream!;
