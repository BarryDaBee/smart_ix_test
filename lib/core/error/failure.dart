import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);
  final String message;
  @override
  List<Object> get props => [];
}

// General failures
class DeviceFailure extends Failure {
  const DeviceFailure({
    String? message,
  }) : super(message ?? '');
  @override
  List<Object> get props => [...super.props, message];
}
