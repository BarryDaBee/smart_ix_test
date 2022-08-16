import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/presentation/blocs/device_bloc/device_bloc.dart';
import 'package:smart_home/features/home/presentation/blocs/routine_bloc/routine_bloc.dart';
import 'package:smart_home/features/home/presentation/pages/pages.dart';
import 'package:smart_home/features/home/presentation/widgets/widgets.dart';

class DeviceDetailsPage extends StatelessWidget {
  const DeviceDetailsPage({super.key, required this.device});

  final DeviceEntity device;
  static const routeName = '/deviceDetailsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        iconTheme: IconTheme.of(context).copyWith(color: AppColors.blueGrey),
      ),
      body: SingleChildScrollView(
        padding: AppPadding.horizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: device.image,
              child: Image.asset(device.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name,
                      style: AppTextStyles.header1.copyWith(
                        color: AppColors.blueGrey10,
                      ),
                    ),
                    Text(
                      device.brand,
                      style: AppTextStyles.subTitle1,
                    ),
                  ],
                ),
                BlocBuilder<DeviceBloc, DeviceState>(
                  builder: (context, state) {
                    if(state is DeviceLoading){
                      return const LoadingIndicator();
                    }
                    return PowerButton(
                      value: device.status == Status.on,
                      onChanged: (_) {
                        Navigator.of(context).pop();
                        context.read<DeviceBloc>().add(
                          ToggleDevice(device),
                        );

                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Routines',
                  style: AppTextStyles.header2.copyWith(
                    color: AppColors.blueGrey10,
                  ),
                ),
                ActionButton(
                  icon: const Icon(Icons.add),
                  onTap: () {
                    showModalBottomSheet<dynamic>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return AddRoutinePage(
                          device: device,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
            BlocBuilder<RoutineBloc, RoutineState>(
              builder: (context, state) {
                if (state is RoutineLoading) {
                  return const LoadingIndicator();
                }
                return Column(
                  children: state.routines
                      .where((element) => element.tag == device.image)
                      .map((routine) {
                    return RoutineTile(
                      routine: routine,
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
