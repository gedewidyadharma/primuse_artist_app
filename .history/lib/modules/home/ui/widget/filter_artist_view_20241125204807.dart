import 'package:artist_app/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterArtistView extends StatelessWidget {
  // final String hint;
  final FilterSearch? value;
  final List<FilterSearch> items;
  final Function(FilterSearch?) onChanged;
  final double? width;

  const FilterArtistView({
    Key? key,
    // required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<FilterSearch>(
          // hint: Text(
          //   hint,
          //   style: Theme.of(context).textTheme.bodyMedium,
          // ),
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((FilterSearch item) {
            return DropdownMenuItem<FilterSearch>(
              value: item,
              child: Text(
                item.name,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}