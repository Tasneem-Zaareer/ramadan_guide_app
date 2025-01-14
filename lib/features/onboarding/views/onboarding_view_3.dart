import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class OnboardingView3 extends StatelessWidget {
  const OnboardingView3({super.key});

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
          // Spacer(flex: 3),
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
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    CustomText(
                      text:
                          'In Ramadan, every act of kindness becomes a bridge to countless blessings.',
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Spacer(flex: 1),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(-1.0, 1.0),
            child: Container(
              height: 370,
              width: 300,
              child: Image.asset(
                AppImages.boyPray,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
