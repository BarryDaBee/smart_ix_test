
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';

class WeekdayChip extends StatelessWidget {
  const WeekdayChip({super.key, required this.data, required this.isActive});
  final bool isActive;
  final String data;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 35.r,
      width: 35.r,
      margin: EdgeInsets.only(right: 6.r),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: AppColors.orange,
            width: 2,
          ),
        ),
        color: isActive ? AppColors.orange : AppColors.white,
      ),
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: AppTextStyles.body2.copyWith(
          color: isActive ? AppColors.white : AppColors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
