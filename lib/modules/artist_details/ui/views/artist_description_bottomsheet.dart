import 'package:artist_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ArtistDescriptionSheet extends StatelessWidget {
  final String description;

  const ArtistDescriptionSheet({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                // child: Text(
                //   description,
                //   style:  Theme.of(context).textTheme.bodyMedium!.copyWith(height: 2),
                //   textAlign: TextAlign.justify,
                // ),
                child: Html(
                  data: description,
                  style: {
                    "body": Style(
                      fontSize: FontSize(14),
                      lineHeight: const LineHeight(1.5),
                    ),
                    "em": Style(
                      fontStyle: FontStyle.italic,
                    ),
                  },
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ButtonRounded(
                  text: "Close",
                  onClick: () => Get.back(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
