import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/device_entity.dart';
import 'package:smart_home/features/home/domain/use_cases/add_device_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_devices_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/toggle_device_use_case.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc({
    required this.addDeviceUseCase,
    required this.getDeviceUseCase,
    required this.toggleDeviceUseCase,
  }) : super(const DeviceInitial([])) {
    on<FetchDevices>(_onFetchDevices);
    on<AddDevice>(_onAddDevice);
    on<ToggleDevice>(_onToggleDevice);
  }

  final AddDeviceUseCase addDeviceUseCase;
  final GetDevicesUseCase getDeviceUseCase;
  final ToggleDeviceUseCase toggleDeviceUseCase;

  Future<void> _onFetchDevices(
    DeviceEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DeviceLoading(state.devices));
    final result = await getDeviceUseCase(NoParams());
    result.fold(
      (error) => emit(
        DeviceError(state.devices),
      ),
      (devices) => emit(
        DeviceLoaded(devices),
      ),
    );
  }

  Future<void> _onAddDevice(AddDevice event, Emitter<DeviceState> emit) async {
    emit(DeviceLoading(state.devices));
    final result = await addDeviceUseCase(event.device);
    result.fold(
      (error) => emit(
        DeviceError(List.from(state.devices)),
      ),
      (devices) => emit(
        DeviceLoaded(devices),
      ),
    );
  }

  Future<void> _onToggleDevice(
    ToggleDevice event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DeviceLoading(state.devices));
    final result = await toggleDeviceUseCase(event.device);
    result.fold(
      (error) => emit(
        DeviceError(List.from(state.devices)),
      ),
      (devices) => emit(
        DeviceLoaded(devices),
      ),
    );
  }
}
