import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/dashboard/presentation/pages/pages.dart';
import 'package:smart_home/features/dashboard/presentation/widgets/widgets.dart';

class DeviceDetailsPage extends StatelessWidget {
  const DeviceDetailsPage({super.key});
  static const routeName = '/deviceDetailsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        iconTheme: IconTheme.of(context).copyWith(color: AppColors.blueGrey),
      ),
      body: Padding(
        padding: AppPadding.horizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: AppAssetsPath.car,
              child: Image.asset(AppAssetsPath.car),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Smart Car',
                      style: AppTextStyles.header1.copyWith(
                        color: AppColors.blueGrey10,
                      ),
                    ),
                    Text(
                      'VEHICLE',
                      style: AppTextStyles.subTitle1,
                    ),
                  ],
                ),
                const PowerButton(value: false),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Routines',
                  style: AppTextStyles.header2.copyWith(
                    color: AppColors.blueGrey10,
                  ),
                ),
                ActionButton(
                  icon: const Icon(Icons.add),
                  onTap: () {
                    showModalBottomSheet<dynamic>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const RoutinePage();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
