import 'package:intl/intl.dart';
import 'package:sipnudge_app/models/chart_type.dart';

import '../models/hydration_stats.dart';

class AnalysisState {
  final IntervalType interval;
  final DateTime startDate;
  final HydrationStats stats;
  final ChartType chartType;

  const AnalysisState({
    required this.interval,
    required this.startDate,
    required this.stats,
    required this.chartType,
  });

  AnalysisState copyWith({
    IntervalType? interval,
    DateTime? startDate,
    HydrationStats? stats,
    ChartType? chartType,
  }) {
    return AnalysisState(
      interval: interval ?? this.interval,
      startDate: startDate ?? this.startDate,
      stats: stats ?? this.stats,
      chartType: chartType ?? this.chartType,
    );
  }

  // used by  DateNavigator
  String get formattedRange {
    final formatter = DateFormat('MMM d');

    switch (interval) {
      case IntervalType.weekly:
        final end = startDate.add(const Duration(days: 6));
        return '${formatter.format(startDate)} – ${formatter.format(end)}';

      case IntervalType.monthly:
        return DateFormat('MMMM yyyy').format(startDate);

      case IntervalType.yearly:
        return startDate.year.toString();
    }
  }
}
