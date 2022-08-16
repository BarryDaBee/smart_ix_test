import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';

class BatteryLevelIndicator extends StatelessWidget {
  const BatteryLevelIndicator({super.key, required this.percentage})
      : assert(percentage <= 100, 'Percentage cannot be greater than 100');
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.bolt_fill,
          size: 25.r,
          color: AppColors.teal,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              40,
                  (index) {
                return Container(
                  height: 20.r,
                  width: 3.r,
                  margin: EdgeInsets.only(right: 1.5.w),
                  color: (index * 2.5) < percentage
                      ? Color.lerp(
                    AppColors.orange,
                    Colors.blue,
                    index / (percentage ~/ 2.5),
                  )
                      : Colors.black26,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          '$percentage%',
          style: AppTextStyles.header3,
        ),
      ],
    );
  }
}
