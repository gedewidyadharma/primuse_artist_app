import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceholderImage extends StatelessWidget {
final String asset;

const PlaceholderImage({super.key, this.asset = 'assets/images/image_placeholder.png'});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: Get.width,
      height: Get.height,
      fit: BoxFit.cover,
    );
  }
}
