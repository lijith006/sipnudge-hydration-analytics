import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_app/core/theme/app_colors.dart';
import 'package:sipnudge_app/core/theme/app_spacing.dart';

import '../cubit/analysis_cubit.dart';
import '../cubit/analysis.state.dart';

import '../core/theme/app_text_styles.dart';

class DateNavigator extends StatelessWidget {
  const DateNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ArrowButton(
              asset: 'assets/icons/left_arrow.png',
              enabled: true,
              onTap: () {
                context.read<AnalysisCubit>().goToPreviousRange();
              },
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.15),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Text(
                state.formattedRangeWithYear,
                key: ValueKey(state.formattedRangeWithYear),
                style: AppTextStyles.dateRange,
              ),
            ),

            _ArrowButton(
              asset: 'assets/icons/right_arrow.png',
              enabled: state.canGoNext,
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
  final String asset;
  final VoidCallback? onTap;
  final bool enabled;

  const _ArrowButton({
    required this.asset,
    required this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: Opacity(
          opacity: enabled ? 1.0 : 0.3,
          child: Image.asset(
            asset,
            width: 16,
            height: 16,
            fit: BoxFit.contain,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
