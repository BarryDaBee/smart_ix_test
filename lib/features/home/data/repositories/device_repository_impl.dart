import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/app_exception.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/home/data/datasources/device_data_source.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  const DeviceRepositoryImpl(this.dataSource);
  final DeviceDataSource dataSource;

  @override
  Future<Either<Failure, List<DeviceEntity>>> addDevice(DeviceEntity device) async {
    try {
      final result = await dataSource.addDevice(device);
      return Right(result);
    }on AppException catch (e) {
      return Future.value(Left(DeviceFailure(message: e.message)));
    }
  }

  @override
  Future<Either<Failure, List<DeviceEntity>>> toggleDeviceStatus(
    DeviceEntity device,
  ) async {
    try {
      final result = await dataSource.toggleDevice(device);
      return Right(result);
    }on AppException catch (e) {
      return Future.value(Left(DeviceFailure(message: e.message)));
    }
  }

  @override
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices() async {
    try {
      final result = await dataSource.getAllDevices();
      return Right(result);
    }on AppException catch (e) {
      return Future.value(Left(DeviceFailure(message: e.message)));
    }
  }
}
