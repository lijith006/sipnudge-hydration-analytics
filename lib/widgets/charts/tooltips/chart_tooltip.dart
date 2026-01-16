import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ChartTooltipStyle {
  static const EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 10,
  );
  static const EdgeInsets areaPadding = EdgeInsets.symmetric(
    horizontal: 4,
    vertical: 12,
  );

  static BorderRadius get radius => BorderRadius.circular(100);

  static BorderSide get border =>
      const BorderSide(width: 4, color: AppColors.barChartActiveColor);

  static Color get background => Colors.white;

  static TextStyle get textStyle => AppTextStyles.chartTooltip;
}
