part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
  @override
  List<Object?> get props => [];
}

class AddDevice extends DeviceEvent{
  const AddDevice(this.device);

  final DeviceEntity device;
}

class ToggleDevice extends DeviceEvent{
  const ToggleDevice(this.device);

  final DeviceEntity device;
  @override
  List<Object?> get props => [device];
}

class FetchDevices extends DeviceEvent{
  const FetchDevices();
}
