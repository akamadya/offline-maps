import 'package:flutter/material.dart';
import 'package:shared/preferences/preferences.dart';

class AppComboBox extends StatelessWidget {
  const AppComboBox({
    super.key,
    required this.text,
    required this.hint,
    this.widgetIcon,
    this.icon,
    this.widgetText,
    required this.onTap,
  });

  final String text;
  final String hint;
  final Widget? widgetText;
  final Widget? widgetIcon;
  final IconData? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap.call,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueGrey.shade200),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: widgetText ??
                  Text(
                    text.isNotEmpty ? text : hint,
                    style: Styles.textMRegular.copyWith(
                        color: text.isNotEmpty ? Colors.black87 : Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            widgetIcon ??
                Icon(
                  icon ?? Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                )
          ],
        ),
      ),
    );
  }
}
