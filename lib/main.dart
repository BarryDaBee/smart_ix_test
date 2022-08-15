import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/core/router/app_router.dart';

void main() {
  runApp(const SmartHome());
}

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.initialRoute,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColors.white,
            iconTheme: IconThemeData(
              color: AppColors.white,
              size: 20.r,
            ),
          ),
        );
      },
    );
  }
}
