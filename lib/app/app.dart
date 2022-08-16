import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/app/locator.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/core/router/app_router.dart';
import 'package:smart_home/features/home/domain/use_cases/use_cases.dart';

class App extends StatelessWidget {
  const App({super.key});

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
            debugShowCheckedModeBanner: false,
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