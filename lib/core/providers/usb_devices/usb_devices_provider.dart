import 'package:co2_sensor_viewer/core/providers/usb_devices/usb_devices_model.dart';
import 'package:co2_sensor_viewer/core/providers/usb_event/usb_event_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:usb_serial/usb_serial.dart';

part 'usb_devices_provider.g.dart';

@riverpod
class UsbDevices extends _$UsbDevices {
  @override
  UsbDevicesModel build() {
    // USB イベントのストリームを監視する。
    ref.listen(
      usbEventProvider,
      (_, __) async => refresh(),
    );
    return const UsbDevicesModel(
      devices: [],
    );
  }

  Future<void> refresh() async => state = state.copyWith(
        devices: await UsbSerial.listDevices(),
      );
}
