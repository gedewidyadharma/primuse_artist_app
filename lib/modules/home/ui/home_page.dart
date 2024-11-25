import 'package:artist_app/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              hint: 'Category',
              value: controller.selectedCategory.value,
              items: controller.categories,
              onChanged: controller.setCategory,
            ),
            const SizedBox(height: 15),
            FilterArtistView(
              hint: 'Country',
              value: controller.selectedCountry.value,
              items: controller.countries,
              onChanged: controller.setCountry,
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
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Popular Artist",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: controller.artists.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final artist = controller.artists[index];
                      return RankArtistItemListView(
                        artist: artist,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
