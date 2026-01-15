import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_colors.dart';
import 'package:sipnudge_app/widgets/bottom_nav/active_nav_clipper.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_gradients.dart';

class BottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: isActive ? ActiveNavClipper() : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isActive ? 56 : 44,
          alignment: Alignment.center,
          child: isActive
              ? _ActiveCapsule(icon: icon, label: label)
              : _InactiveCapsule(icon: icon, label: label),
        ),
      ),
    );
  }
}

class _ActiveCapsule extends StatelessWidget {
  final String icon;
  final String label;

  const _ActiveCapsule({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: AppGradients.bottomNavActive,
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 16, width: 16, color: Colors.white),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: AppTextStyles.navLabel,
            ),
          ],
        ),
      ),
    );
  }
}

class _InactiveCapsule extends StatelessWidget {
  final String icon;
  final String label;

  const _InactiveCapsule({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 16,
            width: 16,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: AppTextStyles.navLabel,
          ),
        ],
      ),
    );
  }
}
