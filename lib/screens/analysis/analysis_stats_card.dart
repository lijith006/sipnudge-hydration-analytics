import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_app/core/theme/%20app_surfaces.dart';
import 'package:sipnudge_app/cubit/analysis.state.dart';
import 'package:sipnudge_app/cubit/analysis_cubit.dart';
import 'package:sipnudge_app/widgets/date_navigator.dart';
import 'package:sipnudge_app/widgets/interval_selector.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';

class AnalysisStatsCard extends StatelessWidget {
  const AnalysisStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      buildWhen: (p, c) => p.interval != c.interval,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppSurfaces.card,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: Colors.white.withOpacity(0.28), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntervalSelector(),
              SizedBox(height: AppSpacing.md),
              DateNavigator(),
            ],
          ),
        );
      },
    );
  }
}
