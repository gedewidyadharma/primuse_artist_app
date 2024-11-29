import 'package:artist_app/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/widget.dart';
import '../artist_details.dart';

class ArtistDetailsPage extends GetView<ArtistDetailsController> {
  const ArtistDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.chevron_left,
      //       size: 28,
      //       color: AppColors.blackPrimary,
      //     ),
      //     onPressed: () => Get.back(),
      //   ),
      //   title: Text(
      //     "ArtisName",
      //     style: Theme.of(context).textTheme.bodyLarge
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: _Body(),
    );
  }
}

class _Body extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: [
              _ImageArtist(),
            ],
          ),
        );
  }
}

class _ImageArtist extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Positioned(
            top: 0,
            child: CachedNetworkImage(
              alignment: Alignment.topCenter,
              width: Get.width,
              height: Get.width,
              fit: BoxFit.cover,
              imageUrl: controller.artist.value?.image ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerView(),
              errorWidget: (context, url, error) => const PlaceholderImage(),
            ),
          ),
          Container(
            width: Get.width,
            height: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          Positioned(
            bottom: 25,
            left: 25,
            right: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.artist.value?.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
                Text(
                  controller.artist.value?.type ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:  Colors.white),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: TAppBar(
          //     showBackArrow: true,
          //     leadingIconBackgroundColor: AppColors.darkGrey.withOpacity(0.9),
          //     leadingIconColor: AppColors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
