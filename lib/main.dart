import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/core/router/app_router.dart';
import 'package:smart_home/features/home/domain/use_cases/add_device_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/add_routine_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_devices_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/get_routines_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/toggle_device_use_case.dart';
import 'package:smart_home/features/home/domain/use_cases/update_routine_use_case.dart';
import 'package:smart_home/features/home/presentation/blocs/device_bloc/device_bloc.dart';
import 'package:smart_home/features/home/presentation/blocs/routine_bloc/routine_bloc.dart';
import 'package:smart_home/locator.dart';

void main() async {
  await setupLocator();
  runApp(const SmartHome());
}

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<DeviceBloc>(
              create: (_) {
                return DeviceBloc(
                  toggleDeviceUseCase: locator<ToggleDeviceUseCase>(),
                  addDeviceUseCase: locator<AddDeviceUseCase>(),
                  getDeviceUseCase: locator<GetDevicesUseCase>(),
                );
              },
            ),
            BlocProvider<RoutineBloc>(
              create: (_) {
                return RoutineBloc(
                  addRoutineUseCase: locator<AddRoutineUseCase>(),
                  updateRoutineUseCase: locator<UpdateRoutineUseCase>(),
                  getRoutinesUseCase: locator<GetRoutinesUseCase>(),
                );
              },
            ),
          ],
          child: MaterialApp(
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.initialRoute,
            theme: ThemeData.light().copyWith(
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: AppColors.orange,
              ),
              scaffoldBackgroundColor: AppColors.white,
              iconTheme: IconThemeData(
                color: AppColors.white,
                size: 20.r,
              ),
            ),
          ),
        );
      },
    );
  }
}
