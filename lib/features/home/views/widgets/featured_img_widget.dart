import 'package:flutter/material.dart';

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
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                AppImages.helloRamadan,
                fit: BoxFit.cover,
              ),
            ),
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
      ],
    );
  }
}
