import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/shared.dart';

class AppIcon extends StatelessWidget {
  AppIcon(
      {super.key, required this.asset, this.color, this.height, this.width});

  final String asset;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      height: height,
      width: width,
    );
  }
}
