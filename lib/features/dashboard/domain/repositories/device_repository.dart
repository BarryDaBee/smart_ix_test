import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/dashboard/domain/entities/entities.dart';

abstract class DeviceRepository {
  Future<Either<Failure, DeviceEntity>> addDevice(DeviceEntity device);
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices();
  Future<Either<Failure, DeviceEntity>> toggleDeviceState(DeviceEntity device);
}
