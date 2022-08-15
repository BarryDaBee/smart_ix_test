import 'package:smart_home/features/dashboard/domain/entities/entities.dart';

abstract class DeviceDataSource {
  Future<DeviceEntity> addNewDevice(DeviceEntity device);
  Future<List<DeviceEntity>> getAllDevices();
  Future<DeviceEntity> toggleDevice(DeviceEntity device);
}

class HomeRemoteDataSourceImpl implements DeviceDataSource {
  @override
  Future<DeviceEntity> addNewDevice(DeviceEntity device) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return device;
  }


  @override
  Future<List<DeviceEntity>> getAllDevices() {
    throw UnimplementedError();
  }


  @override
  Future<DeviceEntity> toggleDevice(DeviceEntity device) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return DeviceEntity(
      id: device.id,
      name: device.name,
      status: !device.status,
      image: device.image,
    );
  }
}
