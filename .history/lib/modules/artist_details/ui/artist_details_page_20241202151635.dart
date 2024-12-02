import 'package:artist_app/helper/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/core.dart';
import '../../../widget/widget.dart';
import '../artist_details.dart';

class ArtistDetailsPage extends GetView<ArtistDetailsController> {
  const ArtistDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: TransparentScrollAppBar(
          showAppBar: controller.showAppBar.value,
          title: controller.artist.value?.name,
        ),
        body: _Body(),
      ),
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
          _GraphListener(),
          const SizedBox(height: 30),
          _TopCountryView(),
          const SizedBox(height: 30),
          _MonthlyListenerView(),
          const SizedBox(height: 50),
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
        ],
      ),
    );
  }
}

class _Description extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.artist.value?.bio != null
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    controller.artist.value?.bio ?? '-',
                    textAlign: TextAlign.justify,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => controller.showArtistBio(),
                    child: Text(
                      "Read More",
                      maxLines: 5,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ))
          : Container(),
    );
  }
}

class _GraphListener extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: controller.dataStreamingPlatform.value.isEmpty
                ? const ChartShimmer()
                : SfCircularChart(
                    title: const ChartTitle(text: 'Platform Distribution'),
                    legend: const Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.wrap,
                      orientation: LegendItemOrientation.vertical,
                    ),
                    series: <DoughnutSeries<ChartData, String>>[
                      DoughnutSeries<ChartData, String>(
                        dataSource: controller.dataStreamingPlatform.value,
                        xValueMapper: (ChartData data, _) => data.category,
                        yValueMapper: (ChartData data, _) => data.value,
                        dataLabelMapper: (ChartData data, _) => data.category,
                        radius: '100%',
                        innerRadius: '60%',
                        // dataLabelSettings: const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
          ),
          controller.dataStreamingPlatform.value.isEmpty
              ? const StatsGridShimmer()
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.75,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: controller.dataStreamingPlatform.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = controller.dataStreamingPlatform[index];
                    return StreamingPlatformItemView(data: data);
                  },
                ),
        ],
      ),
    );
  }
}

class _TopCountryView extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Song in Charts',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              'Top Countries',
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            const SizedBox(height: 20),
            const TopCountriesItemList(
              number: "#",
              name: "Country",
            ),
            const Divider(height: 30),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.dataTopCountries.value.length,
              separatorBuilder: (context, index) => const Divider(height: 30),
              itemBuilder: (context, index) {
                final data = controller.dataTopCountries[index];
                return TopCountriesItemList(
                  number: data.rank?.toString() ?? "-",
                  name: "${data.country?.flag?.emoji ?? ""}   ${data.country?.name ?? ""}",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _MonthlyListenerView extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Current Listeners',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              'Top Cities',
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('City')),
                  DataColumn(label: Text('Current')),
                  DataColumn(label: Text('Peak')),
                  DataColumn(label: Text('Peak Date')),
                  // Tambahkan kolom lainnya
                ],
                rows: List.generate(
                  controller.dataMonthlyListener.value.length,
                  (index) {
                    var data = controller.dataMonthlyListener[index];
                    return DataRow(
                    cells: [
                      DataCell(Text(data.rank?.toString() ?? "-")),
                      DataCell(Text("${data.country?.flag?.emoji ?? ""}  ${data.cityName ?? ""}")),
                      DataCell(Text(NumberFormating.formatNumberSeparator(data.currentListeners ?? 0))),
                      DataCell(Text(NumberFormating.formatNumberSeparator(data.peakListeners ?? 0))),
                      DataCell(Text('Address $index')),
                      // Tambahkan cell lainnya
                    ],
                  );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
