import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';

class ButtonBorderRounded extends StatelessWidget {
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadiusGeometry? radius;
  final String text;
  final Color textColor;
  final double textSize;
  final Function onClick;
  final bool wrapContent;
  final double? width;
  final FontWeight? fontWeight;

  const ButtonBorderRounded({
    super.key,
    this.borderColor = AppColors.blackPrimary,
    this.borderWidth = 1,
    this.radius,
    required this.text,
    this.textColor = AppColors.blackPrimary,
    this.textSize = 14,
    required this.onClick,
    this.wrapContent = false,
    this.width,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        width: wrapContent ? null : width ?? Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: borderColor!, width: borderWidth!),
          borderRadius: radius ?? BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
