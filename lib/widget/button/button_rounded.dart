import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';


class ButtonRounded extends StatelessWidget {
  final double? width;
  final Color color;
  final BorderRadiusGeometry? radius;
  final String text;
  final Color textColor;
  final double textSize;
  final Function onClick;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  const ButtonRounded(
      {super.key,
      this.width,
      this.color = AppColors.blackPrimary,
      this.radius,
      required this.text,
      this.textColor = Colors.white,
      this.textSize = 14,
      required this.onClick,
      this.fontWeight,
      this.isLoading = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        width: width ?? Get.width,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: radius ?? BorderRadius.circular(10),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 5,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textSize, color: textColor, fontWeight: fontWeight),
              ),
      ),
    );
  }
}
