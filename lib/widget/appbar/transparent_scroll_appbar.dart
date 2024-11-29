import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';

class TransparentScrollAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showAppBar;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  
  const TransparentScrollAppBar({
    super.key,
    this.title,
    required this.showAppBar,
    this.onBack,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
      preferredSize: preferredSize,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: showAppBar ? Colors.white : Colors.transparent,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 28,
              color: showAppBar ? AppColors.blackPrimary : Colors.white,
            ),
            onPressed: onBack ?? () => Get.back(),
          ),
          title: AnimatedOpacity(
            opacity: showAppBar ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Text(
              title ?? "",
              style: Get.textTheme.bodyLarge,
            ),
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}