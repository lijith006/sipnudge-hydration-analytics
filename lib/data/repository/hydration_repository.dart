import 'package:sipnudge_app/models/hydration_source.dart';

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

  HydrationSource fetchHydrationSource({
    required IntervalType interval,
    required DateTime startDate,
  }) {
    final stats = fetchStats(interval: interval, startDate: startDate);

    double waterTotal = 0;
    double foodTotal = 0;

    for (final entry in stats.entries) {
      waterTotal += entry.water;
      foodTotal += entry.food;
    }

    final total = waterTotal + foodTotal;

    if (total == 0) {
      return const HydrationSource(water: 0, food: 0);
    }

    return HydrationSource(
      water: (waterTotal / total) * 100,
      food: (foodTotal / total) * 100,
    );
  }
}
