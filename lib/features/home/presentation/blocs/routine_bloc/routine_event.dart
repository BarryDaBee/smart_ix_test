part of 'routine_bloc.dart';

@immutable
abstract class RoutineEvent extends Equatable{
  const RoutineEvent();
  @override
  List<Object?> get props =>[];
}

class AddRoutine extends RoutineEvent {
  const AddRoutine(this.routine);
  final RoutineEntity routine;

  @override
  List<Object?> get props => [routine];
}

class FetchRoutines extends RoutineEvent {
  const FetchRoutines();
}

class UpdateRoutine extends RoutineEvent {
  const UpdateRoutine(this.routine);
  final RoutineEntity routine;

  @override
  List<Object?> get props => [routine];
}
