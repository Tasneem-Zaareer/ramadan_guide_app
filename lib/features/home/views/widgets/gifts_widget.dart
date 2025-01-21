import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'package:ramadan_guide_app/features/ramadan_gifts/views/gifts_view.dart';
import 'package:ramadan_guide_app/features/ramadan_quiz/views/quiz_welcom_view.dart';
import '../../../../core/constants/app_images.dart';

class GiftsWidget extends StatelessWidget {
  const GiftsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: GestureDetector(
        onTap: () => {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: GiftsView(),
            withNavBar: false, // Hides the bottom navigation bar
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          ),
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const GiftsView(),
          //   ),
          // )
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImages.giftsTransparent,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    // text: tr('ramadanGiftsIdeas'),
                    text: tr('ramadanGifts'),
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20.sp,
                  ),
                  CustomText(
                    // text: tr('ramadanGiftsIdeas'),
                    text: tr('ideas'),
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20.sp,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
