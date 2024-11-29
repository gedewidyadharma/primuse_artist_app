import 'package:artist_app/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/widget.dart';
import '../artist.dart';

class ArtistListPage extends GetView<ArtistController> {
  const ArtistListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: Obx(() => CloseSoftKeyboardOnClickOusideForm(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CleanSearchBar(
                      controller: controller.textEditingController,
                      showSubmitButton: controller.isShowSubmitSearch.value,
                      onChanged: (value) => controller.onChangedSearch(value),
                      onSubmit: () => controller.onSearchSubmited(),
                    ),
                  ),
                  Expanded(
                    child: LoadContentView(
                      status: controller.state.value,
                      child: _GridArtist(),
                    ),
                  ),
                ],
              ),
        )),
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
        controller.getMoreArtists();
      }
    });

    return Column(
      children: [
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value && controller.artists.isEmpty) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
          
              return GridView.builder(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(20, 0, 20,20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.artists.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final artist = controller.artists[index];
                  return ArtistItemCardView(artist: artist);
                },
              );
            },
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
