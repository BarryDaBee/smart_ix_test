import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/dashboard/data/datasources/device_data_source.dart';
import 'package:smart_home/features/dashboard/domain/entities/entities.dart';
import 'package:smart_home/features/dashboard/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  const DeviceRepositoryImpl(this.dataSource);
  final DeviceDataSource dataSource;

  @override
  Future<Either<Failure, DeviceEntity>> addDevice(DeviceEntity device) async {
    try {
      final result = await dataSource.addNewDevice(device);
      return Right(result);
    } catch (e) {
      return Future.value(Left(DeviceFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, DeviceEntity>> toggleDeviceState(
    DeviceEntity device,
  ) async {
    try {
      final result = await dataSource.toggleDevice(device);
      return Right(result);
    } catch (e) {
      return Future.value(Left(DeviceFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices() async {
    try {
      final result = await dataSource.getAllDevices();
      return Right(result);
    } catch (e) {
      return Future.value(Left(DeviceFailure(message: e.toString())));
    }
  }
}
