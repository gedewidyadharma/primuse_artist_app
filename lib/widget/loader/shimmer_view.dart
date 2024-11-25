import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
     baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
      child: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
      ),
    );
  }
}
