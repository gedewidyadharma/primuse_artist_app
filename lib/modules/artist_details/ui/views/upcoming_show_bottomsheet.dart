import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views.dart';

class UpcomingShowBottomsheet {
  static void show({
    required List<dynamic> upcomingShow,
  }) {
    Get.bottomSheet(
      Container(
        height: Get.height*0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bottom sheet handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // List content
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: upcomingShow.length,
                separatorBuilder: (context, index) => const Divider(height: 40),
                itemBuilder: (context, index) {
                  var data = upcomingShow[index];
                  return UpcomingShowItemView(show: data);
                },
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}