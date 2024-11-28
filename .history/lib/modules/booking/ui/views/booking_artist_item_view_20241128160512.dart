import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../widget/widget.dart';
import '../../../modules.dart';

class BookingArtistItemView extends StatelessWidget {
  final ArtistsAvailable artist;

  const BookingArtistItemView({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 50,
                height: 50,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(
                  alignment: Alignment.topCenter,
                  width: Get.width,
                  height: 50,
                  fit: BoxFit.cover,
                  imageUrl: artist.image ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerView(),
                  errorWidget: (context, url, error) => const PlaceholderImage(asset: 'assets/images/default-profile.jpg'),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  artist.artistName ?? "-",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LabelValue(
                  label: "Available Date",
                  value: "K",
                ),
                const SizedBox(height: 15),
                _LabelValue(
                  label: "Regional Available",
                  value:  artist.territories?.join(', ') ?? '',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String value;

  _LabelValue({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
        ),
        const SizedBox(height: 5),
        Text(value, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
