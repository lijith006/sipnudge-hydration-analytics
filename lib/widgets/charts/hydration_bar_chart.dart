import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/cubit/analysis_cubit.dart';
import 'package:sipnudge_app/models/hydration_stats.dart';
import '../../models/hydration_entry.dart';
import '../../core/theme/app_colors.dart';

class HydrationBarChart extends StatefulWidget {
  final List<HydrationEntry> entries;

  const HydrationBarChart({super.key, required this.entries});

  @override
  State<HydrationBarChart> createState() => _HydrationBarChartState();
}

class _HydrationBarChartState extends State<HydrationBarChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final count = widget.entries.length;
    double barWidth;

    if (count <= 7) {
      barWidth = 28; // weekly
    } else if (count <= 12) {
      barWidth = 18; // yearly
    } else {
      barWidth = 6; // monthly
    }

    return BarChart(
      BarChartData(
        maxY: 100,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          //bottom X axis titles
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,

              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= widget.entries.length) {
                  return const SizedBox.shrink();
                }

                final interval = context.read<AnalysisCubit>().state.interval;
                final entry = widget.entries[index];

                // Weekly
                if (interval == IntervalType.weekly) {
                  return _xLabel(entry.date.day.toString());
                }

                // Yearly
                if (interval == IntervalType.yearly) {
                  return _xLabel(DateFormat.MMM().format(entry.date));
                }

                // Monthly
                final day = entry.date.day;
                const allowedDays = [1, 5, 10, 15, 20, 25, 30];

                if (!allowedDays.contains(day)) {
                  return const SizedBox.shrink();
                }

                return _xLabel(day.toString());
              },
            ),
          ),

          //left title - Y axis
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              reservedSize: 27,
              getTitlesWidget: (value, meta) {
                if (value % 20 != 0) return const SizedBox.shrink();

                return Text(
                  '${value.toInt()}%',
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                );
              },
            ),
          ),

          rightTitles: AxisTitles(),
          topTitles: AxisTitles(),
        ),

        barTouchData: BarTouchData(
          enabled: true,
          handleBuiltInTouches: true,
          touchCallback: (event, response) {
            if (!event.isInterestedForInteractions ||
                response == null ||
                response.spot == null) {
              setState(() {
                touchedIndex = null;
              });
              return;
            }

            setState(() {
              touchedIndex = response.spot!.touchedBarGroupIndex;
            });
          },
          touchTooltipData: BarTouchTooltipData(
            tooltipBorder: BorderSide(
              color: AppColors.barChartActiveColor,
              style: BorderStyle.solid,
              width: 4,
            ),
            tooltipMargin: 10,
            tooltipPadding: const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 5,
            ),
            tooltipBorderRadius: BorderRadius.circular(100),
            getTooltipColor: (_) => Colors.white,
            getTooltipItem: (group, _, rod, __) {
              return BarTooltipItem(
                '${rod.toY.toInt()}%',
                AppTextStyles.semiBold.copyWith(color: AppColors.deep2),
              );
            },
          ),
        ),

        barGroups: List.generate(widget.entries.length, (i) {
          return BarChartGroupData(
            x: i,
            // barsSpace: 2,
            barsSpace: 1,

            barRods: [
              BarChartRodData(
                toY: widget.entries[i].value,
                width: barWidth,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),

                color: i == touchedIndex
                    ? AppColors.barChartActiveColor
                    : AppColors.barChartColor,
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget _xLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Text(
      text,
      style: AppTextStyles.body.copyWith(color: Colors.white.withOpacity(0.6)),
    ),
  );
}
