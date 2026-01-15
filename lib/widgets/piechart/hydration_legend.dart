import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_colors.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/models/hydration_source.dart';

class HydrationLegend extends StatelessWidget {
  final HydrationSource source;
  final double scale;

  const HydrationLegend({super.key, required this.source, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LegendItem(
          color: AppColors.accentBlue,
          label: 'Water (${source.water.toInt()}%)',
        ),
        const SizedBox(height: 12),
        _LegendItem(
          color: AppColors.accentGreen,
          label: 'Food (${source.food.toInt()}%)',
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: AppTextStyles.hydrationValue),
      ],
    );
  }
}
