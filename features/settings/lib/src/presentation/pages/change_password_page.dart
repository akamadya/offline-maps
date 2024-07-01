import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:settings/src/presentation/widgets/texts.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/component/molecule/molecule.dart';
import 'package:shared/generated/l10n.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final l10n = context.l10n;
    return AppToolbar(
      backgroundColor: Colors.white,
      title: l10n.changePassword,
      onback: () => context.pop(),
      content: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 16),
                child: getSemiBoldText(l10n.oldPassword),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
            child: PasswordTextField(
              controller: controller,
              hintText: l10n.oldPassword,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 16),
                child: getSemiBoldText(l10n.newPassword),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
            child: PasswordTextField(
              controller: controller,
              hintText: l10n.newPassword,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 16),
                child: getSemiBoldText(l10n.confirmPassword),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
            child: PasswordTextField(
              controller: controller,
              hintText: l10n.confirmPassword,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: AppButton(
                title: l10n.save,
                onPressed: () {
                  FeatureNotAvailableSheet.show(context);
                }),
          ),
        ],
      ),
    );
  }
}
