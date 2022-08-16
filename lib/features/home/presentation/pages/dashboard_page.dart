import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';
import 'package:smart_home/features/home/domain/entities/entities.dart';
import 'package:smart_home/features/home/presentation/blocs/device_bloc/device_bloc.dart';
import 'package:smart_home/features/home/presentation/pages/pages.dart';
import 'package:smart_home/features/home/presentation/pages/routines_page.dart';
import 'package:smart_home/features/home/presentation/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    context.read<DeviceBloc>().add(const FetchDevices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.horizontal16,
              child: Text(
                'Welcome Home',
                style: AppTextStyles.header1,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 40.h,
              child: TabBar(
                controller: tabController,
                labelStyle: AppTextStyles.header3,
                labelColor: AppColors.blueGrey10,
                tabs: const [
                  Tab(
                    text: 'Devices',
                  ),
                  Tab(
                    text: 'Routines',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  DeviceTabWidget(),
                  RoutinesTabWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceTabWidget extends StatelessWidget {
  const DeviceTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20.h),
        CarWidget(
          onTap: () {
            //Navigator.of(context).pushNamed(DeviceDetailsPage.routeName);
          },
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: AppPadding.horizontal16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Devices',
                style: AppTextStyles.header2,
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        BlocConsumer<DeviceBloc, DeviceState>(
          listenWhen: (previous, current) => current is DeviceError,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error occurred'),
              ),
            );
          },
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
                            Navigator.of(context).pushNamed(
                              DeviceDetailsPage.routeName,
                              arguments: device,
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
    );
  }
}
