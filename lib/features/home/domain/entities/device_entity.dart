import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  const DeviceEntity({
    required this.brand,
    required this.name,
    required this.status,
    required this.image,
  });

  final String name;
  final String brand;
  final Status status;
  final String image;

  DeviceEntity copyWith({
    String? name,
    Status? status,
    String? image,
    String? brand,
  }) =>
      DeviceEntity(
        name: name ?? this.name,
        status: status ?? this.status,
        image: image ?? this.image,
        brand: brand ?? this.brand,
      );

  @override
  List<Object> get props => [
        name,
        status,
        image,
        brand,
      ];
}

enum Status { on, off, disconnected }
