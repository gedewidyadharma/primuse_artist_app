import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/resources.dart';
import '../../../widget/widget.dart';
import '../booking.dart';

class BookingArtistAvailableListPage extends GetView<BookingArtistAvailableListController> {
  const BookingArtistAvailableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: _Body(),
    );
  }
}

class _Body extends GetView<BookingArtistAvailableListController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: FilterArtistView(
                value: controller.selectedCountry.value,
                items: controller.country,
                onChanged: controller.setCoutry,
              ),
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
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0,20,20),
            child: Text(
              "Popular Artist",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: controller.artists.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(20,0,20,20),
                    // physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final artist = controller.artists[index];
                      return RankArtistItemListView(
                        artist: artist,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
