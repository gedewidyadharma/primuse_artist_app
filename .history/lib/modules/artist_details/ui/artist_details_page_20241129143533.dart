import 'package:artist_app/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                    onTap: ()=> controller.showArtistBio(),
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
      () => SfCircularChart(
      title: const ChartTitle(text: 'Listener'),
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        toggleSeriesVisibility: true, // Enable toggle dari legend
      ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        format: 'point.x : point.y%',
        duration: 1500,
      ),
      series: <DoughnutSeries<ChartData, String>>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.category,
          yValueMapper: (ChartData data, _) => data.value,
          pointColorMapper: (ChartData data, _) => data.color,
          
          // Enable selection
          selectionBehavior: SelectionBehavior(
            enable: true,
            selectedColor: Colors.red[100],
            unselectedColor: Colors.grey[200],
          ),
          
          // Enable tooltip
          enableTooltip: true,
          
          // Data label
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            useSeriesColor: true,
            connectorLineSettings: ConnectorLineSettings(
              type: ConnectorType.curve,
              length: '20%',
            ),
            builder: (dynamic data, dynamic point, dynamic series,
                int pointIndex, int seriesIndex) {
              return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: data.color.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${data.value}%',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              );
            },
          ),
          
          // Corner style
          cornerStyle: CornerStyle.bothCurve,
          
          // Gradient
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.blue],
            stops: [0.0, 1.0],
          ),
        ),
      ],
      onChartTouchInteractionDown: (ChartTouchInteractionArgs args) {
        // Handle touch interaction
        print('Chart touched at: ${args.position}');
      },
    )
    );
  }
}