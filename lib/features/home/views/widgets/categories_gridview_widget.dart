import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/features/home/views/home_view.dart';
import 'package:ramadan_guide_app/features/prayer_times/views/prayer_times_view.dart';

import '../../../../core/constants/app_images.dart';
import 'category_widget.dart';

class CategoriesGridviewWidget extends StatelessWidget {
  const CategoriesGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List categoriesList = [
      'Prayer Times',
      'Iftar',
      'Sahoor',
      'Quran',
      'Calender',
      'Umrah',
    ];
    List categoriesImagesList = [
      AppImages.mosque2,
      AppImages.iftar,
      AppImages.sahoor,
      AppImages.quran,
      AppImages.iftar,
      AppImages.umrah,
    ];

    List categoriesView = [
      PrayerTimeView(),
      PrayerTimeView(),
      PrayerTimeView(),
      PrayerTimeView(),
      PrayerTimeView(),
      PrayerTimeView(),
    ];
    return GridView.builder(
      shrinkWrap: true,
      // ignore: prefer_const_constructors
      physics: NeverScrollableScrollPhysics(),
      itemCount: categoriesList.length,
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 3 / 1.6,
      ),
      itemBuilder: (context, index) => Category(
        categoryName: categoriesList[index],
        categoryImage: categoriesImagesList[index],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => categoriesView[index],
            ),
          );
        },
      ),
    );
  }
}
