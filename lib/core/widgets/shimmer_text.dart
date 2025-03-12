import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/Utils/constants.dart';

import 'package:project/features/controller/settings%20controllers/language_controller.dart';

class ShimmerText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textalign;
  final TextDirection? textdirection;
  final double? begin;
  final double? end;
  final Color? color;
  final Color? textcolor;

  const ShimmerText({
    super.key,
    required this.text,
    this.style,
    this.textalign,
    this.textdirection,
    this.begin,
    this.end,
    this.color,
    this.textcolor,
  });

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final LanguageController langCtrl = Get.find();

  void _updateAnimation() {
    _animation = Tween<double>(
      begin: widget.begin ?? (langCtrl.language.value == "ar" ? 2 : -2),
      end: widget.end ?? (langCtrl.language.value == "ar" ? -2 : 2),
    ).animate(_controller)..addListener(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _updateAnimation();

    // Listen to language changes
    ever(langCtrl.language, (_) {
      _updateAnimation();
    });

    // Repeat the animation every 20 seconds
    Future.delayed(const Duration(seconds: 20), () {
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
            widget.textcolor ?? Colors.white,
            widget.color ?? kmaincolor4,
            widget.textcolor ?? Colors.white,
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(bounds);
      },
      child: Text(
        textAlign: widget.textalign ?? TextAlign.start,
        textDirection: widget.textdirection ?? TextDirection.ltr,
        widget.text,
        style: widget.style,
      ),
    );
  }
}
