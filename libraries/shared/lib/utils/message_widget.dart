import 'package:flutter/material.dart';
import 'package:shared/component/atom/app_button.dart';
import 'package:shared/component/molecule/molecule.dart';
import 'package:shared/extensions/extensions.dart';
import 'package:shared/preferences/styles.dart';

class MessageWidget {
  static Future<void> showError(
    BuildContext context, {
    required String message,
    String? title,
    String? titleButton,
    Function? onPressed,
  }) async {
    AppTemplateSheet(
      title: title ?? 'Terjadi Kesalahan',
      message: message,
      titleButton: titleButton,
      onTapButton: () => onPressed?.call(),
    ).show(context);
  }

  static Future<void> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? titleOkeButton,
    String? titleCancelButton,
    Function? onPressed,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (_) {
        return AppCustomDialog(
          title: title,
          content: message,
          actionsHorizontal: [
            Expanded(
              child: AppButton(
                title: titleOkeButton ?? 'Lanjutkan',
                onPressed: onPressed ?? () => Navigator.pop(context),
              ),
            ),
            10.pw(),
            Expanded(
              child: AppButton(
                  textTitle: Text(titleCancelButton ?? 'Batal',
                      style: Styles.textMRegular),
                  colorBorder: Colors.grey.shade400,
                  colorFill: Colors.white,
                  onPressed: () async {
                    Navigator.pop(context);
                  }),
            ),
          ],
        );
      },
    );
  }
}
