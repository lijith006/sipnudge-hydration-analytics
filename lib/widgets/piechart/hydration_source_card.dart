import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_surfaces.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/models/hydration_source.dart';
import 'package:sipnudge_app/widgets/piechart/hydration_donut_chart.dart';
import 'package:sipnudge_app/widgets/piechart/hydration_legend.dart';

class HydrationSourceCard extends StatelessWidget {
  final HydrationSource source;

  const HydrationSourceCard({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final scale = (screenWidth / 382).clamp(0.85, 1.0);

    return Center(
      child: Container(
        width: 382 * scale,
        height: 229 * scale,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppSurfaces.card,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.28)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(5, 5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hydration Source', style: AppTextStyles.drinkCompletionTitle),
            const SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HydrationDonutChart(source: source, scale: scale),
                const SizedBox(width: 16),

                Expanded(
                  child: HydrationLegend(source: source, scale: scale),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
