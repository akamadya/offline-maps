// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppProgressComponent extends StatelessWidget {
  final EdgeInsets? margin;
  final double width;
  final double height;
  final BoxShape? shape;

  AppProgressComponent({
    super.key,
    this.margin = const EdgeInsets.only(bottom: 8),
    required this.width,
    required this.height,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white70,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              borderRadius: shape != null ? null : BorderRadius.circular(10),
              color: Colors.grey),
        ),
      ),
    );
  }
}
