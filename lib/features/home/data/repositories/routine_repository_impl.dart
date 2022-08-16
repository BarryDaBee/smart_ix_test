import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/app_exception.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/home/data/datasources/routine_data_source.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';

class RoutineRepositoryImpl implements RoutineRepository {
  const RoutineRepositoryImpl(this.routineDataSource);
  final RoutineDataSource routineDataSource;

  @override
  Future<Either<Failure, List<RoutineEntity>>> addRoutine(
    RoutineEntity routine,
  ) async {
    try {
      final result = await routineDataSource.addRoutine(routine);
      return Right(result);
    } on AppException catch (e) {
      return Future.value(Left(RoutineFailure(message: e.message)));
    }
  }

  @override
  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines(
    String tag,
  ) async {
    try {
      final result = await routineDataSource.getAllRoutines(tag);
      return Right(result);
    } on AppException catch (e) {
      return Future.value(Left(RoutineFailure(message: e.message)));
    }
  }

  @override
  Future<Either<Failure, List<RoutineEntity>>> updateRoutine(
    RoutineEntity routine,
  ) async {
    try {
      final result = await routineDataSource.updateRoutine(routine);
      return Right(result);
    } on AppException catch (e) {
      return Future.value(Left(RoutineFailure(message: e.message)));
    }
  }
}
