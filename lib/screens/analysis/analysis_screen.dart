import 'package:flutter/material.dart';
import 'package:sipnudge_app/models/hydration_source.dart';
import 'package:sipnudge_app/widgets/bottom_nav/analysis_bottom_nav.dart';
import 'package:sipnudge_app/widgets/charts/hydration_chart_section.dart';
import 'package:sipnudge_app/widgets/piechart/hydration_source_card.dart';
import '../../core/theme/app_gradients.dart';
import 'analysis_stats_card.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isLargeScreen = width >= 430;
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(gradient: AppGradients.background),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 24 : 16,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 16),

                          //Interval section
                          AnalysisStatsCard(),
                          SizedBox(height: 24),

                          //Chart card
                          HydrationChartSection(),
                          SizedBox(height: 24),

                          //Pie chart
                          HydrationSourceCard(
                            source: HydrationSource(water: 80, food: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Bottom nav bar
                  const AnalysisBottomNav(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
