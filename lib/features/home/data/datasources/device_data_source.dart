import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';

abstract class DeviceDataSource {
  Future<List<DeviceEntity>> addDevice(DeviceEntity device);
  Future<List<DeviceEntity>> getAllDevices();
  Future<List<DeviceEntity>> toggleDevice(DeviceEntity device);
}

class DeviceDataSourceImpl implements DeviceDataSource {
  final List<DeviceEntity> devices = [
    DeviceEntity(
      name: 'Smart Bulb',
      status: Status.off,
      image: AppAssetsPath.bulb,
      brand: 'Samsung',
    ),
    DeviceEntity(
      name: 'Smart Lamp',
      status: Status.off,
      image: AppAssetsPath.lamp,
      brand: 'Lontor',
    ),
    DeviceEntity(
      name: 'Smart Fridge',
      status: Status.off,
      image: AppAssetsPath.refrigerator,
      brand: 'Samsung',
    ),
    DeviceEntity(
      name: 'Smart Curtain',
      status: Status.off,
      image: AppAssetsPath.windowBlinds,
      brand: 'Panasonic',
    ),
  ];

  @override
  Future<List<DeviceEntity>> addDevice(DeviceEntity device) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    devices.add(device);
    return devices;
  }

  @override
  Future<List<DeviceEntity>> getAllDevices() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return devices;
  }

  @override
  Future<List<DeviceEntity>> toggleDevice(DeviceEntity device) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    final deviceIndex = devices.indexWhere(
      (element) => device.name == element.name,
    );
    final updatedDevice = device.copyWith(
      status:
          device.status == Status.off || device.status == Status.disconnected
              ? Status.on
              : Status.off,
    );
    devices[deviceIndex] = updatedDevice;
    return devices;
  }
}
