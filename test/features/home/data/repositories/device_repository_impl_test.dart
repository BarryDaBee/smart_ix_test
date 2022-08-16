import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/core/error/app_exception.dart';
import 'package:smart_home/core/error/failure.dart';
import 'package:smart_home/features/home/data/datasources/device_data_source.dart';
import 'package:smart_home/features/home/data/repositories/device_repository_impl.dart';
import 'package:smart_home/features/home/domain/entities/device_entity.dart';

class DeviceDataSourceMock extends Mock implements DeviceDataSource {}

void main() {
  final deviceDataSource = DeviceDataSourceMock();
  final repository = DeviceRepositoryImpl(deviceDataSource);

  const deviceEntity = DeviceEntity(
    name: 'Smart Lamp',
    status: Status.off,
    brand: 'Lontor',
    image: '',
  );

  group(
    'Add Device',
    () {
      test(
        '''
when [addDevice] is called and returns 
        an error, expect the Left side of Either''',
        () async {
          when(
            () => deviceDataSource.addDevice(deviceEntity),
          ).thenAnswer(
            (_) => throw const DeviceException('error'),
          );
          final result = await repository.addDevice(deviceEntity);
          expect(
            result,
            equals(
              const Left<Failure, DeviceEntity>(
                DeviceFailure(message: 'error'),
              ),
            ),
          );
          verify(
            () => deviceDataSource.addDevice(
              deviceEntity.copyWith(),
            ),
          );
        },
      );
      test(
        '''
when [addDevice] is called and
the call is successful expect the Right side of Either''',
        () async {
          when(
            () => deviceDataSource.addDevice(deviceEntity),
          ).thenAnswer(
            (_) => Future.value([deviceEntity]),
          );
          final result = await repository.addDevice(deviceEntity);
          late final List<DeviceEntity> rightSide;
          result.fold((l) => null, (r) => {rightSide = r});
          expect(
            rightSide,
            equals(
              [deviceEntity],
            ),
          );
        },
      );
    },
  );

  group(
    'Get all Devices',
    () {
      test(
        '''
when [getAllDevices] is called and the call is successful
expect the right side of either.''',
        () async {
          when(
            deviceDataSource.getAllDevices,
          ).thenAnswer(
            (_) => Future.value([deviceEntity]),
          );
          final result = await repository.getAllDevices();
          expect(result.length(), equals(1));
        },
      );


      test('''
when [getAllDevices] is called and returns an error
expect the left side of either.''', () async {
        when(
          deviceDataSource.getAllDevices,
        ).thenAnswer(
          (_) => throw const DeviceException('error'),
        );
        final result = await repository.getAllDevices();

        expect(
          result,
          equals(
            const Left<Failure, DeviceEntity>(
              DeviceFailure(message: 'error'),
            ),
          ),
        );
      });
    },
  );

  group(
    'Toggle Device status',
    () {
      test(
        'when [toggleDevice] is called and returns the right data, '
            'expect the Right side of Either',
        () async {
          when(
            () => deviceDataSource.toggleDevice(deviceEntity),
          ).thenAnswer(
            (_) => Future.value(
              [deviceEntity],
            ),
          );
          final result = await repository.toggleDeviceStatus(deviceEntity);
          late final List<DeviceEntity> rightSide;
          result.fold((l) => null, (r) => {rightSide = r});
          expect(
            rightSide,
            equals(
              [deviceEntity],
            ),
          );
          verify(
            () => deviceDataSource.toggleDevice(
              deviceEntity,
            ),
          );
        },
      );

      test(
        'when [toggleDevice] is called and returns an error, expect '
            'the Left side of Either',
        () async {
          when(
            () => deviceDataSource.toggleDevice(deviceEntity),
          ).thenAnswer(
            (_) => throw const DeviceException('error'),
          );
          final result = await repository.toggleDeviceStatus(deviceEntity);
          expect(
            result,
            equals(
              const Left<Failure, DeviceEntity>(
                DeviceFailure(message: 'error'),
              ),
            ),
          );
          verify(
            () => deviceDataSource.toggleDevice(
              deviceEntity,
            ),
          );
        },
      );
    },
  );
}
