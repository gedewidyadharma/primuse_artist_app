import 'package:flutter/material.dart';

class TopCountriesItemList extends StatelessWidget {
  final String number;
  final String name;

const TopCountriesItemList({super.key, required this.number, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            number,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
