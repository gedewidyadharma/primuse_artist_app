import 'package:flutter/material.dart';


import '../../core/resources/resources.dart';

class LoadContentView extends StatelessWidget {
  final Widget child;
  final StateStatus status;

  const LoadContentView({super.key, required this.child, required this.status});

  @override
  Widget build(BuildContext context) {
    return getWidget(status, child);
  }
}

Widget getWidget(StateStatus status, Widget child) {
  if (status == StateStatus.loading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  if (status == StateStatus.emtpy) {
    return const Center(child: ListNoData());
  }

  if (status == StateStatus.noConnection || status == StateStatus.error) {
    return const FailedLoadContent();
  }

  return child;
}

class FailedLoadContent extends StatelessWidget {
  const FailedLoadContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/errors/img_no_data.webp",
              fit: BoxFit.scaleDown,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Failed to Load Data",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "We encountered an error while trying to load the data. Please check your connection or try again later.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
