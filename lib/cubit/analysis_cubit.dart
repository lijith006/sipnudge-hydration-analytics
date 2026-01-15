import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipnudge_app/cubit/analysis.state.dart';
import 'package:sipnudge_app/models/chart_type.dart';
import 'package:sipnudge_app/models/hydration_stats.dart';
import '../data/repository/hydration_repository.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final HydrationRepository repository;

  AnalysisCubit(this.repository)
    : super(
        AnalysisState(
          interval: IntervalType.weekly,
          startDate: DateTime.now(),
          chartType: ChartType.bar,
          stats: repository.fetchStats(
            interval: IntervalType.weekly,
            startDate: DateTime.now(),
          ),
        ),
      );

  void changeInterval(IntervalType interval) {
    final stats = repository.fetchStats(
      interval: interval,
      startDate: state.startDate,
    );

    emit(state.copyWith(interval: interval, stats: stats));
  }

  void changeChartType(ChartType type) {
    emit(state.copyWith(chartType: type));
  }

  void goToNextRange() {
    if (!state.canGoNext) return;

    switch (state.interval) {
      case IntervalType.weekly:
        emit(
          state.copyWith(
            startDate: state.startDate.add(const Duration(days: 7)),
          ),
        );
        break;

      case IntervalType.monthly:
        emit(
          state.copyWith(
            startDate: DateTime(
              state.startDate.year,
              state.startDate.month + 1,
            ),
          ),
        );
        break;

      case IntervalType.yearly:
        emit(state.copyWith(startDate: DateTime(state.startDate.year + 1)));
        break;
    }
  }

  void goToPreviousRange() {
    final newStart = _calculatePreviousStartDate();
    _loadForDate(newStart);
  }

  void _loadForDate(DateTime startDate) {
    final stats = repository.fetchStats(
      interval: state.interval,
      startDate: startDate,
    );

    emit(state.copyWith(startDate: startDate, stats: stats));
  }

  DateTime _calculatePreviousStartDate() {
    switch (state.interval) {
      case IntervalType.weekly:
        return state.startDate.subtract(const Duration(days: 7));
      case IntervalType.monthly:
        return DateTime(state.startDate.year, state.startDate.month - 1);
      case IntervalType.yearly:
        return DateTime(state.startDate.year - 1);
    }
  }
}
