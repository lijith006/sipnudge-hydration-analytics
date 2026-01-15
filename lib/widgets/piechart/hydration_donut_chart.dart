import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_colors.dart';
import 'package:sipnudge_app/core/theme/app_gradients.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/models/hydration_source.dart';

class HydrationDonutChart extends StatelessWidget {
  final HydrationSource source;
  final double scale;

  const HydrationDonutChart({
    super.key,
    required this.source,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    final size = 120 * scale;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              startDegreeOffset: 230,
              centerSpaceRadius: size * 0.42,
              sections: [
                PieChartSectionData(
                  value: source.water,
                  gradient: AppGradients.hydrationWaterDonut,
                  radius: size * 0.08,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: source.food,
                  color: AppColors.foodColor,
                  radius: size * 0.08,
                  showTitle: false,
                ),
              ],
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('100%', style: AppTextStyles.donutCenterValue),
              Text('Water Intake', style: AppTextStyles.hydrationCaption),
            ],
          ),
        ],
      ),
    );
  }
}
