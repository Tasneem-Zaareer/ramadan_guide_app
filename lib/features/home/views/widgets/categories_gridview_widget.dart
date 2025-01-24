import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ramadan_guide_app/features/laylat_alqadr/laylat_alqadr_view.dart';
import 'package:ramadan_guide_app/features/eid/views/eid_view.dart';
import '../../../../core/constants/app_images.dart';
import '../../../dua/views/dua_view.dart';
import '../../view_mdoel/cubit.dart';
import 'category_widget.dart';

class CategoriesGridviewWidget extends StatelessWidget {
  const CategoriesGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final List<Map<String, dynamic>> categoriesList = [
      {
        'title': tr('prayerTimes'),
        'image': AppImages.mosqueSmall,
        //'view': const PrayerTimeView(),
        'color': Colors.amber.shade100
      },
      {
        'title': tr('laylatAlQadr'),
        'image': AppImages.womenPray,
        'view': const LaylatAlQadrView(),
        'color': Colors.redAccent.shade100
      },
      {'title': tr('dua'), 'image': AppImages.dua, 'view': const DuaView(), 'color': Colors.blue.shade100},
      {'title': tr('eid'), 'image': AppImages.twoMen, 'view': const EidView(), 'color': Colors.greenAccent.shade100},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoriesList.length,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => Category(
        categoryName: categoriesList[index]['title'],
        categoryImage: categoriesList[index]['image'],
        onTap: () async {
          if (categoriesList[index]['title'] == tr('prayerTimes')) {
            cubit.checkLocationAndGetCurrentLocation();
          } else {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: categoriesList[index]['view'],
              withNavBar: false, // Hides the bottom navigation bar
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => categoriesList[index]['view'],
          //   ),
          // );
        },
        categoryColor: categoriesList[index]['color'],
      ),
    );
  }
}
