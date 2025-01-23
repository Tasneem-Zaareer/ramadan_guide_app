import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'package:ramadan_guide_app/features/eid/views/alfitr_sadaqah_view.dart';
import 'package:ramadan_guide_app/features/eid/views/eid_dua_view.dart';
import 'package:ramadan_guide_app/features/eid/views/eid_takbeerat_view.dart';

class EidView extends StatelessWidget {
  const EidView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eidActivityList = [
      {
        'activityName': tr('eidTakbeerat'),
        'view': const EidTakbeeratView(),
        'activityImage': AppImages.whiteMosqueWithoutClouds,
        'activityColor':
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
      },
      {
        'activityName': tr('eidDua'),
        'view': const EidDuaView(),
        'activityImage': AppImages.dua,
        'activityColor':
            Theme.of(context).colorScheme.secondary.withOpacity(0.6),
      },
      {
        'activityName': tr('sadaqahAlfitr'),
        'view': const SadaqahAlFitrView(),
        'activityImage': AppImages.zakat,
        'activityColor':
            Theme.of(context).colorScheme.secondary.withOpacity(0.4),
      },
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Image.asset(AppImages.quiz),
          Expanded(
            child: ListView.builder(
              itemCount: eidActivityList.length,
              itemBuilder: (context, index) => EidActivityWidget(
                activityName: eidActivityList[index]['activityName'],
                activityImage: eidActivityList[index]['activityImage'],
                activityColor: eidActivityList[index]['activityColor'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => eidActivityList[index]['view'],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EidActivityWidget extends StatelessWidget {
  const EidActivityWidget({
    super.key,
    required this.activityName,
    required this.activityColor,
    required this.activityImage,
    required this.onTap,
  });

  final String activityName;
  final Color activityColor;
  final String activityImage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 10),
        padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: activityColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.asset(
                activityImage,
                height: MediaQuery.of(context).size.height * 0.16,
              ),
            ),
            CustomText(
              text: activityName,
            ),
          ],
        ),
      ),
    );
  }
}
