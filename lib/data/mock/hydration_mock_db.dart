import 'package:flutter/material.dart';
import '../../models/hydration_entry.dart';

class HydrationMockDb {
  // Weekly data

  List<HydrationEntry> getWeeklyData(DateTime start) {
    final weeklyTotals = <double>[80, 60, 100, 70, 85, 95, 65];

    return List.generate(weeklyTotals.length, (index) {
      final total = weeklyTotals[index];

      return HydrationEntry(
        date: start.add(Duration(days: index)),
        water: total * 0.75,
        food: total * 0.25,
      );
    });
  }

  // Monthly data

  List<HydrationEntry> getMonthlyData(DateTime start) {
    final daysInMonth = DateUtils.getDaysInMonth(start.year, start.month);

    final pattern = <double>[70, 85, 60, 90, 75, 100, 65, 80, 95, 70];

    return List.generate(daysInMonth, (index) {
      final total = pattern[index % pattern.length];

      return HydrationEntry(
        date: DateTime(start.year, start.month, index + 1),
        water: total * 0.7,
        food: total * 0.3,
      );
    });
  }

  // Yearly data

  List<HydrationEntry> getYearlyData(DateTime start) {
    final yearlyTotals = <double>[
      65,
      70,
      80,
      75,
      90,
      95,
      85,
      88,
      92,
      78,
      70,
      82,
    ];

    return List.generate(12, (index) {
      final total = yearlyTotals[index];

      return HydrationEntry(
        date: DateTime(start.year, index + 1),
        water: total * 0.8,
        food: total * 0.2,
      );
    });
  }
}
