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
      child: Column(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.1,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Theme.of(context).colorScheme.primary,
          //   ),
          // ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              children: [
                Image.asset(
                  categoryImage,
                  height: MediaQuery.of(context).size.height * 0.09,
                  fit: BoxFit.contain,
                ),
                Container(
                  width: MediaQuery.of(context).size.height * 0.1,
                  child: CustomText(
                    text: categoryName,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
