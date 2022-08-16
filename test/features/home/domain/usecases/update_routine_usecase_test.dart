import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/core/utils/helper_functions.dart';
import 'package:smart_home/features/home/domain/entities/routine_entity.dart';
import 'package:smart_home/features/home/domain/repositories/routine_repository.dart';
import 'package:smart_home/features/home/domain/use_cases/update_routine_use_case.dart';

class RoutineRepositoryMock extends Mock implements RoutineRepository {}

void main() {
  final repository = RoutineRepositoryMock();
  final useCase = UpdateRoutineUseCase(repository);
  group('edit routine useCase ...', () {
    final routineEntity = RoutineEntity(
      tag: 'test',
      id: HelperFunctions.getRandomString(8),
      weekdays: const[],
      startTime: DateTime.now(),
      action: false,
      stopTime: DateTime.now(),
      image: '',
    );
    

    test('''
verify a call to [RoutineRepository.editRoutine]
    the right data''', () async {
      when(() => repository.updateRoutine(routineEntity))
          .thenAnswer((_) async =>  Right([routineEntity]));
      await useCase(routineEntity);
      verify(
        () => repository.updateRoutine(
          routineEntity,
        ),
      );
    });
  });
}
