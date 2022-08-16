import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/domain/use_cases/add_routine_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_routines_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/update_routine_use_case.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  RoutineBloc({
    required this.getRoutinesUseCase,
    required this.addRoutineUseCase,
    required this.updateRoutineUseCase,
  }) : super(const RoutineInitial([])) {
    on<AddRoutine>(_onAddRoutine);
    on<FetchRoutines>(_onFetchRoutines);
    on<UpdateRoutine>(_onUpdateRoutine);
  }
  final AddRoutineUseCase addRoutineUseCase;
  final GetRoutinesUseCase getRoutinesUseCase;
  final UpdateRoutineUseCase updateRoutineUseCase;

  Future<void> _onAddRoutine(
    AddRoutine event,
    Emitter<RoutineState> emit,
  ) async {
    emit(RoutineLoading(state.routines));
    final result = await addRoutineUseCase(event.routine);
    result.fold(
      (error) => emit(
        RoutineError(state.routines),
      ),
      (routines) => emit(
        RoutineLoaded(routines),
      ),
    );
  }

  Future<void> _onFetchRoutines(
    FetchRoutines event,
    Emitter<RoutineState> emit,
  ) async {
    final currentStateRoutines = List<RoutineEntity>.from(state.routines);
    emit(RoutineLoading(currentStateRoutines));
    final result = await getRoutinesUseCase('');
    result.fold(
      (error) => emit(
        RoutineError(currentStateRoutines),
      ),
      (routines) => emit(
        RoutineLoaded(routines),
      ),
    );
  }

  Future<void> _onUpdateRoutine(
    UpdateRoutine event,
    Emitter<RoutineState> emit,
  ) async {
    final currentStateRoutines = List<RoutineEntity>.from(state.routines);
    emit(RoutineLoading(currentStateRoutines));
    final result = await updateRoutineUseCase(event.routine);
    result.fold(
      (error) => emit(
        RoutineError(currentStateRoutines),
      ),
      (routines) => emit(
        RoutineLoaded(routines),
      ),
    );
  }
}
