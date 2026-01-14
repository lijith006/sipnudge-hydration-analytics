import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/analysis_cubit.dart';
import '../cubit/analysis.state.dart';
import '../models/hydration_stats.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_radius.dart';
import '../core/theme/app_text_styles.dart';

class IntervalSelector extends StatelessWidget {
  const IntervalSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.nav),
          ),
          child: Row(
            children: IntervalType.values.map((interval) {
              final bool isSelected = state.interval == interval;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<AnalysisCubit>().changeInterval(interval);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.intervalTabColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        AppRadius.buttonCurved,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _label(interval),
                      style: isSelected
                          ? AppTextStyles.urbanistBold.copyWith(fontSize: 15)
                          : AppTextStyles.semiBoldBlack,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  String _label(IntervalType interval) {
    switch (interval) {
      case IntervalType.weekly:
        return 'Weekly';
      case IntervalType.monthly:
        return 'Monthly';
      case IntervalType.yearly:
        return 'Yearly';
    }
  }
}
