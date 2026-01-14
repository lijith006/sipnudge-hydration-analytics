// import 'package:flutter/material.dart';

// class AppTextStyles {
//   // H4 / Bold
//   static const TextStyle h4Bold = TextStyle(
//     fontFamily: 'Urbanist',
//     fontSize: 24,
//     fontWeight: FontWeight.w700,
//   );

//   // H5 / Bold
//   static const TextStyle h5Bold = TextStyle(
//     fontFamily: 'Urbanist',
//     fontSize: 20,
//     fontWeight: FontWeight.w700,
//   );

//   // H6 / SemiBold
//   static const TextStyle h6SemiBold = TextStyle(
//     fontFamily: 'Urbanist',
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//   );

//   // Large / Bold
//   static const TextStyle largeBold = TextStyle(
//     fontFamily: 'Urbanist',
//     fontSize: 16,
//     fontWeight: FontWeight.w700,
//   );

//   // Medium / Medium
//   static const TextStyle medium = TextStyle(
//     fontFamily: 'Urbanist',
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//   );

//   // XSmall / Regular
//   static const TextStyle xSmall = TextStyle(
//     fontFamily: 'Urbanist',
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//   );

//   // Example Lexend usage (if needed)
//   static const TextStyle lexendBody = TextStyle(
//     fontFamily: 'Lexend',
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
// }
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font families
  static const String lexend = 'Lexend';
  static const String urbanist = 'Urbanist';

  // Headings / titles
  static const TextStyle heading = TextStyle(
    fontFamily: lexend,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );
  static const TextStyle headingBlack = TextStyle(
    fontFamily: lexend,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.black,
  );

  // Section labels / tabs (Weekly, Monthly, Yearly)
  static const TextStyle subHeading = TextStyle(
    fontFamily: lexend,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.black,
  );
  static const TextStyle subHeadingWhite = TextStyle(
    fontFamily: lexend,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.textSecondary,
  );

  // Body / supporting text
  static const TextStyle body = TextStyle(
    fontFamily: urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  //Urbanist semibold white
  static const TextStyle semiBold = TextStyle(
    fontFamily: urbanist,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textSecondary,
  );
  //Urbanist semibold black
  static const TextStyle semiBoldBlack = TextStyle(
    fontFamily: urbanist,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.black,
  );

  //Urbanist bold
  static const TextStyle urbanistBold = TextStyle(
    fontFamily: urbanist,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // Tooltip text
  static const TextStyle tooltip = TextStyle(
    fontFamily: urbanist,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: Colors.white,
  );

  // Chart values / percentages
  static const TextStyle chartValue = TextStyle(
    fontFamily: lexend,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}
