import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

import '../../../../core/constants/app_images.dart';

class FeatureImage extends StatelessWidget {
  const FeatureImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                AppImages.featureMosque,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        Positioned(
          right: 50,
          top: 35,
          child: Image.asset(
            height: MediaQuery.of(context).size.height * 0.05,
            AppImages.cloud,
            opacity: const AlwaysStoppedAnimation(.9),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 1,
          child: Image.asset(
            height: MediaQuery.of(context).size.height * 0.17,
            AppImages.boyPray,
            // fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 50,
          top: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Duhur',
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: '12:30',
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: CustomText(
                      text: 'PM',
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
