import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/home/presentation/widgets/action_button.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onSwitchPressed,
    required this.isSwitchedOn,
  });

  final String title;
  final String subtitle;
  final VoidCallback onSwitchPressed;
  final String imagePath;
  final bool isSwitchedOn;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 150.h,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: AppColors.lightGrey,
            offset: Offset(0, 20),
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
      ),
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: AppTextStyles.header3,
          ),
          Text(
            subtitle,
            style: AppTextStyles.subTitle2,
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Hero(
                  tag: imagePath,
                  child: Image.asset(
                    imagePath,
                    height: 90.h,
                  ),
                ),
              ),
              PowerButton(
                value: isSwitchedOn,
                onChanged: (bool value) {
                  onSwitchPressed();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
