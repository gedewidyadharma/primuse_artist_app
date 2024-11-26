import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/widget.dart';
import '../booking.dart';

class BookingArtistAvailableListPage extends GetView<BookingArtistAvailableListController> {
  const BookingArtistAvailableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends GetView<BookingArtistAvailableListController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FilterArtistView(
            // hint: controller.selectedCategory.value?.name ?? "",
            value: controller.selectedCountry.value,
            items: controller.country,
            onChanged: controller.setCategory,
          ),
        ],
      ),
    );
  }
}

class _FilterView extends GetView<BookingArtistAvailableListController> {
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
              // hint: controller.selectedCity.value?.name ?? "",
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
