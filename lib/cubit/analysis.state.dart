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

  String get formattedRangeWithYear {
    final year = startDate.year;

    switch (interval) {
      case IntervalType.weekly:
        final formatter = DateFormat('MMM d');
        final end = startDate.add(const Duration(days: 6));
        return '${formatter.format(startDate)} – ${formatter.format(end)}, $year';

      case IntervalType.monthly:
        final month = DateFormat('MMMM').format(startDate);
        return '$month, $year';

      case IntervalType.yearly:
        return year.toString();
    }
  }

  bool get canGoNext {
    final today = DateTime.now();

    switch (interval) {
      case IntervalType.weekly:
        final end = startDate.add(const Duration(days: 6));
        return end.isBefore(today);

      case IntervalType.monthly:
        final nextMonth = DateTime(startDate.year, startDate.month + 1);
        return nextMonth.isBefore(today);

      case IntervalType.yearly:
        return startDate.year < today.year;
    }
  }

  bool get canGoPrevious => true;
}
