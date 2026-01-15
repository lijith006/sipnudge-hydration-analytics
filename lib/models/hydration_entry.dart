class HydrationEntry {
  final DateTime date;
  final double water;
  final double food;

  const HydrationEntry({
    required this.date,
    required this.water,
    required this.food,
  });

  double get total => water + food;
}
