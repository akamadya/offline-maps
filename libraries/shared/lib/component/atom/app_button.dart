import 'package:flutter/material.dart';
import 'package:shared/preferences/preferences.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.title,
    required this.onPressed,
    super.key,
    this.textTitle,
    this.colorBorder,
    this.colorFill,
  });

  final String? title;
  final Widget? textTitle;
  final Function onPressed;
  final Color? colorBorder;
  final Color? colorFill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: MaterialButton(
        onPressed: () => onPressed.call(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: colorBorder ?? Colors.grey.shade200,
            width: colorBorder != null ? 1.5 : 0,
          ),
        ),
        height: 45,
        color: colorFill ?? AppColors.primaryColor,
        child: textTitle ??
            Text(
              title ?? '',
              style: Styles.textMBold.copyWith(
                color: colorBorder ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
