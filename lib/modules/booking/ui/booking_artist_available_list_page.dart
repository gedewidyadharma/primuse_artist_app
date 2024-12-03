import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
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
              child: Row(
                children: [
                  Expanded(
                    child: FilterArtistView(
                      hint: controller.selectedRegion.value?.name ?? "Choose Region",
                      value: controller.selectedRegion.value,
                      items: controller.listRegion.value,
                      onChanged: controller.setRegion,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => controller.showDateRangePickerView(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.calendarDays,
                        color: AppColors.blackPrimary,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (controller.selectedDateRange.value != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Filter : ${DateFormat('dd MMM yyyy').format(controller.selectedDateRange.value!.start)} ~ ${DateFormat('dd MMM yyyy').format(controller.selectedDateRange.value!.end)}',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.resetFilterDate(),
                      child: Text(
                        "Reset",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: _ListArtist(),
            )
          ],
        ),
      ),
    );
  }
}

class _ListArtist extends GetView<BookingArtistAvailableListController> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          controller.isLoading.isFalse &&
          controller.hasMoreData.value) {
        controller.getMoreArtists();
      }
    });
    return Obx(
      () => LoadContentView(
        status: controller.state.value,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                itemCount: controller.artists.length,
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final artist = controller.artists[index];
                  return BookingArtistItemView(artist: artist);
                },
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: Obx(() {
                if (controller.isLoading.value && controller.artists.isNotEmpty) {
                  return const Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(),
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
