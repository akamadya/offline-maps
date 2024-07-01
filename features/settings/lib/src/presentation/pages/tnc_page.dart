import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class TermsNConditionPage extends StatelessWidget {
  const TermsNConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppToolbar(
      backgroundColor: Colors.white,
      title: l10n.tnc,
      onback: () => context.pop(),
      content: Container(),
    );
  }
}
