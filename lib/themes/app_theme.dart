import 'package:flutter/material.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- LIGHT THEME ---
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.tiffanyBlue,
        primary: AppColors.tiffanyBlue,
        secondary: AppColors.hotPink,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.tiffanyBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.hotPink,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // --- DARK THEME ---
  static ThemeData get darkTheme {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkTiffanyBlue,
        secondary: AppColors.darkHotPink,
        tertiary: AppColors.darkHotPink,
        surface: AppColors.darkCardBackground,
      ).copyWith(surface: AppColors.darkBackground),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.hotPink,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: TextTheme(
        titleLarge: baseTextTheme.titleLarge!.copyWith(
          color: AppColors.darkTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: baseTextTheme.titleMedium!.copyWith(
          color: AppColors.darkTextPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        bodyLarge: baseTextTheme.bodyLarge!.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.hotPink,
        elevation: 0,
        indicatorColor: Colors.white.withValues(alpha: 0.2),
        labelTextStyle: WidgetStateProperty.all(
          GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(color: Colors.white),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkTiffanyBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
