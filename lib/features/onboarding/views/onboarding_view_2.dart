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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset(
              AppImages.lantern,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'A Month of Reflection',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    CustomText(
                      text:
                          'Ramadan is a time to cleanse the heart, refresh the soul, and reconnect with your Creator.',
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(flex: 1),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            width: MediaQuery.of(context).size.height * 0.37,
            child: Image.asset(
              AppImages.couple,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
