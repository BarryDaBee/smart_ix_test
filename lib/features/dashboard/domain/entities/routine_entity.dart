import 'package:equatable/equatable.dart';

class RoutineEntity extends Equatable {
  const RoutineEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.repeatedDays,
    required this.action,
    required this.time,
  });

  final String id;
  final String name;
  final String imagePath;
  final bool action;
  final String time;
  final List<String> repeatedDays;

  @override
  List<Object> get props => [
    id,
    name,
    imagePath,
    repeatedDays,
    time,
  ];
}