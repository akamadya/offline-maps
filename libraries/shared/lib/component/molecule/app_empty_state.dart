import 'package:flutter/material.dart';
import 'package:shared/preferences/assets.dart';
import 'package:shared/preferences/styles.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState(
      {required this.asset,
      required this.title,
      required this.message,
      super.key});

  final String asset;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return emptyState();
  }

  Widget emptyState() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Image.asset(
            asset,
            height: asset == MainAssets.noFeature ? 135 : 80,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Styles.textLBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            message,
            style: Styles.textMRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
