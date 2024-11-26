import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/widget.dart';
import '../../../modules.dart';

class ArtistItemCardView extends StatelessWidget {
  final Artist? artist;

  const ArtistItemCardView({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.toNamed(Routes.artistDetails, arguments: artist),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            CachedNetworkImage(
              alignment: Alignment.topCenter,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
              imageUrl: artist?.imageUrl ?? "",
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
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            // Text(
                            //   artist?.type ?? "",
                            //   style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 8, color: Colors.white,
                            // ),
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
