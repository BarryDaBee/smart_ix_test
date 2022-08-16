import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/core/utils/helper_functions.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/presentation/blocs/routine_bloc/routine_bloc.dart';
import 'package:smart_home/features/home/presentation/widgets/weekdays_picker.dart';
import 'package:smart_home/features/home/presentation/widgets/widgets.dart';

class AddRoutinePage extends StatefulWidget {
  const AddRoutinePage({super.key, required this.device});
  final DeviceEntity device;
  @override
  State<AddRoutinePage> createState() => _AddRoutinePageState();
}

class _AddRoutinePageState extends State<AddRoutinePage> {
  List<String> _selectedDays = [];

   DateTime _startDate = DateTime.now();

   DateTime _stopDate = DateTime.now();

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
                      'Schedule On/Off',
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
                    TimePicker(
                      onTimeSelected: (DateTime value) {
                        setState((){
                          _startDate = value;
                        });
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'To',
                      style: AppTextStyles.body,
                    ),
                    SizedBox(height: 5.h),
                    TimePicker(
                      onTimeSelected: (DateTime value) {
                        setState((){
                          _stopDate = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.h),
                    WeekdaysPicker(
                      onDaySelected: (List<String> value) {
                        _selectedDays = value;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      text: 'Done',
                      onTap: () {
                        final routine = RoutineEntity(
                          tag: widget.device.image,
                          startTime: _startDate,
                          stopTime:_stopDate,
                          action: false,
                          image: widget.device.image,
                          weekdays: _selectedDays,
                          id: HelperFunctions.getRandomString(8),
                        );
                        context.read<RoutineBloc>().add(AddRoutine(routine));
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              Positioned(
                right: -40.w,
                top: 70.h,
                child: Image.asset(
                  widget.device.image,
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
