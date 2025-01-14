import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/buttons/custom_button.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'quiz_questions_view.dart';

class RamadanQuizWelcomeView extends StatelessWidget {
  const RamadanQuizWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              // Start Button
              CustomButton(
                width: 200,
                background: Theme.of(context).colorScheme.tertiary,
                title: tr('startQuiz'),
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
              const SizedBox(height: 10),
              CustomButton(
                width: 200,
                background: Theme.of(context).colorScheme.background,
                title: tr('home'),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
