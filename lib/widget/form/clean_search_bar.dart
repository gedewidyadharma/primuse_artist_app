import 'package:flutter/material.dart';

class CleanSearchBar extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onSubmit;
  final TextEditingController? controller;
  final bool showSubmitButton;

  const CleanSearchBar({
    super.key,
    this.hint = 'Search',
    this.onChanged,
    this.onTap,
    this.onSubmit,
    this.controller,
    this.showSubmitButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
      child: Center(
        child: TextField(
          onSubmitted: (_) => onSubmit?.call(),
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade400,
                ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
            suffixIcon: showSubmitButton == true
                ? InkWell(
                    onTap: onSubmit,
                    child: Center(
                        widthFactor: 0,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          size: 30,
                          color: Colors.grey.shade400,
                        ),),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 44,
              minHeight: 44,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 44,
            ),
            isDense: true,
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
