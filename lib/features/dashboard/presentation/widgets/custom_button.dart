
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.height,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final double? fontSize;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52.h,
      child: IgnorePointer(
        ignoring: isLoading,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: buttonColor ?? AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              )),
          onPressed: onTap,
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
            text,
            style: AppTextStyles.header2.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}