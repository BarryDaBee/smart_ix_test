import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/core/utils/helper_functions.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/presentation/pages/update_routine_page.dart';
import 'package:smart_home/features/home/presentation/widgets/shrinkable_button.dart';

class RoutineTile extends StatelessWidget {
  const RoutineTile(
      {super.key, required this.routine,  this.showImage = false,});
  final bool showImage;
  final RoutineEntity routine;

  @override
  Widget build(BuildContext context) {
    return ShrinkableButton(
      onTap: () {
        showModalBottomSheet<dynamic>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return UpdateRoutinePage(
              routine: routine,
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (showImage)
                Image.asset(routine.image, width: 60.w,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: AppTextStyles.header3,
                  ),
                  Text(
                    HelperFunctions.parseStringFromDateTime(routine.startTime),
                    style: AppTextStyles.body,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'To',
                    style: AppTextStyles.header3,
                  ),
                  Text(
                    HelperFunctions.parseStringFromDateTime(routine.stopTime),
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'Weekdays',
                    style: AppTextStyles.header3.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      routine.weekdays.length,
                      (index) => Text(
                        '${routine.weekdays[index]}, ',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 20.h,
            thickness: 5.h,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
