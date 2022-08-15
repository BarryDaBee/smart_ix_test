import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/dashboard/domain/entities/entities.dart';

abstract class RoutineRepository {
  Future<Either<Failure, RoutineEntity>> addRoutine(RoutineEntity routine);
  Future<Either<Failure, RoutineEntity>> updateRoutine(RoutineEntity routine);
  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines();
}
