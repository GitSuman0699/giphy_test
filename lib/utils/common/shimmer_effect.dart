import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double? borderRadius;
  final double? height, width;
  final bool? isCircular;
  const ShimmerEffect(
      {this.height,
      this.width,
      this.borderRadius,
      this.isCircular = false,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isCircular! ? height! : 4),
        ),
        height: height ?? height,
        width: width ?? width,
      ),
    );
  }
}
