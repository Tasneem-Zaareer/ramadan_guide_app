import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/widgets/buttons/custom_button.dart';
import '../../../core/widgets/text/custome_text.dart';

class DeclarationView extends StatelessWidget {
  const DeclarationView({super.key});

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
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: tr('affiliateDeclaration'),
                  color: Colors.white,
                  fontSize: 16,
                  textAlign: TextAlign.justify,
                  maxLines: 20,
                ),
                SizedBox(height: 25),
                CustomButton(
                  title: 'Got it 🤍',
                  background: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
