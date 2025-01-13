import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'package:ramadan_guide_app/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'onboarding_view_1.dart';
import 'onboarding_view_2.dart';
import 'onboarding_view_3.dart';

class OnboardingControl extends StatelessWidget {
  const OnboardingControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          children: const [
            OnboardingView1(),
            OnboardingView2(),
            OnboardingView3(),
          ],
        ),
        Positioned(
          top: 70,
          right: 20,
          child: Container(
            // alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                children: [Icon(Icons.language), CustomText(text: 'Language')],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavBar(),
                ),
              );
            },
            child: const Text('Skip'),
          ),
          // child: CustomButton(
          //   height: 30,
          //   width: 130,
          //   title: 'Next',
          //   background: Colors.green.shade200,
          //   textColor: Colors.white,
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => BottomNavBar(),
          //       ),
          //     );
          //   },
          // ),
        ),
      ],
    ));
  }
}
