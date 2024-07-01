import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/component/molecule/app_template_sheet.dart';
import 'package:shared/shared.dart';

class FeatureNotAvailableSheet extends StatelessWidget {
  const FeatureNotAvailableSheet({super.key});

  static show(BuildContext context) {
    const AppTemplateSheet(
      body: FeatureNotAvailableSheet(),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MainAssets.noFeature,
          height: 150,
        ),
        const SizedBox(height: 20),
        Text('Segera Hadir', style: Styles.textLBold),
        const SizedBox(height: 5),
        Text(
          'Fitur belum tersedia, nantikan pembaruan terbaru untuk menikmati fitur yang tersedia di OPTIMA',
          style: Styles.textMRegular,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        AppButton(
            title: 'Kembali',
            onPressed: () async {
              // await AppNotification.getDeviceToken().then((value) {
              //   log('token FCM = $value');
              //   context.pop();
              // });

              context.pop();
            }),
      ],
    );
  }
}
