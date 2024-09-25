import 'package:bookly_flutter_app/Core/Utils/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.title,
      this.onPressed,
      this.borderRadius,
      this.fontSize});
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12))),
        onPressed: onPressed,
        child: Text(
          title,
          style: Styles.textStyle18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize),
        ));
  }
}
