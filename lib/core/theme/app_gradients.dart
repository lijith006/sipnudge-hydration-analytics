import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static const LinearGradient background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.25, 0.5, 0.7, 0.85, 1.0],
    colors: [
      AppColors.purpleLight,
      AppColors.purpleMid,
      AppColors.purpleDark,
      AppColors.purpleDarker,
      AppColors.deep1,
      AppColors.deep2,
    ],
  );

  static const LinearGradient hydrationWaterDonut = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.waterColorGradient,
      AppColors.waterColorGradientMid,
      AppColors.waterColorGradientDark,
    ],
  );
  static const bottomNavActive = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF9870a0), Color(0xFF4b3650)],
  );
}
