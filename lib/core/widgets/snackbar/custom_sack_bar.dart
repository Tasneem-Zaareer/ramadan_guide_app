import 'package:flutter/material.dart';

void showCustomSnackbar({
  required BuildContext context,
  required Widget content,
  Color backgroundColor = Colors.blue,
  Duration duration = const Duration(seconds: 3),
  SnackBarBehavior behavior = SnackBarBehavior.floating,
  BorderRadiusGeometry? borderRadius,
  SnackBarAction? action,
  Curve animationCurve = Curves.easeInOut,
  int animationDurationMillis = 500,
}) {
  final animationController = AnimationController(
    vsync: ScaffoldMessenger.of(context),
    duration: Duration(milliseconds: animationDurationMillis),
  );

  final snackBar = SnackBar(
    content: content,
    backgroundColor: backgroundColor,
    behavior: behavior,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
    ),
    duration: duration,
    action: action,
    animation: CurvedAnimation(
      parent: animationController,
      curve: animationCurve,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
