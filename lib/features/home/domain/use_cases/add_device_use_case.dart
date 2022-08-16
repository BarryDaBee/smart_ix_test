import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/device_repository.dart';

class AddDeviceUseCase extends UseCase<List<DeviceEntity>, DeviceEntity> {

  AddDeviceUseCase(this.deviceRepository);

  final DeviceRepository deviceRepository;
  @override
  Future<Either<Failure, List<DeviceEntity>>> call(DeviceEntity params) {
    return deviceRepository.addDevice(params);
  }
}
