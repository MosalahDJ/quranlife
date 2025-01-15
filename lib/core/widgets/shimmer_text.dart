import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';

class ShimmerText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const ShimmerText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -2, end: 2).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Repeat the animation every 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment(_animation.value - 1, 0),
          end: Alignment(_animation.value, 0),
          colors: [
            Colors.white,
            kmaincolor4,
            Colors.white,
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(bounds);
      },
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
