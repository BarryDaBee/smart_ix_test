import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/home/presentation/widgets/widgets.dart';


class CarWidget extends StatelessWidget {
  const CarWidget({super.key, required this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: AppColors.lightGrey,
              offset: Offset(0, 12),
              spreadRadius: 3,
              blurRadius: 10,
            ),
            BoxShadow(
              color: AppColors.lightGrey,
              offset: Offset(5, 0),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(40),
          color: AppColors.white,
        ),
        margin: AppPadding.horizontal16,
        padding: EdgeInsets.all(16.r),
        child: Stack(
          children: [
            Hero(
              tag: AppAssetsPath.car,
              child: Image.asset(AppAssetsPath.car),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.r,
                        vertical: 8.r,
                      ),
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(color: AppColors.orange, width: 2),
                        ),
                      ),
                      child: Text(
                        'CHARGING',
                        style: AppTextStyles.body2.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Electric Car',
                      style: AppTextStyles.header2,
                    ),
                  ],
                ),
                const Spacer(),
                 const BatteryLevelIndicator(
                  percentage: 80,
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // const ActionButton(
                    //   icon: Icon(CupertinoIcons.location_north),
                    // ),
                    // const SizedBox(width: 20),
                    // const ActionButton(
                    //   icon: Icon(CupertinoIcons.bolt_fill),
                    // ),
                    const ActionButton(
                      icon: Icon(Icons.key_sharp),
                    ),
                    const SizedBox(width: 20),
                    const ActionButton(
                      icon: Icon(CupertinoIcons.lock_fill),
                    ),
                    const Spacer(),
                    Text(
                      '300km',
                      style: AppTextStyles.header2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
