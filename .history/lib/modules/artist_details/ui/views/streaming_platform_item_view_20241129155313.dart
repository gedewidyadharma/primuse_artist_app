
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../artist_details.dart';

class StreamingPlatformItemView extends StatelessWidget {
  final ChartData? data;

  const StreamingPlatformItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),

        child: Container(
           decoration:const  BoxDecoration(
                color: AppColors.greyLight,
              ),
          child: Column(
            children: [
              Text((data?.value ?? 0).toString(), style: ,),
              Text(data?.category ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
