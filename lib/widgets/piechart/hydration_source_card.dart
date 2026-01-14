import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/%20app_surfaces.dart';
import 'package:sipnudge_app/core/theme/app_radius.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/widgets/piechart/legends.dart';
import 'package:sipnudge_app/widgets/piechart/piechart_placeholder.dart';

class HydrationSourceSection extends StatelessWidget {
  const HydrationSourceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppSurfaces.card,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hydration Source',
            style: AppTextStyles.urbanistBold.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              PieChartPlaceholder(),
              const SizedBox(width: 16),
              Legend(),
            ],
          ),
        ],
      ),
    );
  }
}
