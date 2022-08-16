import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/core/error/app_exception.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/utils/helper_functions.dart';
import 'package:smart_home/features/home/data/datasources/routine_data_source.dart';
import 'package:smart_home/features/home/data/repositories/routine_repository_impl.dart';
import 'package:smart_home/features/home/domain/entities/routine_entity.dart';

class RoutineDataSourceMock extends Mock implements RoutineDataSource {}

void main() {
  final routineDataSource = RoutineDataSourceMock();
  final repository = RoutineRepositoryImpl(routineDataSource);

  final routineEntity = RoutineEntity(
    startTime: DateTime.now(),
    id: HelperFunctions.getRandomString(8),
    weekdays: const[],
    tag: '',
    stopTime: DateTime.now(),
    image: '',
    action: false,
  );

  group(
    'Add Device',
    () {
      test('''
when [addRoutine] is called and returns 
        an error, expect the Left side of Either''', () async {
        when(
          () => routineDataSource.addRoutine(routineEntity),
        ).thenAnswer(
          (_) => throw const RoutineException('error'),
        );
        final result = await repository.addRoutine(routineEntity);
        expect(
          result,
          equals(
            const Left<Failure, RoutineEntity>(
              RoutineFailure(message: 'error'),
            ),
          ),
        );
        verify(
          () => routineDataSource.addRoutine(
            routineEntity.copyWith(),
          ),
        );
      });
      test(
        '''
when [addDevice] is called and
the call is successful expect the Right side of Either''',
        () async {
          when(
            () => routineDataSource.addRoutine(routineEntity),
          ).thenAnswer(
            (_) => Future.value([routineEntity]),
          );
          final result = await repository.addRoutine(routineEntity);
          late final List<RoutineEntity> rightSide;
          result.fold((l) => null, (r) => {rightSide = r});
          expect(
            rightSide,
            equals(
              [routineEntity],
            ),
          );
        },
      );
    },
  );

  group(
    'Get All Devices',
    () {
      test(
        'when [getAllDevices] is called and call is successful expect '
        'the right side of either.',
        () async {
          when(
            () => routineDataSource.getAllRoutines(''),
          ).thenAnswer(
            (_) => Future.value([routineEntity]),
          );
          final result = await repository.getAllRoutines('');
          expect(result.length(), equals(1));
        },
      );

      test(
        'when [getAllDevices] is called and return the call failed '
        'expect the left side of either.',
        () async {
          when(
            () => routineDataSource.getAllRoutines(''),
          ).thenAnswer(
            (_) => throw const RoutineException('error'),
          );
          final result = await repository.getAllRoutines('');

          expect(
            result,
            equals(
              const Left<Failure, RoutineEntity>(
                RoutineFailure(message: 'error'),
              ),
            ),
          );
        },
      );
    },
  );

  group(
    'Toggle device status',
    () {
      test(
        'when [toggleDevice] is called and returns the '
        'right data, expect the Right side of Either',
        () async {
          when(
            () => routineDataSource.updateRoutine(routineEntity),
          ).thenAnswer(
            (_) => Future.value([
              routineEntity.copyWith(),
            ]),
          );
          final result = await repository.updateRoutine(routineEntity);
          late final List<RoutineEntity> rightSide;
          result.fold((l) => null, (r) => {rightSide = r});
          expect(
            rightSide,
            equals(
              [routineEntity.copyWith()],
            ),
          );
          verify(
            () => routineDataSource.updateRoutine(
              routineEntity,
            ),
          );
        },
      );
    },
  );
}
