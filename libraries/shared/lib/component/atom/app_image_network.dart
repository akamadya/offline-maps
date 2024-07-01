import 'package:flutter/material.dart';
import 'package:shared/preferences/assets.dart';

class AppImageNetwork extends StatelessWidget {
  const AppImageNetwork({super.key, required this.url, required this.size});

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.assetNetwork(
        height: size,
        width: size,
        placeholder: MainAssets.logoColorPng,
        image: url,
        fit: BoxFit.cover,
        placeholderFit: BoxFit.scaleDown,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              padding: const EdgeInsets.all(3),
              width: size,
              height: size,
              child: Image.asset(MainAssets.logoColorPng));
        },
      ),
    );
  }
}
