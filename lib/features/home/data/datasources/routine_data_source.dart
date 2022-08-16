import 'package:smart_home/features/home/domain/entities/entities.dart';

abstract class RoutineDataSource {
  Future<List<RoutineEntity>> addRoutine(RoutineEntity routine);
  Future<List<RoutineEntity>> updateRoutine(RoutineEntity routine);
  Future<List<RoutineEntity>> getAllRoutines(String tag);
}

class RoutineDataSourceImpl implements RoutineDataSource {
  final List<RoutineEntity> routines = [];

  @override
  Future<List<RoutineEntity>> addRoutine(RoutineEntity routine) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    routines.add(routine);
    return routines;
  }

  @override
  Future<List<RoutineEntity>> getAllRoutines(String tag) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    return routines;
  }

  @override
  Future<List<RoutineEntity>> updateRoutine(RoutineEntity routine) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    final routineIndex = routines.indexWhere(
      (element) => routine.id == element.id,
    );
    final updatedRoutine = routine.copyWith(
      image: routine.image,
      stopTime: routine.stopTime,
      startTime: routine.startTime,
      weekdays: routine.weekdays,
    );
    routines[routineIndex] = updatedRoutine;
    return routines;
  }
}
