import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class DuaContentView extends StatelessWidget {
  const DuaContentView({
    super.key,
    required this.duaTitle,
    required this.duaImage,
    required this.arabicTranslation,
    required this.englishTranslation,
  });

  final String duaTitle;
  final String duaImage;
  final String arabicTranslation;
  final String englishTranslation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          // Image.asset(
          //   AppImages.quiz,
          //   fit: BoxFit.cover,
          // ),
          // Container(
          //   color: Colors.black.withOpacity(0.5),
          // ),

          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Image.asset(
                  height: MediaQuery.of(context).size.height * 0.3,
                  AppImages.featureMosque,
                  color: Theme.of(context).colorScheme.surface,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.h),
                margin: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: duaTitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(text: arabicTranslation),
                    SizedBox(height: 10.h),
                    CustomText(text: englishTranslation),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 50),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
