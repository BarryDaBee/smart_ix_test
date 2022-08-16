import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  const ServiceEntity({
    required this.id,
    required this.name,
    required this.details,
    required this.icon,
  });

  final String id;
  final String name;
  final String details;
  final String icon;

  @override
  List<Object> get props => [
    id,
    name,
    details,
    icon,
  ];
}
