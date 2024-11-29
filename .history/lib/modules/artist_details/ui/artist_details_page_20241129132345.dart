import 'package:artist_app/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../widget/widget.dart';
import '../artist_details.dart';

class ArtistDetailsPage extends GetView<ArtistDetailsController> {
  const ArtistDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true, 
      appBar: Obx(() => TransparentScrollAppBar(
        showAppBar: controller.showAppBar.value,
        title: controller.artist.value?.name,
      )),
      body: _Body(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: controller.showAppBar.value ? Colors.white : Colors.transparent,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 28,
                  color: controller.showAppBar.value ? AppColors.blackPrimary : Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
              title: AnimatedOpacity(
                opacity: controller.showAppBar.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  controller.artist.value?.name ?? "",
                  style: Get.textTheme.bodyLarge,
                ),
              ),
            ),
          )),
    );
  }
}

class _Body extends GetView<ArtistDetailsController> {
  final ScrollController _scrollController = ScrollController();

  _Body() {
    _scrollController.addListener(() {
      final showAppBar = _scrollController.hasClients && _scrollController.offset > (Get.width - kToolbarHeight);
      if (controller.showAppBar.value != showAppBar) {
        controller.showAppBar.value = showAppBar;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ImageArtist(),
          _Description(),
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
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
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

class _Description extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20),
        child: ReadMoreText(
          controller.artist.value?.bio ?? "",
          trimLines: 4,
          trimMode: TrimMode.Line,
          textAlign: TextAlign.justify,
          trimExpandedText: 'Read Less',
          trimCollapsedText: 'Read More',
          colorClickableText: Colors.blue,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
