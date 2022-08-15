import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/dashboard/domain/entities/entities.dart';
import 'package:smart_home/features/dashboard/domain/repositories/device_repository.dart';


class AddDeviceUseCase extends UseCase<DeviceEntity, DeviceEntity> {

  AddDeviceUseCase(this.deviceRepository);

  final DeviceRepository deviceRepository;
  @override
  Future<Either<Failure, DeviceEntity>> call(DeviceEntity params) {
    return deviceRepository.addDevice(params);
  }
}