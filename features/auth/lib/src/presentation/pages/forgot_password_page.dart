import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/component/molecule/molecule.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/shared.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppToolbar(
        title: l10n.titleForgotPass,
        onback: () => context.pop(),
        content: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                l10n.sendVerifiedCode,
                style: Styles.textLRegular.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.descForgotPass,
                style: Styles.textMRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Email',
                    style: Styles.textMRegular.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black54)),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: _emailController,
                decoration: AppInputDecoration(hintText: l10n.enterEmail),
                prefixWidget: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    MainAssets.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                title: l10n.login,
                onPressed: () {
                  //context.push(NamedRoutes.successForgotPass);
                  FeatureNotAvailableSheet.show(context);
                },
              ),
            ],
          ),
        ));
  }
}
