import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ramadan_guide_app/features/ramadan_quiz/views/quiz_welcom_view.dart';
import '../../../../core/constants/app_images.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () => {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: RamadanQuizWelcomeView(),
            withNavBar: false, // Hides the bottom navigation bar
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          ),
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const RamadanQuizWelcomeView(),
          //   ),
          // )
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.quiz2,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.17,
                width: double.infinity,
              ),
            )),
      ),
    );
  }
}
