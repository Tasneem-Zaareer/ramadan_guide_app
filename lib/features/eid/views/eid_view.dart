import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class EidView extends StatelessWidget {
  const EidView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eidActivityList = [
      {
        'activityName': tr('eidTakbeerat'),
        'activityImage': AppImages.girlWithLantern,
        'activityColor':
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
      },
      {
        'activityName': tr('eidDua'),
        'activityImage': AppImages.boyPray,
        'activityColor':
            Theme.of(context).colorScheme.secondary.withOpacity(0.6),
      },
      {
        'activityName': tr('sadaqahAlfitr'),
        'activityImage': AppImages.zakat,
        'activityColor':
            Theme.of(context).colorScheme.secondary.withOpacity(0.4),
      },
    ];

    return Scaffold(
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
  });

  final String activityName;
  final Color activityColor;
  final String activityImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }
}
