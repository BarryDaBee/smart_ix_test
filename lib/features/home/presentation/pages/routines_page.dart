import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/presentation/blocs/device_bloc/device_bloc.dart';
import 'package:smart_home/features/home/presentation/blocs/routine_bloc/routine_bloc.dart';
import 'package:smart_home/features/home/presentation/pages/pages.dart';
import 'package:smart_home/features/home/presentation/widgets/widgets.dart';

class RoutinesTabWidget extends StatelessWidget {
  const RoutinesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<RoutineBloc, RoutineState>(
            builder: (context, state) {
              if (state is RoutineLoading) {
                return const LoadingIndicator();
              }
              return ListView.builder(
                padding: AppPadding.horizontal16,
                itemCount: state.routines.length,
                itemBuilder: (context, index) {
                  final routine = state.routines[index];
                  return RoutineTile(routine: routine, showImage: true,);
                },
              );
            },
          ),
        ),

        ActionButton(icon: const Icon(Icons.add), onTap: (){
          showModalBottomSheet<dynamic>(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const SelectDevicePage();
            },
          );
        },),
        SizedBox(height: 30.h),
      ],
    );
  }
}


class SelectDevicePage extends StatelessWidget {
  const SelectDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Text('Select a Device', style: AppTextStyles.header1,),
          BlocBuilder<DeviceBloc, DeviceState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AbsorbPointer(
                    absorbing: state is DeviceLoading,
                    child: Opacity(
                      opacity: state is DeviceLoading ? 0.5 : 1,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(16.r),
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.devices.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.r,
                          crossAxisSpacing: 10.r,
                        ),
                        itemBuilder: (context, index) {
                          final device = state.devices[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).pop();
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
                            child: DeviceCard(
                              title: device.name,
                              subtitle: device.brand,
                              imagePath: device.image,
                              onSwitchPressed: () {
                                context.read<DeviceBloc>().add(
                                  ToggleDevice(device),
                                );
                              },
                              isSwitchedOn: device.status == Status.on,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (state is DeviceLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
