import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/features/prayer_times/views/prayer_times_view.dart';

import '../../../../core/constants/app_images.dart';
import 'category_widget.dart';

class CategoriesGridviewWidget extends StatelessWidget {
  const CategoriesGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categoriesList = [
      {
        'title': tr('prayer Times'),
        'image': AppImages.girlWithLantern,
        'view': const PrayerTimeView(),
        'color': Colors.amber.shade100
      },
      {
        'title': tr('alqaderNight'),
        'image': AppImages.boyWithLantern,
        'view': const PrayerTimeView(),
        'color': Colors.redAccent.shade100
      },
      {
        'title': tr('dua'),
        'image': AppImages.boyPray,
        'view': const PrayerTimeView(),
        'color': Colors.blue.shade100
      },
      {
        'title': tr('umrah'),
        'image': AppImages.girlWithMoon,
        'view': const PrayerTimeView(),
        'color': Colors.greenAccent.shade100
      },
      {
        'title': tr('Eid'),
        'image': AppImages.eid,
        'view': const PrayerTimeView(),
        'color': Colors.greenAccent.shade100
      },
      {
        'title': tr('zakat'),
        'image': AppImages.zakat,
        'view': const PrayerTimeView(),
        'color': Colors.greenAccent.shade100
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoriesList.length,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 3 / 1.4,
      ),
      itemBuilder: (context, index) => Category(
        categoryName: categoriesList[index]['title'],
        categoryImage: categoriesList[index]['image'],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => categoriesList[index]['view'],
            ),
          );
        },
        categoryColor: categoriesList[index]['color'],
      ),
    );
  }
}
