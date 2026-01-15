import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String lexend = 'Lexend';
  static const String urbanist = 'Urbanist';

  //---------------- NAV BAR ----------------

  // Lexend – navbar labels
  static const TextStyle navLabel = TextStyle(
    fontFamily: lexend,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  // ---------------- HEADERS ----------------

  // Urbanist / H5 / Bold – Drink Completion
  static const TextStyle drinkCompletionTitle = TextStyle(
    fontFamily: urbanist,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  // Urbanist /100% -Hydration Source card
  static const TextStyle donutCenterValue = TextStyle(
    fontFamily: urbanist,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  // ---------------- BODY ----------------

  // Water 80% -Hydration Source card
  static const TextStyle hydrationValue = TextStyle(
    fontFamily: urbanist,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // Urbanist / XSmall / Regular – Water intake
  static const TextStyle hydrationCaption = TextStyle(
    fontFamily: urbanist,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: AppColors.textSecondary,
  );

  // ---------------- DATE ----------------

  // Urbanist / H6 / Semibold – Date range
  static const TextStyle dateRange = TextStyle(
    fontFamily: urbanist,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  // ---------------- INTERVAL TABS ----------------

  // Urbanist / Large / Bold – Weekly / Monthly / Yearly
  static const TextStyle intervalSelected = TextStyle(
    fontFamily: urbanist,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle intervalUnselected = TextStyle(
    fontFamily: urbanist,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.black,
  );

  // ---------------- CHART ----------------

  //   Y axis % labels
  static const TextStyle chartYAxisLabel = TextStyle(
    fontFamily: urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Urbanist / Medium / Medium – X axis labels
  static const TextStyle chartXAxisLabel = TextStyle(
    fontFamily: urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Urbanist – Tooltip value
  static const TextStyle chartTooltip = TextStyle(
    fontFamily: urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.deep2,
  );
}
