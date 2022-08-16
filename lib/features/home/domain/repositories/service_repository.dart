import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';

abstract class ServiceRepository {
  Future<Either<Failure, ServiceEntity>> addService(
    ServiceEntity serviceEntity,
  );
  Future<Either<Failure, List<ServiceEntity>>> getAllServices();
}
