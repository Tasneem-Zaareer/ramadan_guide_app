import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/text/custome_text.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.categoryName,
    required this.categoryImage,
    required this.onTap,
    required this.categoryColor,
  });

  final String categoryName;
  final String categoryImage;
  final Function onTap;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                CustomText(
                  text: categoryName,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Image.asset(
                  categoryImage,
                  height: MediaQuery.of(context).size.height * 0.14,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
