part of 'routine_bloc.dart';

@immutable
abstract class RoutineState extends Equatable{
  const RoutineState(this.routines);

  final List<RoutineEntity> routines;
  @override
  List<Object?> get props => [];
}

class RoutineInitial extends RoutineState {
  const RoutineInitial(super.routines);


}

class RoutineLoading extends RoutineState {
  const RoutineLoading(super.routines);
}

class RoutineLoaded extends RoutineState {
  const RoutineLoaded(super.routines);
}


class RoutineError extends RoutineState {
  const RoutineError(super.routines);
}
