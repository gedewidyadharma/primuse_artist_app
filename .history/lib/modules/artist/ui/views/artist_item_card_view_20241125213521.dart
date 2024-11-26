import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pclub/routes/app_routes.dart';

import '../../../../common/constant/constant.dart';
import '../../../../common/widgets/widget.dart';
import '../../artist.dart';

class ArtistItemCardView extends StatelessWidget {
  final Artist? artist;

  const ArtistItemCardView({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.artistDetails, arguments: artist),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              alignment: Alignment.topCenter,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
              imageUrl: artist?.image ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerView(),
              errorWidget: (context, url, error) => const PlaceholderImage(),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     print('clicked artist favorite');
                  //   },
                  //   child: Icon(
                  //     artist?.isFavorite == true ? Iconsax.heart5 : Iconsax.heart,
                  //     size: 20,
                  //     color: artist?.isFavorite == true ? Colors.pink : AppColors.white,
                  //   ),
                  // ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              artist?.name ?? "",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12, color: AppColors.textWhite),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              artist?.type ?? "",
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 8, color: AppColors.textWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
