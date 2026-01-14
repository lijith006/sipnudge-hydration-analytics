import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_app/core/theme/%20app_surfaces.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';
import 'package:sipnudge_app/models/chart_type.dart';
import 'package:sipnudge_app/widgets/charts/chart_toggle.dart';
import 'package:sipnudge_app/widgets/charts/hydration_area_chart.dart';

import '../../cubit/analysis_cubit.dart';
import '../../cubit/analysis.state.dart';
import '../../core/theme/app_radius.dart';
import 'hydration_bar_chart.dart';

class HydrationChartSection extends StatelessWidget {
  const HydrationChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppSurfaces.card,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      height: 300,

      child: BlocBuilder<AnalysisCubit, AnalysisState>(
        buildWhen: (p, c) => p.stats != c.stats || p.chartType != c.chartType,

        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Drink Completion',
                    style: AppTextStyles.urbanistBold.copyWith(fontSize: 16),
                  ),
                  ChartToggle(),
                ],
              ),

              const SizedBox(height: 50),

              // Bar chart
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.chartType == ChartType.bar
                      ? HydrationBarChart(
                          key: const ValueKey('bar'),
                          entries: state.stats.entries,
                        )
                      : HydrationAreaChart(
                          key: const ValueKey('area'),
                          entries: state.stats.entries,
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
