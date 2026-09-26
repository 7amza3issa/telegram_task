import 'package:flutter/material.dart';

abstract class ResponsiveBreakpoints {
  static const double mobileMax = 600;
  static const double tabletMax = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileMax;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobileMax &&
      MediaQuery.sizeOf(context).width < tabletMax;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletMax;

  static double widthPercent(BuildContext context, double percent) =>
      MediaQuery.sizeOf(context).width * (percent / 100);

  static double heightPercent(BuildContext context, double percent) =>
      MediaQuery.sizeOf(context).height * (percent / 100);
  static double scale(BuildContext context, double baseSize) {
    double width = MediaQuery.sizeOf(context).width;
    if (width >= tabletMax) {
      return baseSize * 1.25;
    } else if (width >= mobileMax) {
      return baseSize * 1.15;
    }
    return baseSize;
  }
}
