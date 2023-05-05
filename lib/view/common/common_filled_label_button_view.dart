import 'package:flutter/material.dart';
import 'package:math_riddle/core/app_colors.dart';
import 'package:math_riddle/view/common/custom_button_border.dart';
import 'package:math_riddle/view/common/custom_level_border.dart';
import 'package:math_riddle/view/neopop_button/neopop_button_translator.dart';

class CommonFilledLabelButtonView extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double height;
  final double depth;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final Color textColor;
  final bool isLevels;

  const CommonFilledLabelButtonView({
    super.key,
    required this.label,
    required this.onPressed,
    required this.depth,
    this.height = 56,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 20,
    this.color = AppColor.white,
    this.textColor = AppColor.black,
    this.isLevels = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isLevels
            ? CustomLevelBorder.all(
                color: Colors.white,
                smallGap: 5,
                largeGap: 8,
                space: 4,
              )
            : CustomButtonBorder.all(
                color: Colors.white,
                smallSpace: 4,
                largeSpace: 12,
                smallGap: 4,
                largeGap: 20,
              ),
      ),
      padding: const EdgeInsets.all(3),
      child: onPressed == null
          ? Container(
              color: AppColor.blackLight,
              constraints: BoxConstraints.expand(height: height),
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: AppColor.white,
                ),
              ),
            )
          : NeoPopButtonTranslator(
              depth: depth,
              onPressed: onPressed!,
              child: Container(
                color: color,
                constraints: BoxConstraints.expand(height: height),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: textColor,
                  ),
                ),
              ),
            ),
    );
  }
}
