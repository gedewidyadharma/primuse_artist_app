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
      child: Column(
        children: [
          FilterArtistView(
            // hint: controller.selectedCategory.value?.name ?? "",
            value: controller.selectedCountry.value,
            items: controller.country,
            onChanged: controller.setCoutry,
          ),
        ],
      ),
    );
  }
}
