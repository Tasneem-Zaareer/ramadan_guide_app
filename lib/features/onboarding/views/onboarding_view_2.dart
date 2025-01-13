import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280,
            width: 120,
            child: Image.asset(
              AppImages.lantern,
              fit: BoxFit.cover,
            ),
          ),
          // Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'A Month of Reflection',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomText(
                        text:
                            'Ramadan is a time to cleanse the heart, refresh the soul, and reconnect with your Creator.'),
                  ],
                ),
              ),
            ],
          ),
          // Spacer(flex: 1),

          Container(
            height: 350,
            width: 275,
            child: Image.asset(
              AppImages.girlWithMoon,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
