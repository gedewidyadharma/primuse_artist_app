import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class TopCityListenerItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColors.greyLight,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                  "Rank",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              Text(
                  "1",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 24),
                ),
                
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  NumberFormating.toCompactFormat(data?.value ?? 0).toString(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 24),
                ),
                Text(
                  data?.category ?? "",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
