import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/constants/app_images.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class LaylatAlQadrView extends StatelessWidget {
  const LaylatAlQadrView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> laylatAlQadrInfo = [
      {
        'title': tr('Significance'),
        'text': tr(
            'Laylat al-Qadr, or the Night of Decree, is one of the holiest nights in the Islamic calendar. It falls during the last 10 days of Ramadan, most commonly believed to be on the 27th night, though it could occur on any of the odd-numbered nights. The Quran refers to this night as better than a thousand months, emphasizing its immense spiritual reward and significance.'),
      },
      {
        'title': tr('Quranic Reference'),
        'text': tr(
            'Surah Al-Qadr (Chapter 97) highlights the importance of Laylat al-Qadr:\n"Indeed, We sent the Quran down during the Night of Decree. And what can make you know what is the Night of Decree? The Night of Decree is better than a thousand months. The angels and the Spirit descend therein by permission of their Lord for every matter. Peace it is until the emergence of dawn." (Quran 97:1-5)'),
      },
      {
        'title': tr('Virtues of Laylat al-Qadr'),
        'text': tr(
            'Forgiveness of Sins: Prophet Muhammad (peace be upon him) said: Whoever prays during the Night of Decree with faith and hoping for its reward will have all their previous sins forgiven. (Sahih Bukhari, Sahih Muslim)\nA Night of Blessings and Mercy: On this night, angels descend to the Earth, spreading peace, blessings, and mercy from Allah.'),
      },
      {
        'title': tr('Recommended Acts of Worship'),
        'text': tr(
            'Tahajjud (Night Prayer): Engage in voluntary prayers during the night'),
      },
      {
        'title': tr('How to Seek Laylat al-Qadr'),
        'text': tr(
            'Focus on worship during the last 10 nights of Ramadan, especially the odd nights.\nPerform Itikaf (spiritual retreat) in a mosque if possible.\nStrive to maximize devotion by balancing prayer, supplication, and acts of kindness.'),
      },
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image.asset(AppImages.helloRamadan),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: laylatAlQadrInfo.length,
                itemBuilder: (context, index) {
                  return LaylatAlqadrWidget(
                    infoTitle: laylatAlQadrInfo[index]['title']!,
                    activityColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.8),
                    activityImage: AppImages.lantern,
                  );
                  // return LaylatAlqadrWidget(
                  //   title: laylatAlQadrInfo[index]['title']!,
                  //   text: laylatAlQadrInfo[index]['text']!,
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LaylatAlqadrWidget extends StatelessWidget {
  const LaylatAlqadrWidget({
    super.key,
    required this.infoTitle,
    required this.activityColor,
    required this.activityImage,
  });

  final String infoTitle;
  final Color activityColor;
  final String activityImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 10),
      padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 0.h),
      height: MediaQuery.of(context).size.height * 0.19,
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
          Center(
            child: CustomText(
              text: infoTitle,
            ),
          ),
        ],
      ),
    );
  }
}

class LaylatAlqadrInfoDetails extends StatelessWidget {
  const LaylatAlqadrInfoDetails({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          SizedBox(height: 5.h),
          CustomText(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
