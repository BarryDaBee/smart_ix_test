import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/core/utils/helper_functions.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key, required this.onTimeSelected, this.initialDate});
  final DateTime? initialDate;
  final ValueChanged<DateTime> onTimeSelected;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late DateTime _selectedDateTime = widget.initialDate ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (Platform.isIOS) {
            showCupertinoModalPopup<dynamic>(
              context: context,
              builder: (context) => Container(
                color: Colors.transparent,
                height: 300.h,
                width: 500.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        margin: AppPadding.horizontal8,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          initialDateTime: _selectedDateTime,
                          onDateTimeChanged: (value) {
                            setState(() {
                              _selectedDateTime = value;
                            });
                            widget.onTimeSelected(_selectedDateTime);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: AppPadding.horizontal8,
                      child: CupertinoButton(
                        onPressed: Navigator.of(context).pop,
                        color: AppColors.white,
                        child: Text(
                          'Done',
                          style: AppTextStyles.header2.copyWith(
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            );
          } else {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              setState(() {
                _selectedDateTime =
                    HelperFunctions.parseDateTimeFromTimeOfDay(value) ??
                        _selectedDateTime;
              });
              widget.onTimeSelected(_selectedDateTime);
            });
          }
        },
        child: Container(
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.blueGrey.withOpacity(0.1),
          ),
          padding: EdgeInsets.all(10.r),
          child: Text(
            HelperFunctions.parseStringFromDateTime(_selectedDateTime),
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
