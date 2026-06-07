import 'package:flutter/material.dart';

/// Shows a floating, rounded SnackBar with the app's standard styling.
///
/// Centralises the look of lightweight task feedback (added / updated /
/// removed) so screens don't each rebuild the same SnackBar configuration.
void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 2),
    ),
  );
}
