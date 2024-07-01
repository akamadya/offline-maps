import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/generated/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/shared.dart';

class SuccessForgotPasswordPage extends StatefulWidget {
  const SuccessForgotPasswordPage({super.key});

  @override
  State<SuccessForgotPasswordPage> createState() =>
      _SuccessForgotPasswordPageState();
}

class _SuccessForgotPasswordPageState extends State<SuccessForgotPasswordPage> {
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
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(MainAssets.imgSendEmail),
              const SizedBox(
                height: 30,
              ),
              Text(
                l10n.titleForgotPass,
                style: Styles.textLRegular.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.descSuccessForgotPass,
                        style:
                            Styles.textMRegular.copyWith(color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'JohnMcClane@email.com',
                        style: Styles.textMRegular.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.notReceivedEmail,
                        style:
                            Styles.textMRegular.copyWith(color: Colors.black87),
                      ),
                      TextSpan(
                        text: l10n.resending,
                        style: Styles.textMRegular.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
