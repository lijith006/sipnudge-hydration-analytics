import 'package:flutter/material.dart';

import '../../models/hydration_entry.dart';

class HydrationMockDb {
  List<HydrationEntry> getWeeklyData(DateTime start) {
    return List.generate(7, (index) {
      return HydrationEntry(
        date: start.add(Duration(days: index)),
        value: 60 + (index * 5),
      );
    });
  }

  List<HydrationEntry> getMonthlyData(DateTime start) {
    final daysInMonth = DateUtils.getDaysInMonth(start.year, start.month);

    return List.generate(daysInMonth, (index) {
      return HydrationEntry(
        date: DateTime(start.year, start.month, index + 1),
        value: 50 + (index % 10) * 3,
      );
    });
  }

  List<HydrationEntry> getYearlyData(DateTime start) {
    return List.generate(12, (index) {
      return HydrationEntry(
        date: DateTime(start.year, start.month + index),
        value: 40 + (index * 4),
      );
    });
  }
}
