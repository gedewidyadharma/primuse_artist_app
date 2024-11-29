import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArtistDescriptionSheet extends StatelessWidget {
  final String description;
  final ScrollController? parentScrollController;
  final String? title;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final Widget? closeButton;

  const ArtistDescriptionSheet({
    Key? key,
    required this.description,
    this.parentScrollController,
    this.title,
    this.backgroundColor,
    this.padding,
    this.titleStyle,
    this.descriptionStyle,
    this.closeButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            if (title != null) ...[
              Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title!,
                  style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
            ],
            Flexible(
              child: SingleChildScrollView(
                padding: padding ?? const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  description,
                  style: descriptionStyle ?? Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            if (closeButton != null)
              Padding(
                padding: padding ?? const EdgeInsets.all(20),
                child: closeButton!,
              )
            else
              Padding(
                padding: padding ?? EdgeInsets.fromLTRB(20, 0, 20, 
                    MediaQuery.of(context).padding.bottom + 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    parentScrollController?.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Close'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}