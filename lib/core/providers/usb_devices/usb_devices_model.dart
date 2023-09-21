import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usb_serial/usb_serial.dart';

part 'usb_devices_model.freezed.dart';

@freezed
class UsbDevicesModel with _$UsbDevicesModel {
  const factory UsbDevicesModel({
    required List<UsbDevice> devices,
  }) = _UsbDevicesModel;
}
