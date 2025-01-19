import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class DuaView extends StatelessWidget {
  const DuaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          // itemCount: 6,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            // mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => DuaWigget(
            duaTitle: tr('dua'),
            duaImage: AppImages.cloud,
            duaContent: tr('duaContent'),
          ),
        ),
      ),
    );
  }
}

class DuaWigget extends StatelessWidget {
  const DuaWigget({
    super.key,
    required this.duaTitle,
    required this.duaImage,
    required this.duaContent,
  });

  final String duaTitle;
  final String duaImage;
  final String duaContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            duaImage,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
        SizedBox(height: 3.h),
        CustomText(
          text: tr(duaTitle),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
