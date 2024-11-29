import 'package:artist_app/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

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
          child: TextView(
            text: controller.artist.value!.bio,
            textStyle: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            buttonBuilder: (onTap) => RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: 'Read More',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onTap,
                  ),
                ],
              ),
            ),
            onViewMore: () => controller.showArtistBio(),
          ),
        )
        : Container(),
    );
  }
}



class TextView extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final int maxLines;
  final Widget Function(VoidCallback onTap)? buttonBuilder;
  final VoidCallback onViewMore;

  const TextView({
    Key? key,
    required this.text,
    this.textStyle,
    this.maxLines = 5,
    this.buttonBuilder,
    required this.onViewMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: text,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        );

        final tp = TextPainter(
          text: span,
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );

        tp.layout(maxWidth: constraints.maxWidth);

        if (tp.didExceedMaxLines) {
          return RichText(
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(text: text),
                if (buttonBuilder != null)
                  // Custom button builder
                  WidgetSpan(
                    child: buttonBuilder!(() => onViewMore()),
                  )
                else
                  // Default button
                  TextSpan(
                    text: ' Read More',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onViewMore,
                  ),
              ],
            ),
          );
        }

        return Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        );
      },
    );
  }
}
