
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../widget/widget.dart';
import '../../../modules.dart';

class BookingArtistItemView extends StatelessWidget {
  final Artist artist;

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
                  imageUrl: artist.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerView(),
                  errorWidget: (context, url, error) => const PlaceholderImage(asset: 'assets/images/default-profile.jpg'),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      artist.name,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12),
                    ),
                    Text(
                      artist.genres.join(', '),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    artist.country,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
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
                Text(
                  "Regional Available",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                ),
                // const SizedBox(height: 5),
                Text("${artist.currentListeners}K", style: Theme.of(context).textTheme.labelLarge),
               const SizedBox(height:15),
                Text(
                  "Available Date",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                ),
                const SizedBox(height: 5),
                Text("${artist.peakListeners}K", style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          )
        ],
      ),
    );
  }
}