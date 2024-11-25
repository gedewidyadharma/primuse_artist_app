import 'package:flutter/material.dart';

import '../resources/resources.dart';

/// Custom Class for Light & Dark Text Themes
class AppTextTheme {
  AppTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    // Headline - Untuk judul utama dan header besar
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w700, // Bold
      color: AppColors.blackPrimary,
      letterSpacing: -0.5,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.w700, // Bold
      color: AppColors.blackPrimary,
      letterSpacing: -0.5,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w700, // Bold
      color: AppColors.blackPrimary,
      letterSpacing: -0.5,
    ),

    // Title - Untuk sub judul dan header section
    titleLarge: const TextStyle().copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w600, // Semi Bold
      color: AppColors.blackPrimary,
      letterSpacing: 0,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600, // Semi Bold
      color: AppColors.blackPrimary,
      letterSpacing: 0,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600, // Semi Bold
      color: AppColors.blackPrimary,
      letterSpacing: 0,
    ),

    // Body - Untuk konten utama dan paragraf
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // Regular
      color: AppColors.blackPrimary,
      letterSpacing: 0.5,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400, // Regular
      color: AppColors.blackPrimary,
      letterSpacing: 0.25,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400, // Regular
      color: AppColors.blackPrimary,
      letterSpacing: 0.4,
    ),

    // Label - Untuk button, caption, dan teks pendukung
    labelLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500, // Medium
      color: AppColors.blackPrimary,
      letterSpacing: 0.1,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500, // Medium
      color: AppColors.blackPrimary,
      letterSpacing: 0.5,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500, // Medium
      color: AppColors.blackPrimary,
      letterSpacing: 0.5,
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    // Headline - Untuk judul utama dan header besar
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w700, // Bold
      color: Colors.white,
      letterSpacing: -0.5,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.w700, // Bold
      color: Colors.white,
      letterSpacing: -0.5,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w700, // Bold
      color: Colors.white,
      letterSpacing: -0.5,
    ),

    // Title - Untuk sub judul dan header section
    titleLarge: const TextStyle().copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w600, // Semi Bold
      color: Colors.white.withOpacity(0.95),
      letterSpacing: 0,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600, // Semi Bold
      color: Colors.white.withOpacity(0.95),
      letterSpacing: 0,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600, // Semi Bold
      color: Colors.white.withOpacity(0.95),
      letterSpacing: 0,
    ),

    // Body - Untuk konten utama dan paragraf
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // Regular
      color: Colors.white.withOpacity(0.87),
      letterSpacing: 0.5,
    ),
  );
}
