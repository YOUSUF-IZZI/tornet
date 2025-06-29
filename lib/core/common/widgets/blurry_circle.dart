import 'package:flutter/material.dart';
import 'dart:ui';

class BlurryCircle extends StatelessWidget {
  final double size;
  final List<Color> colors;
  final double blurSigma;
  final Alignment begin;
  final Alignment end;

  const BlurryCircle({
    super.key,
    this.size = 188.0,
    this.colors = const [Color(0xFF86F14D), Color(0xFFE6FF48)],
    this.blurSigma = 50.0,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurSigma,
          sigmaY: blurSigma,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
