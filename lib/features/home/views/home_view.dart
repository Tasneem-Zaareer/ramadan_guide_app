import 'package:flutter/material.dart';
import 'widgets/categories_gridview_widget.dart';
import 'widgets/featured_img_widget.dart';
import 'widgets/quiz_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FeatureImage(),
              CategoriesGridviewWidget(),
              QuizWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
