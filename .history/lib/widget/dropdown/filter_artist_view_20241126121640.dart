import 'package:artist_app/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FilterArtistView extends StatelessWidget {
  final FilterSearch? value;
  final List<FilterSearch> items;
  final Function(FilterSearch?) onChanged;
  final double? width;

  const FilterArtistView({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width,
  });

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
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((FilterSearch item) {
            return DropdownMenuItem<FilterSearch>(
              value: item,
              child: Row(
                children: [
                  if(item.icon !=null)
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      item.icon!,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}