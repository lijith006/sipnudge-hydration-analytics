import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_app/core/theme/analysis_spacing.dart';

import 'package:sipnudge_app/core/theme/app_surfaces.dart';
import 'package:sipnudge_app/cubit/analysis.state.dart';
import 'package:sipnudge_app/cubit/analysis_cubit.dart';
import 'package:sipnudge_app/widgets/date_navigator.dart';
import 'package:sipnudge_app/widgets/interval_selector.dart';

class AnalysisStatsCard extends StatelessWidget {
  const AnalysisStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      buildWhen: (p, c) => p.interval != c.interval,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: AnalysisSpacing.cardHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: AnalysisSpacing.cardPaddingHorizontal,
            vertical: AnalysisSpacing.cardPaddingVertical,
          ),
          decoration: BoxDecoration(
            color: AppSurfaces.card,
            borderRadius: BorderRadius.circular(AnalysisSpacing.cardRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: AnalysisSpacing.cardBorderWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IntervalSelector(),

              const SizedBox(height: AnalysisSpacing.cardGapLow),

              const DateNavigator(),
            ],
          ),
        );
      },
    );
  }
}
