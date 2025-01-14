import 'package:flutter/material.dart';
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
          const Column(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.asset(
              //     categoryImage,
              //     fit: BoxFit.cover,
              //     height: MediaQuery.of(context).size.height * 0.10,
              //     width: MediaQuery.of(context).size.height * 0.23,
              //   ),
              // ),
            ],
          ),
          Container(
            // width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: categoryColor,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Center(
            child: CustomText(
              text: categoryName,
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
