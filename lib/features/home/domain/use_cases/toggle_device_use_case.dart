import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';


class ToggleDeviceUseCase extends UseCase<List<DeviceEntity>, DeviceEntity> {

  ToggleDeviceUseCase(this.deviceRepository);

  final DeviceRepository deviceRepository;

  @override
  Future<Either<Failure, List<DeviceEntity>>> call(DeviceEntity params) {
    return deviceRepository.toggleDeviceStatus(params);
  }
}
