import '../../../battery_alert.dart';

class AndroidDeviceInfoModel {
  final String? model;
  final String? brand;
  final String? buildId;
  final String? deviceId;
  final String? device;
  final String? display;
  final String? hardware;
  final String? manufacturer;
  final String? product;
  final String? androidVersion;
  final String? sdkVersion;
  final String? board;
  final String? bootloader;
  final String? deviceType;
  final String? fingerprint;
  final String? host;
  final String? tags;
  final String? type;
  final String? isPhysicalDevice;

  AndroidDeviceInfoModel({
    this.model,
    this.brand,
    this.buildId,
    this.deviceId,
    this.device,
    this.display,
    this.hardware,
    this.manufacturer,
    this.product,
    this.androidVersion,
    this.sdkVersion,
    this.board,
    this.bootloader,
    this.deviceType,
    this.fingerprint,
    this.host,
    this.tags,
    this.type,
    this.isPhysicalDevice,
  });
}

Future<AndroidDeviceInfoModel?> getAndroidDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

  return AndroidDeviceInfoModel(
    model: androidInfo.model,
    brand: androidInfo.brand,
    buildId: androidInfo.id,
    deviceId: androidInfo.id,
    device: androidInfo.device,
    display: androidInfo.display,
    hardware: androidInfo.hardware,
    manufacturer: androidInfo.manufacturer,
    product: androidInfo.product,
    androidVersion: androidInfo.version.release,
    sdkVersion: androidInfo.version.sdkInt.toString(),
    board: androidInfo.board,
    bootloader: androidInfo.bootloader,
    deviceType: androidInfo.type,
    fingerprint: androidInfo.fingerprint,
    host: androidInfo.host,
    tags: androidInfo.tags,
    type: androidInfo.type,
    isPhysicalDevice: androidInfo.isPhysicalDevice.toString(),
  );
}
