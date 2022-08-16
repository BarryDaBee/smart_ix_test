import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';

abstract class DeviceRepository {
  Future<Either<Failure, List<DeviceEntity>>> addDevice(DeviceEntity device);
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices();
  Future<Either<Failure, List<DeviceEntity>>> toggleDeviceStatus(DeviceEntity device);
}
