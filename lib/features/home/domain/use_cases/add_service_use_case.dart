import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';


class AddServiceUseCase extends UseCase<ServiceEntity, ServiceEntity> {

  AddServiceUseCase(this.serviceRepository);

  final ServiceRepository serviceRepository;

  @override
  Future<Either<Failure, ServiceEntity>> call(ServiceEntity params) {
    return serviceRepository.addService(params);
  }
}
