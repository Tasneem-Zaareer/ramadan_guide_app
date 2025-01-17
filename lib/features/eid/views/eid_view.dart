import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class EidView extends StatelessWidget {
  const EidView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eidActivityList = [
      {
        'activityName': tr('eidTakbeerat'),
        'activityImage': '',
        'activityColor': Theme.of(context).colorScheme.primary,
      },
      {
        'activityName': tr('eidTakbeerat'),
        'activityImage': '',
        'activityColor': Theme.of(context).colorScheme.primary,
      },
      {
        'activityName': tr('eidTakbeerat'),
        'activityImage': '',
        'activityColor': Theme.of(context).colorScheme.primary,
      },
      {
        'activityName': tr('eidTakbeerat'),
        'activityImage': '',
        'activityColor': Theme.of(context).colorScheme.primary,
      },
      {
        'activityName': tr('eidTakbeerat'),
        'activityImage': '',
        'activityColor': Theme.of(context).colorScheme.primary,
      },
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => EidActivityWidget(
          activityName: eidActivityList[index]['activityName'],
          activityImage: '',
          activityColor: Theme.of(context).colorScheme.primary,
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: CustomText(
        text: activityName,
      ),
    );
  }
}
