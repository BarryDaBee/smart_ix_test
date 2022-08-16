import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/utils/helper_functions.dart';
import 'package:smart_home/features/home/domain/entities/routine_entity.dart';
import 'package:smart_home/features/home/domain/use_cases/use_cases.dart';

class AddRoutineUseCaseMock extends Mock implements AddRoutineUseCase {}

class UpdateRoutineUseCaseMock extends Mock implements UpdateRoutineUseCase {}

class GetRoutinesUseCaseMock extends Mock implements GetRoutinesUseCase {}

void main() {
  final AddRoutineUseCase addRoutineUseCase = AddRoutineUseCaseMock();
  final GetRoutinesUseCase getRoutineUseCase = GetRoutinesUseCaseMock();
  final UpdateRoutineUseCase updateRoutineUseCase = UpdateRoutineUseCaseMock();

  final routineEntity = RoutineEntity(
    startTime: DateTime.now(),
    id: HelperFunctions.getRandomString(8),
    weekdays: const [],
    tag: '',
    stopTime: DateTime.now(),
    image: '',
    action: false,
  );

  late RoutineBloc routineBloc;
  ///Runs before all tests
  setUpAll(() async {
    when(
      () => addRoutineUseCase(routineEntity),
    ).thenAnswer(
      (_) async => Right<Failure, List<RoutineEntity>>([routineEntity]),
    );
    when(
      () => getRoutineUseCase(''),
    ).thenAnswer(
      (_) async => Right<Failure, List<RoutineEntity>>([routineEntity]),
    );
    when(
      () => updateRoutineUseCase(routineEntity),
    ).thenAnswer(
      (_) async => Right<Failure, List<RoutineEntity>>(
        [routineEntity.copyWith(
          action: true,
        ),]
      ),
    );
  });

  setUp(
    () => {
      //Re-initialise DeviceBloc before each test
      routineBloc = RoutineBloc(
        updateRoutineUseCase: updateRoutineUseCase,
        getRoutinesUseCase: getRoutineUseCase,
        addRoutineUseCase: addRoutineUseCase,
      ),
    },
  );

  group(
    'Device Bloc',
    () {
      blocTest<RoutineBloc, RoutineState>(
        'on<AddRoutine> emits RoutineLoading then RoutineLoaded',
        build: () => routineBloc,
        setUp: () {},
        act: (bloc) => bloc.add( AddRoutine(routineEntity)),
        expect: () => [
          equals(const RoutineLoading([])),
          equals(const RoutineLoaded([])),
        ],
      );

      blocTest<RoutineBloc, RoutineState>(
        'on<UpdateRoutine> emits RoutineLoading then RoutineLoaded',
        build: () => routineBloc,
        act: (bloc) => bloc.add( UpdateRoutine(routineEntity)),
        expect: () => const[
          RoutineLoading([]),
          RoutineLoaded([]),
        ],
      );

      blocTest<RoutineBloc, RoutineState>(
        'on<FetchRoutines> emits RoutineLoading then RoutineLoaded',
        build: () => routineBloc,
        act: (bloc) => bloc.add( const FetchRoutines()),
        expect: () => [
          equals(const RoutineLoading([])),
          equals(const RoutineLoaded([])),
        ],
      );
    },
  );
  tearDown(() {
    ///Close Blocs here
    routineBloc.close();
  });
}
