import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/service_repository.dart';


class GetServicesUseCase extends UseCase<List<ServiceEntity>, NoParams> {

  GetServicesUseCase(this.serviceRepository);

  final ServiceRepository serviceRepository;
  @override
  Future<Either<Failure, List<ServiceEntity>>> call(NoParams params) {
    return serviceRepository.getAllServices();
  }
}
