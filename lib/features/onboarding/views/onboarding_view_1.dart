import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: 120,
            child: Image.asset(
              AppImages.lantern,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'The Spirit of Giving',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomText(
                        text:
                            'In Ramadan, every act of kindness becomes a bridge to countless blessings.'),
                  ],
                ),
              ),
            ],
          ),
          Spacer(flex: 1),
          Container(
            height: 350,
            width: 250,
            child: Image.asset(
              AppImages.boyWithLantern,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
