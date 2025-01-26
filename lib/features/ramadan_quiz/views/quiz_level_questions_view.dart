import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class QuizLevelQuestionView extends StatelessWidget {
  const QuizLevelQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: CustomText(
                  text:
                      'To dynamically generate the quizList based on the images list and adjust the title accordingly?',
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: GridView.builder(
              itemCount: 4,
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 35.h),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.h,
                childAspectRatio: 1 / 0.35,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomText(
                    text: 'answer',
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
