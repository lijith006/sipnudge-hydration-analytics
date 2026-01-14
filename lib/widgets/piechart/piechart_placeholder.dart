import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_colors.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';

class PieChartPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.accentBlue, width: 6),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('100%', style: AppTextStyles.urbanistBold),
          Text('Water Intake', style: AppTextStyles.body),
        ],
      ),
    );
  }
}
