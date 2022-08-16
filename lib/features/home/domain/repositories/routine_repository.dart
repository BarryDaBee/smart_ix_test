import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';

abstract class RoutineRepository {
  Future<Either<Failure, List<RoutineEntity>>> addRoutine(RoutineEntity routine);
  Future<Either<Failure, List<RoutineEntity>>> updateRoutine(RoutineEntity routine);
  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines(String tag);
}
