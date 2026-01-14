import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/analysis_cubit.dart';
import '../cubit/analysis.state.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_spacing.dart';
import '../core/theme/app_text_styles.dart';

class DateNavigator extends StatelessWidget {
  const DateNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ArrowButton(
              icon: Icons.chevron_left,
              onTap: () {
                context.read<AnalysisCubit>().goToPreviousRange();
              },
            ),

            Text(state.formattedRange, style: AppTextStyles.semiBold),

            _ArrowButton(
              icon: Icons.chevron_right,
              onTap: () {
                context.read<AnalysisCubit>().goToNextRange();
              },
            ),
          ],
        );
      },
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: Icon(icon, size: 22, color: AppColors.textSecondary),
      ),
    );
  }
}
