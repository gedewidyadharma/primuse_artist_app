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
    return Obx(() => SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ));
  }
}


class _ImageArtist extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
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
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.textWhite),
                      ),
                      Text(
                        controller.artist.value?.type ?? '',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.textWhite),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: TAppBar(
                    showBackArrow: true,
                    leadingIconBackgroundColor: AppColors.darkGrey.withOpacity(0.9),
                    leadingIconColor: AppColors.white,
                    actions: [
                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: const EdgeInsets.symmetric(horizontal: 10),
                      //   height: 40,
                      //   width: 40,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.darkGrey,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: IconButton(
                      //     onPressed: () {
                      //       if (controller.authController.isSessionExist.isTrue) {
                      //         print('clicked icon button heart');
                      //       } else {
                      //         Get.toNamed(Routes.login);
                      //       }
                      //     },
                      //     icon: Icon(
                      //       controller.authController.isSessionExist.value && (controller.artist.value?.isFavorite ?? false)
                      //           ? Iconsax.heart5
                      //           : Iconsax.heart,
                      //       color: controller.authController.isSessionExist.value && (controller.artist.value?.isFavorite ?? false)
                      //           ? AppColors.primary
                      //           : Get.isDarkMode
                      //               ? AppColors.black
                      //               : AppColors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),);
  }
}