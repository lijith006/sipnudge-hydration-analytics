import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.barChartActiveColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          // _NavItem(Icons.home, 'Home', active: true),
          // _NavItem(Icons.bar_chart, 'Analysis'),
          // _NavItem(Icons.emoji_events, 'Goals'),
          // _NavItem(Icons.settings, 'Settings'),
        ],
      ),
    );
  }
}
