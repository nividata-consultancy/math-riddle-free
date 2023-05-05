import 'package:flutter/material.dart';
import 'package:math_riddle/core/app_colors.dart';

class CommonTextButtonView extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  final double height;
  final FontWeight fontWeight;

  const CommonTextButtonView({
    required this.label,
    required this.onPressed,
    this.fontWeight = FontWeight.w500,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize: Size.fromHeight(height),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: fontWeight,
            color: AppColor.white,
            decoration: TextDecoration.underline,
            letterSpacing: 1.6,
          ),
        ),
      ),
    );
  }
}
