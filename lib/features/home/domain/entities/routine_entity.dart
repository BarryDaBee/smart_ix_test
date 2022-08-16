import 'package:equatable/equatable.dart';

class RoutineEntity extends Equatable {
  const RoutineEntity({
    required this.id,
    required this.startTime,
    required this.stopTime,
    required this.image,
    required this.action,
    required this.tag,
    required this.weekdays,
  });

  final String id;
  final String tag;
  final String image;
  final bool action;
  final DateTime startTime;
  final DateTime stopTime;
  final List<String> weekdays;

  RoutineEntity copyWith({
    String? image,
    bool? action,
    DateTime? startTime,
    DateTime? stopTime,
    List<String>? weekdays,
  }) {
    return RoutineEntity(
      image: image ?? this.image,
      weekdays: weekdays ?? this.weekdays,
      action: action ?? this.action,
      startTime: startTime ?? this.startTime,
      stopTime: stopTime ?? this.stopTime,
      tag: tag,
      id: id,
    );
  }

  @override
  List<Object> get props => [
        image,
        weekdays,
        startTime,
        stopTime,
      ];
}
