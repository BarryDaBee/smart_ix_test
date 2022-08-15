import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/dashboard/presentation/widgets/widgets.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: Navigator.of(context).pop,
            behavior: HitTestBehavior.opaque,
            child: CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.white,
              child: const Icon(
                Icons.close_rounded,
                color: AppColors.blueGrey,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Add routine',
                      style: AppTextStyles.header1.copyWith(
                        color: AppColors.blueGrey10,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Schedule',
                      style: AppTextStyles.header2.copyWith(
                        color: AppColors.blueGrey10,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'From',
                      style: AppTextStyles.body,
                    ),
                    SizedBox(height: 5.h),
                    const TimePicker(),
                    SizedBox(height: 15.h),
                    Text(
                      'To',
                      style: AppTextStyles.body,
                    ),
                    SizedBox(height: 5.h),
                    const TimePicker(),
                    SizedBox(height: 20.h),
                    DaysOfWeekPicker(
                      onDaySelected: (List<String> value) {},
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(text: 'Done', onTap: () {}),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              Positioned(
                right: -100.w,
                top: 70.h,
                child: Image.asset(
                  AppAssetsPath.clock,
                  height: 200.r,
                  width: 200.r,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<String> weekdays = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];

class DaysOfWeekPicker extends StatefulWidget {
  const DaysOfWeekPicker({super.key, required this.onDaySelected});
  final ValueChanged<List<String>> onDaySelected;

  @override
  State<DaysOfWeekPicker> createState() => _DaysOfWeekPickerState();
}

class _DaysOfWeekPickerState extends State<DaysOfWeekPicker> {
  final List<String> _selectedDays = [];

  @override
  void initState() {
    final weekdayIndex = DateTime.now().weekday - 1;

    _addDay(weekdays[weekdayIndex]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(7, (index) {
        final weekday = weekdays[index];
        final isSelected = _selectedDays.contains(weekday);
        return InkWell(
          onTap: (){
            if (isSelected){
              _removeDay(weekday);
            }else{
              _addDay(weekday);
            }
          },
          child: DayOfWeekChip(
            data: weekday,
            isActive: isSelected,
          ),
        );
      }),
    );
  }

  void _addDay(String day) {
    setState((){
      _selectedDays.add(day);
    });
  }

  void _removeDay(String day) {
    setState((){
      _selectedDays.remove(day);
    });
  }
}

class DayOfWeekChip extends StatelessWidget {
  const DayOfWeekChip({super.key, required this.data, required this.isActive});
  final bool isActive;
  final String data;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.all(8.r),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: AppColors.orange,
          ),
        ),
        color: isActive ? AppColors.orange : AppColors.white,
      ),
      child: Text(
        data,
        style: AppTextStyles.body2.copyWith(
          color: isActive ? AppColors.white : AppColors.orange,
        ),
      ),
    );
  }
}
