import 'package:flutter/material.dart';

class CleanSearchBar extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CleanSearchBar({
    Key? key,
    this.hint = 'Search',
    this.onChanged,
    this.onTap,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40, // Tetapkan tinggi spesifik
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
      child: Center( // Tambahkan Center widget
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.center, // Tambahkan ini
          style: Theme.of(context).textTheme.bodyMedium, // Tambahkan style untuk text input
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade400,
            ),
            prefixIcon: Padding( // Bungkus icon dengan Padding
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
            prefixIconConstraints: const BoxConstraints( // Tambahkan constraints untuk prefix icon
              minWidth: 44,
              minHeight: 44,
            ),
            isDense: true, // Tambahkan ini
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}