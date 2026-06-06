import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isOutlined;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppTheme.primaryColor;
    final fgColor = foregroundColor ?? AppTheme.onPrimaryColor;

    Widget button;
    if (isOutlined) {
      button = OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: bgColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _buildChild(bgColor),
      );
    } else {
      button = ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _buildChild(fgColor),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }

  Widget _buildChild(Color textColor) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: textColor,
        ),
      );
    }
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }
}
