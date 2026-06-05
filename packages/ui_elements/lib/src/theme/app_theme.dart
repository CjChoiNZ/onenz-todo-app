import 'package:flutter/material.dart';

/// Centralised app theme for the OneNZ To-Do App.
///
/// Provides a consistent, cohesive look-and-feel across both
/// Web and Android platforms.
class AppTheme {
  AppTheme._();

  // ── Colour Palette ──────────────────────────────────────────
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color surfaceColor = Color(0xFFF5F5F5);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color onPrimaryColor = Colors.white;
  static const Color textColor = Color(0xFF1D1D1D);
  static const Color subtextColor = Color(0xFF757575);

  // ── Light Theme ─────────────────────────────────────────────
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: surfaceColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: subtextColor,
        ),
      ),
    );
  }
}
