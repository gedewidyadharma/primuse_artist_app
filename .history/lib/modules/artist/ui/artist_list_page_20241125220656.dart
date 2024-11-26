import 'package:artist_app/core/resources/resources.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/widget.dart';
import '../artist.dart';
import '../controllers/artist_controller.dart';

class ArtistListPage extends GetView<ArtistController> {
  const ArtistListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CleanSearchBar(),
                  LoadContentView(
                    status: controller.state.value,
                    child: _GridArtist(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class _GridArtist extends GetView<ArtistController> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          controller.isLoading.isFalse &&
          controller.hasMoreData.value) {
        controller.fetchArtists();
      }
    });

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Obx(
              () {
                if (controller.isLoading.value && controller.artists.isEmpty) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }

                return GridView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: controller.artists.length,
                  itemBuilder: (context, index) {
                    final artist = controller.artists[index];
                    return ArtistItemCardView(artist: artist);
                  },
                );
              },
            ),
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
    );
  }
}

// class _GridArtist extends GetView<ArtistController> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => controller.isLoading.value
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.separated(
//               itemCount: controller.artists.length,
//               shrinkWrap: true,
//               // padding: const EdgeInsets.all(20),
//               physics: const NeverScrollableScrollPhysics(),
//               separatorBuilder: (context, index) => const SizedBox(height: 15),
//               itemBuilder: (context, index) {
//                 final artist = controller.artists[index];
//                 return ArtistItemCardView(artist: artist);
//               },
//             ),
//     );
//   }
// }

// class _RankArtistItemListView extends StatelessWidget {
//   final Artist artist;

//   const _RankArtistItemListView({required this.artist});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       padding: const EdgeInsets.all(15),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 clipBehavior: Clip.antiAlias,
//                 width: 50,
//                 height: 50,
//                 decoration: const BoxDecoration(shape: BoxShape.circle),
//                 child: CachedNetworkImage(
//                   alignment: Alignment.topCenter,
//                   width: Get.width,
//                   height: 50,
//                   fit: BoxFit.cover,
//                   imageUrl: artist.imageUrl,
//                   progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerView(),
//                   errorWidget: (context, url, error) => const PlaceholderImage(asset: 'assets/images/default-profile.jpg'),
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       artist.name,
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                     Text(
//                       artist.genres.join(', '),
//                       style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                             fontWeight: FontWeight.w300,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Text(
//                     artist.country,
//                     style: Theme.of(context).textTheme.labelLarge,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Container(
//             decoration: BoxDecoration(
//               color: AppColors.greyLight,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Text(
//                         "Current Listeners",
//                         style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                               fontWeight: FontWeight.w400,
//                             ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text("${artist.currentListeners}K", style: Theme.of(context).textTheme.labelLarge),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: Colors.black26,
//                   width: 1,
//                   height: 25,
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Text(
//                         "Peak Listeners",
//                         style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                               fontWeight: FontWeight.w400,
//                             ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text("${artist.peakListeners}K", style: Theme.of(context).textTheme.labelLarge),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
