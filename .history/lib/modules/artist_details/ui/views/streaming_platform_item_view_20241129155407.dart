
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text((data?.value ?? 0).toString(), style: Theme.of(context).textTheme.headlineLarge,),
              Text(data?.category ?? "", style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
        ),
      ),
    );
  }
}
