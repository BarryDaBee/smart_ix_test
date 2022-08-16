import 'package:equatable/equatable.dart';

///General Failure interface.
///OnError: This will be thrown instead of Exceptions
abstract class Failure extends Equatable {
  const Failure(this.message);

  ///Error message;
  final String message;
  @override
  List<Object> get props => [];
}

///Routine related failures
class DeviceFailure extends Failure {
  const DeviceFailure({
    String? message,
  }) : super(message ?? '');
  @override
  List<Object> get props => [message];
}
///Device related failures
class RoutineFailure extends Failure {
  const RoutineFailure({
    String? message,
  }) : super(message ?? '');
  @override
  List<Object> get props => [message];
}
