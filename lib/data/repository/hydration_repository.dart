import '../../models/hydration_stats.dart';
import '../mock/hydration_mock_db.dart';

class HydrationRepository {
  final HydrationMockDb db;

  HydrationRepository(this.db);

  HydrationStats fetchStats({
    required IntervalType interval,
    required DateTime startDate,
  }) {
    switch (interval) {
      case IntervalType.weekly:
        return HydrationStats(
          interval: interval,
          startDate: startDate,
          entries: db.getWeeklyData(startDate),
        );

      case IntervalType.monthly:
        return HydrationStats(
          interval: interval,
          startDate: startDate,
          entries: db.getMonthlyData(startDate),
        );

      case IntervalType.yearly:
        return HydrationStats(
          interval: interval,
          startDate: startDate,
          entries: db.getYearlyData(startDate),
        );
    }
  }
}
