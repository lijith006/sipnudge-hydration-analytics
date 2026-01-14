import 'package:flutter/material.dart';
import 'package:sipnudge_app/core/theme/app_text_styles.dart';

class Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _LegendItem(color: Colors.blue, text: 'Water (80%)'),
        SizedBox(height: 8),
        _LegendItem(color: Colors.green, text: 'Food (20%)'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.body),
      ],
    );
  }
}
