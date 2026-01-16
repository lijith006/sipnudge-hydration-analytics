import 'package:fl_chart/fl_chart.dart';
import 'chart_tooltip.dart';

class AreaChartTooltip {
  static LineTouchTooltipData build({required double dailyTargetLitres}) {
    return LineTouchTooltipData(
      fitInsideHorizontally: true,
      tooltipMargin: 10,
      tooltipPadding: ChartTooltipStyle.areaPadding,
      tooltipBorderRadius: ChartTooltipStyle.radius,
      tooltipBorder: ChartTooltipStyle.border,
      getTooltipColor: (_) => ChartTooltipStyle.background,

      getTooltipItems: (spots) {
        return spots.map((spot) {
          final litres = (spot.y / 100) * dailyTargetLitres;
          return LineTooltipItem(
            '${litres.toStringAsFixed(2)} L',
            ChartTooltipStyle.textStyle,
          );
        }).toList();
      },
    );
  }
}
