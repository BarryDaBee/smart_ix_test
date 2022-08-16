import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/features/home/domain/entities/device_entity.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';
import 'package:smart_home/features/home/domain/use_cases/toggle_device_use_case.dart';

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

void main() {
  final repository = DeviceRepositoryMock();
  final useCase = ToggleDeviceUseCase(repository);
  group('toggle device useCase ...', () {
    const deviceEntity = DeviceEntity(
      name: 'name',
      status: Status.off,
      image: '',
      brand: 'Sony',
    );

    test('''
verify a call to [DeviceRepository.toggleDevice]
    the right data''', () async {
      when(() => repository.toggleDeviceStatus(deviceEntity))
          .thenAnswer((_) async => const Right([deviceEntity]));
      await useCase(deviceEntity);
      verify(
        () => repository.toggleDeviceStatus(
          deviceEntity.copyWith(status: Status.off),
        ),
      );
    });
  });
}
