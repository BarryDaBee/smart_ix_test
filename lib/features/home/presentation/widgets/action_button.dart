import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/constants/constants.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    this.showShadow = true, this.onTap,
  });
  final Icon icon;
  final bool showShadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.orange,
          boxShadow: [
            if (showShadow)
              BoxShadow(
                color: AppColors.orange.withOpacity(0.4),
                offset: const Offset(0, 2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
          ],
        ),
        child: icon,
      ),
    );
  }
}

class PowerButton extends StatelessWidget {
  const PowerButton({super.key, required this.value, this.onChanged});
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChanged?.call(!value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.r),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: value?AppColors.orange:AppColors.lightGrey,
        ),
        child: Icon(
          Icons.power_settings_new_rounded,
          size: 25.r,
          color: value?AppColors.white : AppColors.blueGrey10.withOpacity(0.5),
        ),
      ),
    );
  }
}
