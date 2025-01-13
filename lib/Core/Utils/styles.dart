import 'package:flutter/material.dart';

abstract class Styles {
  /// Default text style based on theme
  static TextStyle defaultStyle(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodyLarge?.color, // Updated
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return defaultStyle(context)
        .copyWith(fontSize: 14, fontWeight: FontWeight.normal);
  }

  /// Predefined styles
  static TextStyle textStyle18(BuildContext context) {
    return defaultStyle(context)
        .copyWith(fontSize: 18, fontWeight: FontWeight.w600);
  }

  static TextStyle textStyle20(BuildContext context) {
    return defaultStyle(context)
        .copyWith(fontSize: 20, fontWeight: FontWeight.normal);
  }

  static TextStyle textStyle30(BuildContext context) {
    return defaultStyle(context).copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    );
  }

  /// Utility to copy and modify a style
  static TextStyle changeColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
}
