import 'package:artist_app/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/widget.dart';
import '../../modules.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FilterView(),
            Expanded(child: _PopularArtist()),
          ],
        ),
      ),
    );
  }
}

class _FilterView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FilterArtistView(
              // hint: controller.selectedCategory.value?.name ?? "",
              value: controller.selectedCategory.value,
              items: controller.categories,
              onChanged: controller.setCategory,
            ),
            const SizedBox(height: 15),
            FilterArtistView(
              hint: controller.city.isEmpty ? "Choose City" : null,
              value: controller.selectedCity.value,
              items: controller.city,
              onChanged: controller.setCity,
            ),
          ],
        ),
      ),
    );
  }
}

class _PopularArtist extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(
            "Popular Artist",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Expanded(
          child: Obx(() {
            // Pindahkan Obx ke sini
            debugPrint("Rebuilding list with ${controller.artists.length} artists");

            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              itemCount: controller.artists.length,
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final artist = controller.artists[index];
                return RankArtistItemListView(artist: artist);
              },
            );
          }),
        ),
      ],
    );
  }
}
