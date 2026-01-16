import 'package:flutter/material.dart';

import 'bottom_nav_item.dart';

class AnalysisBottomNav extends StatelessWidget {
  const AnalysisBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Container(
        height: 88,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF2B2536),
          borderRadius: BorderRadius.circular(90),
          border: Border.all(color: Colors.white.withOpacity(0.25), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              blurRadius: 30,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: const [
            Expanded(
              child: BottomNavItem(
                icon: 'assets/icons/home.png',
                label: 'Home',
                isActive: true,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                icon: 'assets/icons/analysis.png',
                label: 'Analysis',
                isActive: false,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                icon: 'assets/icons/emoji_events.png',
                label: 'Goals',
                isActive: false,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                icon: 'assets/icons/settings.png',
                label: 'Settings',
                isActive: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
