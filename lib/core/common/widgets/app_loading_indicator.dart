import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tornet/core/utils/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.color, this.padding});

  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0.0),
        child: AppLoadingAnimationIndicator(),
      ),
    );
  }
}

class AppLoadingAnimationIndicator extends StatelessWidget {
  const AppLoadingAnimationIndicator({super.key, this.size, this.color});

  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: color ?? AppColors.primaryColor,
        size: size ?? 200,
      ),
    );
  }
}