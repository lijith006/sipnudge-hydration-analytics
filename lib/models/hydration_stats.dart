import 'package:sipnudge_app/models/hydration_entry.dart';

enum IntervalType { weekly, monthly, yearly }

class HydrationStats {
  final IntervalType interval;
  final DateTime startDate;
  final List<HydrationEntry> entries;

  const HydrationStats({
    required this.interval,
    required this.startDate,
    required this.entries,
  });
}
