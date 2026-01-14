// import 'package:flutter/material.dart';
// import 'package:sipnudge_app/core/theme/app_colors.dart';
// import 'package:sipnudge_app/core/theme/app_text_styles.dart';

// class BubbleTooltip extends StatelessWidget {
//   final String text;

//   const BubbleTooltip({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: BubblePainter(),
//       child: Container(
//         width: 42,
//         height: 42,
//         alignment: Alignment.center,
//         child: Text(
//           text,
//           style: AppTextStyles.semiBold.copyWith(
//             color: AppColors.barChartActiveColor,
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BubblePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final border = Paint()
//       ..color = AppColors.barChartActiveColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3;

//     final path = Path()
//       ..addRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromLTWH(0, 0, size.width, size.height - 6),
//           const Radius.circular(20),
//         ),
//       )
//       ..moveTo(size.width / 2 - 6, size.height - 6)
//       ..lineTo(size.width / 2, size.height)
//       ..lineTo(size.width / 2 + 6, size.height - 6)
//       ..close();

//     canvas.drawPath(path, paint);
//     canvas.drawPath(path, border);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
