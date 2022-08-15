import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/dashboard/presentation/pages/pages.dart';
import 'package:smart_home/features/dashboard/presentation/widgets/widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const routeName = '/dashboardPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: AppPadding.horizontal16,
              child: Text(
                'Welcome Home',
                style: AppTextStyles.header1,
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: AppPadding.horizontal16,
              child: DeviceCard(
                title: 'AC',
                subtitle: 'Samsung Smart',
                imagePath: AppAssetsPath.airCondition,
                onTap: () {
                  Navigator.of(context).pushNamed(DeviceDetailsPage.routeName);
                },
              ),
            ),
            SizedBox(height: 20.h),
            CarWidget(
              onTap: () {
                Navigator.of(context).pushNamed(DeviceDetailsPage.routeName);
              },
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: AppPadding.horizontal16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Devices',
                    style: AppTextStyles.header2,
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.r),
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.r,
                crossAxisSpacing: 10.r,
              ),
              itemBuilder: (context, index) {
                return DeviceCard(
                  title: 'AC',
                  subtitle: 'Samsung Smart',
                  imagePath:
                      index.isEven ? AppAssetsPath.bulb : AppAssetsPath.lamp,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DeviceDetailsPage.routeName);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
