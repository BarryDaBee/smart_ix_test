import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const _fontFamily = 'Poppins';
  static const primaryFontColor = AppColors.blueGrey10;
  static final secondaryFontColor = AppColors.blueGrey10.withOpacity(0.5);


  static TextStyle header1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: primaryFontColor,
  );

  static TextStyle header2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: primaryFontColor,
  );

  static TextStyle header3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: primaryFontColor,
  );

  static TextStyle body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: primaryFontColor,
  );
  static TextStyle body2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: primaryFontColor,
  );

  static TextStyle subTitle1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: secondaryFontColor,
  );

  static TextStyle subTitle2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: primaryFontColor,
  );


///TODO: Delete
//   static TextStyle buttonStyle = TextStyle(
//     fontFamily: _fontFamily,
//     fontSize: 16.fontSize,
//     fontWeight: FontWeight.w500,
//     color: AppColors.kcPrimaryTextColor,
//   );
}
