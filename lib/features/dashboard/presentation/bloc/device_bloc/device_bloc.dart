import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/dashboard/domain/entities/device_entity.dart';
import 'package:smart_home/features/dashboard/domain/usecases/add_device_use_case.dart';
import 'package:smart_home/features/dashboard/domain/usecases/add_service_use_case.dart';
import 'package:smart_home/features/dashboard/domain/usecases/get_devices_use_case.dart';
import 'package:smart_home/features/dashboard/domain/usecases/toggle_device_use_case.dart';

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
  }
  final AddDeviceUseCase addDeviceUseCase;
  final GetDeviceUseCase getDeviceUseCase;
  final ToggleDeviceUseCase toggleDeviceUseCase;

  Future<void> _onFetchDevices(
    DeviceEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DeviceLoading(state.devices));
    final result = await getDeviceUseCase.call(NoParams());
    result.fold(
      (error) => emit(
        DeviceError(state.devices),
      ),
      (devices) => emit(
        DeviceLoaded(devices),
      ),
    );
  }

  void _onAddDevice(DeviceEvent event, Emitter<DeviceState> emit) {
    emit(DeviceLoading(state.devices));
  }
}
