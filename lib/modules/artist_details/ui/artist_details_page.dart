import 'package:artist_app/helper/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
          _UpcomingShow(),
          _GraphListener(),
          const SizedBox(height: 30),
          _TopCountryView(),
          _MonthlyListenerView(),
          _SpotifyGraph(),
          const SizedBox(height: 30),
          _InstagramGraph(),
          const SizedBox(height: 30),
          _YoutubeGraph(),
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

class _UpcomingShow extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.upcomingShow.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Upcoming Show',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (controller.upcomingShow.length > 3)
                        InkWell(
                          onTap: () => controller.showAllUpcomingShow(),
                          child: Text(
                            'Show All',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.blue),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.upcomingShow.length > 3 ? 3 : controller.upcomingShow.length ,
                    separatorBuilder: (context, index) => const Divider(height: 40),
                    itemBuilder: (context, index) {
                      var data = controller.upcomingShow.value[index];
                      return UpcomingShowItemView(show: data);
                    },
                  ),
                ],
              ),
            )
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
            const SizedBox(height: 10),
            controller.dataTopCountries.value.isNotEmpty
                ? DataTable(
                    columnSpacing: 0,
                    columns: [
                      DataColumn(
                        label: Text(
                          '#',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: Get.width * 0.6,
                          child: Text(
                            'Country',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                    rows: List.generate(controller.dataTopCountries.value.length, (index) {
                      var data = controller.dataTopCountries[index];
                      return DataRow(
                        cells: [
                          DataCell(Text(data.rank?.toString() ?? "-")),
                          DataCell(Text(
                            "${data.country?.flag?.emoji ?? "🏳️"}   ${data.country?.name ?? data.countryCode ?? ""}",
                            style: Theme.of(context).textTheme.labelMedium,
                          )),
                        ],
                      );
                    }),
                  )
                : const ShimmerDataTable(),
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
            const SizedBox(height: 10),
            controller.dataMonthlyListener.value.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            '#',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'City',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Current',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Peak',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Peak Date',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      rows: List.generate(controller.dataMonthlyListener.value.length, (index) {
                        var data = controller.dataMonthlyListener[index];
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(
                                data.rank?.toString() ?? "-",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataCell(
                              Text(
                                "${data.country?.flag?.emoji ?? ""}   ${data.cityName ?? ""}",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataCell(
                              Text(
                                NumberFormating.formatNumberSeparator(data.currentListeners ?? 0),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataCell(
                              Text(
                                NumberFormating.formatNumberSeparator(data.peakListeners ?? 0),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateFormating.changeFormatFromString(format: "dd-MMM-yyyy", date: data.peakDate ?? ""),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  )
                : const ShimmerDataTable()
          ],
        ),
      ),
    );
  }
}

class _SpotifyGraph extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.dataSpotifyStats.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.spotify),
                      const SizedBox(width: 10),
                      Text(
                        'Spotify Insight',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    minimum: controller.dataSpotifyStats.first.date,
                    maximum: controller.dataSpotifyStats.last.date,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.compact(),
                  ),
                  legend: const Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                  zoomPanBehavior: ZoomPanBehavior(enablePanning: true, enablePinching: true, zoomMode: ZoomMode.xy),
                  series: <LineSeries<SpotifyStatsHistories, DateTime>>[
                    LineSeries<SpotifyStatsHistories, DateTime>(
                      name: "Monthly Listener",
                      dataSource: controller.dataSpotifyStats.value,
                      xValueMapper: (SpotifyStatsHistories data, _) => data.date,
                      yValueMapper: (SpotifyStatsHistories data, _) => data.monthlyListenersCurrent,
                    ),
                    LineSeries<SpotifyStatsHistories, DateTime>(
                      name: "Follower",
                      dataSource: controller.dataSpotifyStats.value,
                      xValueMapper: (SpotifyStatsHistories data, _) => data.date,
                      yValueMapper: (SpotifyStatsHistories data, _) => data.followersTotal,
                    ),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}

class _InstagramGraph extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.dataInstagramStats.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.instagram),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Instagram Insight',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    minimum: controller.dataInstagramStats.first.date,
                    maximum: controller.dataInstagramStats.last.date,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.compact(),
                  ),
                  legend: const Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                  zoomPanBehavior: ZoomPanBehavior(enablePanning: true, enablePinching: true, zoomMode: ZoomMode.xy),
                  series: <LineSeries<InstagramStatsHistories, DateTime>>[
                    LineSeries<InstagramStatsHistories, DateTime>(
                      name: "Followers Total",
                      dataSource: controller.dataInstagramStats.value,
                      xValueMapper: (InstagramStatsHistories data, _) => data.date,
                      yValueMapper: (InstagramStatsHistories data, _) => data.followersTotal,
                    ),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}

class _YoutubeGraph extends GetView<ArtistDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.dataYoutubeStats.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.youtube),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Youtube Insight',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    minimum: controller.dataYoutubeStats.first.date,
                    maximum: controller.dataYoutubeStats.last.date,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat.compact(),
                  ),
                  legend: const Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                  zoomPanBehavior: ZoomPanBehavior(enablePanning: true, enablePinching: true, zoomMode: ZoomMode.xy),
                  series: <LineSeries<YoutubeStatsHistories, DateTime>>[
                    LineSeries<YoutubeStatsHistories, DateTime>(
                      name: "Views Total",
                      dataSource: controller.dataYoutubeStats.value,
                      xValueMapper: (YoutubeStatsHistories data, _) => data.date,
                      yValueMapper: (YoutubeStatsHistories data, _) => data.videoViewsTotal,
                    ),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}
