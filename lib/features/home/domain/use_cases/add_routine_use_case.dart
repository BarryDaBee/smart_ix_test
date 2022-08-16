import 'package:dartz/dartz.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';


class AddRoutineUseCase extends UseCase<List<RoutineEntity>, RoutineEntity> {

  AddRoutineUseCase(this.routineRepository);

  final RoutineRepository routineRepository;
  @override
  Future<Either<Failure, List<RoutineEntity>>> call(RoutineEntity params) {
    return routineRepository.addRoutine(params);
  }
}
