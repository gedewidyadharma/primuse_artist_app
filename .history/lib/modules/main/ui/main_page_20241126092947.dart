
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/resources.dart';
import '../../modules.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomePage(),
            ArtistListPage(),
            BookingArtistAvailableListPage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
          () => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: NavigationBar(
              selectedIndex: controller.currentIndex.value,
              onDestinationSelected: (index) => controller.changePage(index),
              backgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home, color: AppColors.primary),
                ),
                NavigationDestination(
                  icon: Icon(Icons.star_outline_outlined),
                  label: 'Artist',
                  selectedIcon: Icon(Icons.star, color: AppColors.primary),
                ),
                NavigationDestination(
                  icon: Icon(Icons.event_available_outlined),
                  label: 'Avails',
                  selectedIcon: Icon(Icons.event_available, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
    );
  }
}