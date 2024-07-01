import 'package:flutter/material.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/shared.dart';

class ItemAppBottomNavigation extends StatelessWidget {
  const ItemAppBottomNavigation(
      {super.key,
      this.onPressed,
      required this.iconAsset,
      this.isActive,
      required this.title});

  final Function()? onPressed;
  final String iconAsset;
  final bool? isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: InkWell(
        radius: 10,
        onTap: onPressed ?? () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(
              asset: iconAsset,
              color: isActive ?? false
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Styles.textSRegular.copyWith(
                  color: isActive ?? false
                      ? AppColors.primaryColor
                      : Colors.grey.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
