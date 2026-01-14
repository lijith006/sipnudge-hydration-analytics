import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_app/models/chart_type.dart';

import '../../cubit/analysis_cubit.dart';
import '../../cubit/analysis.state.dart';
import '../../core/theme/app_colors.dart';

class ChartToggle extends StatelessWidget {
  const ChartToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      buildWhen: (p, c) => p.chartType != c.chartType,
      builder: (context, state) {
        return Container(
          // padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon(
                context,
                'assets/icons/chart_bar.png',
                ChartType.bar,
                state.chartType,
              ),
              _icon(
                context,
                'assets/icons/chart_area.png',
                ChartType.area,
                state.chartType,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _icon(
    BuildContext context,
    String asset,
    ChartType type,
    ChartType active,
  ) {
    final selected = type == active;

    return GestureDetector(
      onTap: () => context.read<AnalysisCubit>().changeChartType(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: selected ? AppColors.chartTogglebutton : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Image.asset(
          asset,
          width: 30,
          height: 16,
          color: selected
              ? AppColors.textPrimary
              : AppColors.chartToggleUnselected,
        ),
      ),
    );
  }
}
