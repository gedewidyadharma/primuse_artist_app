import 'package:artist_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListNoData extends StatelessWidget {
  final String? message;

  const ListNoData({super.key, this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: Get.width,
          height: context.height * 0.05,
        ),
        Image.asset(
          "assets/images/errors/img_no_data.webp",
          width: 125,
          height: 125,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(height: 20),
        Text(
          message ?? "Data not available",
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: AppColors.blackPrimary,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: "Poppins"),
        ),
      ],
    );
  }
}
