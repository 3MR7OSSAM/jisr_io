import 'package:flutter/material.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';

class EclipseContainer extends StatelessWidget {
  const EclipseContainer({super.key,  this.height = 10,  this.width = 10,  this.opacity =0.3,  this.spreadRadius =200});
  final double height;
  final double width;
  final double opacity;
  final double spreadRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:  AppColors.primary.withOpacity(opacity),
              blurRadius: 1000,
              spreadRadius: spreadRadius,
            ),
          ],
        ));
  }
}
