import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../helper/helper.dart';
import '../../artist_details.dart';

class StreamingPlatformItemView extends StatelessWidget {
  final ChartData? data;

  const StreamingPlatformItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    
      child: Container(
        decoration: const BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: AppColors.greyLight,
        ),
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
    );
  }
}
