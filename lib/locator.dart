import 'package:get_it/get_it.dart';
import 'package:smart_home/features/home/data/datasources/device_data_source.dart';
import 'package:smart_home/features/home/data/datasources/routine_data_source.dart';
import 'package:smart_home/features/home/data/repositories/device_repository_impl.dart';
import 'package:smart_home/features/home/data/repositories/routine_repository_impl.dart';
import 'package:smart_home/features/home/domain/repositories/repositories.dart';
import 'package:smart_home/features/home/domain/use_cases/add_device_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/add_routine_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/add_service_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_devices_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_routines_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/toggle_device_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/update_routine_use_case.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator
    ..registerLazySingleton(() => AddServiceUseCase(locator()))
    ..registerLazySingleton(() => AddDeviceUseCase(locator()))
    ..registerLazySingleton(() => AddRoutineUseCase(locator()))
    ..registerLazySingleton(() => ToggleDeviceUseCase(locator()))
    ..registerLazySingleton(() => GetDevicesUseCase(locator()))
    ..registerLazySingleton(() => UpdateRoutineUseCase(locator()))
    ..registerLazySingleton(() => GetRoutinesUseCase(locator()))

    ..registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(locator()),
    )
    ..registerLazySingleton<RoutineRepository>(
      () => RoutineRepositoryImpl(locator()),
    )

//!DataSources DI
    ..registerLazySingleton<DeviceDataSource>(
      DeviceDataSourceImpl.new,
    )
    ..registerLazySingleton<RoutineDataSource>(
      RoutineDataSourceImpl.new,
    );
}
