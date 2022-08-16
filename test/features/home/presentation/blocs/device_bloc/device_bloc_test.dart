import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/core/use_case.dart';
import 'package:smart_home/features/home/domain/entities/device_entity.dart';
import 'package:smart_home/features/home/domain/use_cases/add_device_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_devices_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/toggle_device_use_case.dart';
import 'package:smart_home/features/home/presentation/blocs/device_bloc/device_bloc.dart';

class AddDeviceUseCaseMock extends Mock implements AddDeviceUseCase {}

class ToggleDeviceUseCaseMock extends Mock implements ToggleDeviceUseCase {}

class GetDeviceUseCaseMock extends Mock implements GetDevicesUseCase {}

void main() {
  final AddDeviceUseCase addDeviceUseCase = AddDeviceUseCaseMock();
  final GetDevicesUseCase getDeviceUseCase = GetDeviceUseCaseMock();
  final ToggleDeviceUseCase toggleDeviceUseCase = ToggleDeviceUseCaseMock();

  const deviceEntity = DeviceEntity(
    name: 'Smart Lamp',
    status: Status.off,
    image: '',
    brand: 'Lontor',
  );

  late DeviceBloc deviceBloc;
  setUpAll(() async {
    when(
      () => addDeviceUseCase(deviceEntity),
    ).thenAnswer(
      (_) async => const Right<Failure, List<DeviceEntity>>([deviceEntity]),
    );
    when(
      () => getDeviceUseCase(NoParams()),
    ).thenAnswer(
      (_) async => const Right<Failure, List<DeviceEntity>>([deviceEntity]),
    );
    when(
      () => toggleDeviceUseCase(deviceEntity),
    ).thenAnswer(
      (_) async => Right<Failure, List<DeviceEntity>>(
        [deviceEntity.copyWith()],
      ),
    );
  });

  setUp(
    () => {
      //Re-initialise DeviceBloc before each test
      deviceBloc = DeviceBloc(
        toggleDeviceUseCase: toggleDeviceUseCase,
        getDeviceUseCase: getDeviceUseCase,
        addDeviceUseCase: addDeviceUseCase,
      ),
    },
  );

  group(
    'DeviceBloc - ',
    () {
      blocTest<DeviceBloc, DeviceState>(
        'on<AddDevice> emits DeviceLoading, then DeviceLoaded',
        build: () => deviceBloc,
        setUp: () {},
        act: (bloc) => bloc.add(const AddDevice(deviceEntity)),
        expect: () => [
          equals(const DeviceLoading([])),
          equals(
            DeviceLoaded(
              [
                deviceEntity.copyWith(),
              ],
            ),
          ),
        ],
      );

      blocTest<DeviceBloc, DeviceState>(
        ' on<ToggleDevice> emits DeviceLoading then DeviceLoaded',
        build: () => deviceBloc,
        act: (bloc) => bloc.add(const ToggleDevice(deviceEntity)),
        expect: () => [
          equals(const DeviceLoading([])),
          equals(DeviceLoaded([deviceEntity.copyWith()])),
        ],
      );

      blocTest<DeviceBloc, DeviceState>(
        'on<FetchDevices> emits DeviceLoading then DeviceLoaded',
        build: () => deviceBloc,
        act: (bloc) => bloc.add(const FetchDevices()),
        expect: () => [
          equals(const DeviceLoading([])),
          equals(DeviceLoaded([deviceEntity.copyWith()])),
        ],
      );
    },
  );
  tearDown(() {
    ///Close Blocs here
    deviceBloc.close();
  });
}
