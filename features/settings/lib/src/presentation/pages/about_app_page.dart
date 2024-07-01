import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/preferences/preferences.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppToolbar(
      backgroundColor: Colors.white,
      title: l10n.aboutApp,
      onback: () => context.pop(),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              MainAssets.logoColorPng,
              height: 130,
            ),
            const SizedBox(height: 20),
            Text(
              l10n.aboutAppContent,
              style: Styles.textMRegular,
            )
          ],
        ),
      ),
    );
  }
}
