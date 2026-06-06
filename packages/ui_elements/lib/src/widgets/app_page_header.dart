import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Two-row page header:
/// Row 1 — optional back arrow (top-left)
/// Row 2 — centred title below it
class AppPageHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppPageHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(104);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.surfaceColor,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 104,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back-button row (always 52 px tall to give space for top padding)
              SizedBox(
                height: 52,
                child: showBackButton
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: onBackPressed,
                          behavior: HitTestBehavior.opaque,
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 16, top: 16, bottom: 8, right: 16),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              // Title row
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
