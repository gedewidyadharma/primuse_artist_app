import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../helper/helper.dart';
import '../../../../widget/widget.dart';
import '../../../modules.dart';

class RankArtistItemListView extends StatelessWidget {
  final ArtistRank artist;

  const RankArtistItemListView({super.key, required this.artist});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      artist.artist ?? "-",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12),
                    ),
                    Text(
                      artist.genres?.join(', ') ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w300, fontSize: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Column(
                children: [
                  // Text(
                  //   artist.country?.flag?.emoji ?? "",
                  //   style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18),
                  // ),
                  // Text(
                  //   artist.country?.iso2 ?? "",
                  //   style: Theme.of(context).textTheme.labelMedium,
                  // ),

                  Text(
                    "Rank",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        artist.cityRank.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          // Icon(Icons.arrow_drop_down),
                          const SizedBox(
                            height: 10,
                            child: Icon(
                              Icons.arrow_drop_up_rounded,
                              size: 25,
                            ),
                          ),
                          Text(
                            artist.cityRank.toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
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
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: SvgPicture.asset(
                              "assets/images/spotify/logo-green.svg",
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "Current Listeners",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(NumberFormat.formatToK(artist.currentListeners ?? 0), style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black26,
                  width: 1,
                  height: 30,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: SvgPicture.asset(
                              "assets/images/spotify/logo-green.svg",
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "Peak Listeners",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(NumberFormat.formatToK(artist.peakListeners ?? 0), style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
