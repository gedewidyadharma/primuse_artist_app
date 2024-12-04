import 'package:artist_app/core/core.dart';
import 'package:artist_app/modules/profile/controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _Body extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: 100,
              height: 100,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CachedNetworkImage(
                alignment: Alignment.topCenter,
                width: Get.width,
                height: 100,
                fit: BoxFit.cover,
                imageUrl: controller.authController.user.value?.avatar ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerView(),
                errorWidget: (context, url, error) => const PlaceholderImage(asset: 'assets/images/placeholder/default-profile.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${controller.authController.user.value?.firstName ?? "" } ${controller.authController.user.value?.lastName ?? "" }",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            controller.authController.user.value?.email ?? "-",
            style: Theme.of(context).textTheme.labelSmall,
          ),
         const SizedBox(height: 50),
          ButtonRounded(onClick: () => controller.authController.doLogoutWithMessage(), text: "Sign Out",)
        ],
      ),
    );
  }
}
