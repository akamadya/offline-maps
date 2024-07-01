import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/generated/l10n.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  // late final WebViewController controller;

  @override
  void initState() {
    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.disabled)
    //   ..loadRequest(
    //       Uri.parse('https://taspen.co.id/korporasi/kebijakan_privasi'));

    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppToolbar(
      backgroundColor: Colors.white,
      title: l10n.privacyPolicy,
      onback: () => context.pop(),
      //content: WebViewWidget(controller: controller),
      content: Container(),
    );
  }
}
