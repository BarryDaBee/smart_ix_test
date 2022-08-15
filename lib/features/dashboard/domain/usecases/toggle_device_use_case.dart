import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/dashboard/domain/entities/entities.dart';
import 'package:smart_home/features/dashboard/domain/repositories/repositories.dart';


class ToggleDeviceUseCase extends UseCase<DeviceEntity, DeviceEntity> {

  ToggleDeviceUseCase(this.deviceRepository);

  final DeviceRepository deviceRepository;

  @override
  Future<Either<Failure, DeviceEntity>> call(DeviceEntity params) {
    return deviceRepository.toggleDeviceState(params);
  }
}