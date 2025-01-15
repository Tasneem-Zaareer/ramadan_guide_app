import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../helper/get_device_type.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final String? fontFamily;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow? textOverflow;
  final TextDirection textDirection;
  final List<Shadow>? shadows;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color,
    this.textAlign = TextAlign.start,
    // this.fontFamily = 'SF Pro Display',
    this.fontFamily,
    this.fontWeight = FontWeight.w700,
    this.textDecoration = TextDecoration.none,
    this.maxLines = 5,
    this.textOverflow,
    this.textDirection = TextDirection.ltr,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool isTaplet = checkDeviceIsTaplet(context);
    Color defaultColor = color ?? Theme.of(context).colorScheme.onSecondary;
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      textDirection: textDirection,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: textDecoration,
          shadows: shadows,
          fontSize: fontSize,
          // fontSize: (isTaplet ? (fontSize - 2).sp : fontSize.sp),
          color: defaultColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
