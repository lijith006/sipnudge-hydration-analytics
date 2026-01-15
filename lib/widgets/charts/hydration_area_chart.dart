import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/cubit/analysis_cubit.dart';
import 'package:sipnudge_app/models/hydration_stats.dart';
import '../../models/hydration_entry.dart';
import '../../core/theme/app_colors.dart';

class HydrationAreaChart extends StatelessWidget {
  final List<HydrationEntry> entries;

  const HydrationAreaChart({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final interval = context.read<AnalysisCubit>().state.interval;

    return LineChart(
      LineChartData(
        minX: -0.5,
        maxX: entries.length - 0.25,
        minY: 0,
        maxY: 100,

        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),

        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                if (value % 20 != 0) return const SizedBox.shrink();
                return Text(
                  '${value.toInt()}%',
                  style: AppTextStyles.chartYAxisLabel,
                );
              },
            ),
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                if (value % 1 != 0) {
                  return const SizedBox.shrink();
                }

                final index = value.toInt();

                if (index < 0 || index >= entries.length) {
                  return const SizedBox.shrink();
                }

                final entry = entries[index];

                if (interval == IntervalType.weekly) {
                  return _xLabel(entry.date.day.toString());
                }

                if (interval == IntervalType.yearly) {
                  return _xLabel(DateFormat.MMM().format(entry.date));
                }

                const allowedDays = [1, 5, 10, 15, 20, 25, 30];
                if (!allowedDays.contains(entry.date.day)) {
                  return const SizedBox.shrink();
                }

                return _xLabel(entry.date.day.toString());
              },
            ),
          ),

          rightTitles: AxisTitles(),
          topTitles: AxisTitles(),
        ),

        //Touch and tooltip
        lineTouchData: LineTouchData(
          enabled: true,
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            fitInsideHorizontally: true,
            tooltipMargin: 10,
            tooltipPadding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 12,
            ),
            tooltipBorderRadius: BorderRadius.circular(100),
            tooltipBorder: BorderSide(
              color: AppColors.barChartActiveColor,
              width: 4,
            ),
            getTooltipColor: (_) => Colors.white,

            getTooltipItems: (spots) {
              const double dailyTargetLitres = 2.5;

              return spots.map((spot) {
                final litres = (spot.y / 100) * dailyTargetLitres;

                return LineTooltipItem(
                  '${litres.toStringAsFixed(2)} L',
                  AppTextStyles.chartTooltip,
                );
              }).toList();
            },
          ),
        ),

        //Area section
        lineBarsData: [
          LineChartBarData(
            isCurved: false,
            barWidth: 4,
            color: AppColors.areaChartLineColor,

            dotData: FlDotData(
              show: true,

              getDotPainter: (spot, _, __, ___) {
                return FlDotCirclePainter(
                  radius: 6,
                  color: Colors.white,
                  strokeWidth: 3,
                  strokeColor: AppColors.areaChartLineColor,
                );
              },
            ),

            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.areaChartColor,
                  AppColors.areaChartColorSecondary.withOpacity(0.05),
                ],
              ),
            ),

            spots: List.generate(
              entries.length,
              (i) => FlSpot(i.toDouble(), entries[i].total),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _xLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Text(text, style: AppTextStyles.chartXAxisLabel),
  );
}
