import 'package:artist_app/helper/helper.dart';
import 'package:artist_app/widget/button/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../artist_details.dart';

class UpcomingShowItemView extends StatelessWidget {
  final UpcomingShow show;

  const UpcomingShowItemView({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormating.changeFormatFromDatetime(format: "MMM", date: show.datetime),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  DateFormating.changeFormatFromDatetime(format: "d", date: show.datetime),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  show.venue?.name ?? "",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
                ),
                Text(
                  show.venue?.location ?? "",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 90,
            child: ButtonRounded(
              onClick: () => UrlLauncherHelper.openBrowser(show.url ?? ""),
              text: "Tickets",
              textSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
