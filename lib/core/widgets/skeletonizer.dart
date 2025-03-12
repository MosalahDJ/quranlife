import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Myskeletonizer extends StatelessWidget {
  const Myskeletonizer({super.key, required this.skeletonizerWidget});
  final Widget skeletonizerWidget;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        containersColor: const Color(0xFFE0E0E0).withValues(alpha: 0.1),
        ignoreContainers: false,
        effect: ShimmerEffect(
          baseColor: const Color(0xFFE0E0E0).withValues(alpha: 0.1),
          highlightColor: const Color(0xFFF5F5F5).withValues(alpha: 0.8),
          duration: const Duration(milliseconds: 1500),
        ),
        justifyMultiLineText: true,
        ignorePointers: true,
        child: skeletonizerWidget);
  }
}
