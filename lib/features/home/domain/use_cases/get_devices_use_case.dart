import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/device_repository.dart';


class GetDevicesUseCase extends UseCase<List<DeviceEntity>, NoParams> {

  GetDevicesUseCase(this.deviceRepository);

  final DeviceRepository deviceRepository;
  @override
  Future<Either<Failure, List<DeviceEntity>>> call(NoParams params) {
    return deviceRepository.getAllDevices();
  }
}
