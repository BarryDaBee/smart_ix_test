import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  const DeviceEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  final String id;
  final String name;
  final bool status;
  final String image;

  @override
  List<Object> get props => [
    id,
    name,
    status,
    image,
  ];
}
