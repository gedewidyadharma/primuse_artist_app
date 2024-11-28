import 'package:artist_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../artist_details.dart';

class ArtistDetailsPage extends GetView<ArtistDetailsController> {
  const ArtistDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 28,
            color: AppColors.blackPrimary,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "ArtisName",
          style: Theme.of(context).textTheme.titleSmall
        ),
        backgroundColor: Colors.white,
      ),
      body: _Body(),
    );
  }
}

class _Body extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
