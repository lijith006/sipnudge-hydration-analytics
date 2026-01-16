import 'package:fl_chart/fl_chart.dart';
import 'chart_tooltip.dart';

class BarChartTooltip {
  static BarTouchTooltipData build() {
    return BarTouchTooltipData(
      fitInsideHorizontally: true,
      tooltipMargin: 2,
      tooltipPadding: ChartTooltipStyle.padding,
      tooltipBorderRadius: ChartTooltipStyle.radius,
      tooltipBorder: ChartTooltipStyle.border,
      getTooltipColor: (_) => ChartTooltipStyle.background,

      getTooltipItem: (group, _, rod, __) {
        return BarTooltipItem(
          '${rod.toY.toInt()}%',
          ChartTooltipStyle.textStyle,
        );
      },
    );
  }
}
