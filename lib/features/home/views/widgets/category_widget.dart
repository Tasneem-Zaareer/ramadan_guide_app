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
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            top: 15,
            left: 3,
            child: Image.asset(
              categoryImage,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          Positioned(
            right: 0,
            top: 25,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: CustomText(
                  text: categoryName,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
