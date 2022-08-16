import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';


class GetRoutinesUseCase extends UseCase<List<RoutineEntity>, String> {

  GetRoutinesUseCase(this.routineRepository);

  final RoutineRepository routineRepository;
  @override
  Future<Either<Failure, List<RoutineEntity>>> call(String params) {
    return routineRepository.getAllRoutines(params);
  }
}
