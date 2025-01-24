import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'package:ramadan_guide_app/features/dua/view_models/duas.dart';
import 'package:ramadan_guide_app/features/dua/views/dua_content_view.dart';

class DuaView extends StatelessWidget {
  const DuaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GridView.builder(
          itemCount: duasList.length,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            // mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => DuaWigget(
            duaTitle: duasList[index]['name'] ?? tr('dua'),
            duaImage: AppImages.featureMosque,
            duaIcon: getIconFromString(duasList[index]['icon'] ?? 'Icons.warning'),
            arabicTranslation: duasList[index]['arabic'] ?? tr('dua'),
            englishTranslation: duasList[index]['translation'] ?? tr('dua'),
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
    required this.duaIcon,
    required this.arabicTranslation,
    required this.englishTranslation,
  });

  final String duaTitle;
  final String duaImage;
  final Icon duaIcon;
  final String arabicTranslation;
  final String englishTranslation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DuaContentView(
              duaTitle: duaTitle,
              duaImage: duaImage,
              arabicTranslation: arabicTranslation,
              englishTranslation: englishTranslation,
            ),
          ),
        )
      },
      child: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.1,
              child: duaIcon,
            ),
            // child: Image.asset(
            //   ,
            //   fit: BoxFit.contain,
            //   height: MediaQuery.of(context).size.height * 0.1,
            // ),
          ),
          SizedBox(height: 3.h),
          CustomText(
            text: tr(duaTitle),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
