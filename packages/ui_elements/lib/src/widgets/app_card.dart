import 'package:flutter/material.dart';

/// A styled, reusable card for the OneNZ To-Do App.
///
/// Wraps [Card] with consistent padding and an optional [onTap] gesture.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: child,
        ),
      ),
    );
  }
}
