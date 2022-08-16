import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/app_colors.dart';

///Class for managing application text styles
class AppTextStyles {
  const AppTextStyles._();

  static const _fontFamily = 'Poppins';

  static const _primaryFontColor = AppColors.blueGrey10;
  static final _secondaryFontColor = AppColors.blueGrey10.withOpacity(0.5);


  ///header1 TextStyle
  ///- fontSize 24,
  static TextStyle header1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: _primaryFontColor,
  );

  ///header2 TextStyle
  ///- fontSize 20,
  static TextStyle header2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: _primaryFontColor,
  );

  ///header3 TextStyle
  ///- fontSize 14,
  static TextStyle header3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: _primaryFontColor,
  );

  ///bodyText TextStyle
  ///- fontSize 14,
  static TextStyle body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: _primaryFontColor,
  );

  ///bodyText2 TextStyle
  ///- fontSize 12,
  static TextStyle body2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: _primaryFontColor,
  );

  ///subTitleText1 TextStyle
  ///- fontSize 14,
  static TextStyle subTitle1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: _secondaryFontColor,
  );

  ///subTitleText2 TextStyle
  ///- fontSize 12,
  static TextStyle subTitle2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: _primaryFontColor,
  );


///TODO: Delete
//   static TextStyle buttonStyle = TextStyle(
//     fontFamily: _fontFamily,
//     fontSize: 16.fontSize,
//     fontWeight: FontWeight.w500,
//     color: AppColors.kcPrimaryTextColor,
//   );
}
