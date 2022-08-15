part of 'device_bloc.dart';

abstract class DeviceState extends Equatable {
  const DeviceState(this.devices);
  final List<DeviceEntity> devices;

  @override
  List<Object> get props => [devices];
}

class DeviceInitial extends DeviceState {
  const DeviceInitial(super.devices);
}

class DeviceLoading extends DeviceState{

  const DeviceLoading(super.devices);
}

class DeviceLoaded extends DeviceState{
  const DeviceLoaded(super.devices);
}

class DeviceError extends DeviceState {
  const DeviceError(super.devices);
}
