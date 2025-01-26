import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/buttons/custom_button.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'quiz_questions_view.dart';

class RamadanQuizWelcomeView extends StatelessWidget {
  const RamadanQuizWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> quizList = [
    //   {
    //     'image': AppImages.umrah,
    //   }
    // ];

    final List<String> quizList = [
      AppImages.mosqueQuiz2,
      AppImages.dua,
      AppImages.quranQuiz,
      AppImages.dates,
      AppImages.moonQuiz,
      AppImages.couple,
      AppImages.mosqueQuiz,
      AppImages.twoMen,
      AppImages.mosqueSmall,
      AppImages.eid,
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.quiz,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              CustomText(
                text: tr('ramadanQuiz'),
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 5)
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: tr('testYourKnowledgeOfRamadan'),
                fontSize: 18,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 15.h,
                    // crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => QuizLevelWidget(
                    levelNum: index + 1,
                    image: quizList[index],
                  ),
                ),
              )
            ],
          ),
          // Final quiz Button
          Positioned(
            bottom: 25.h,
            left: 0,
            right: 0,
            // top: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              child: CustomButton(
                width: 200,
                background: Theme.of(context).colorScheme.outline,
                title: tr('startFinalQuiz'),
                textColor: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizQuestionView()),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 20.h,
            top: 50.h,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizLevelWidget extends StatelessWidget {
  const QuizLevelWidget({
    super.key,
    required this.levelNum,
    required this.image,
  });

  final int levelNum;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.h,
          right: 10.h,
          child: Image.asset(
            AppImages.cloud,
            // fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            // borderRadius: BorderRadius.circular(10),
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomText(
            text: levelNum.toString(),
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0.h,
          left: 20.h,
          // right: 0,
          top: 0,
          child: Image.asset(
            image,
            // fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.08,
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 0.h,
          child: Image.asset(
            AppImages.cloud,
            // fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05,
          ),
        ),
      ],
    );
  }
}
