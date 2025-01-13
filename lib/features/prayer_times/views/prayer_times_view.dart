import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

import '../../../core/constants/app_images.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          FeatureImagePrayerTime(),
          TodayRamadanTimeWidget(),
          PrayerTimeList(),
        ],
      ),
    );
  }
}

class FeatureImagePrayerTime extends StatelessWidget {
  const FeatureImagePrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
      ),
      child: Image.asset(
        AppImages.umrah,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}

class TodayRamadanTimeWidget extends StatelessWidget {
  const TodayRamadanTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TodayRamadanTimeItem(
          title: 'Sahoor',
          time: '5:00 AM',
          icon: (Icons.sunny),
        ),
        TodayRamadanTimeItem(
          title: 'Iftar',
          time: '6:30 PM',
          icon: (Icons.cloud),
        ),
      ],
    );
  }
}

class TodayRamadanTimeItem extends StatelessWidget {
  const TodayRamadanTimeItem({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
  });
  final String title;
  final String time;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: title),
                CustomText(text: time),
              ],
            ),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}

class PrayerTimeList extends StatelessWidget {
  const PrayerTimeList({super.key});
  // static final List prayerTimesList = [
  //   ('Fajr', '5:00 AM', Icons.sunny),
  //   ('Dhuhr', '12:00 PM', Icons.cloud),
  //   ('Asr', '3:00 PM', Icons.cloud),
  //   ('Maghrib', '5:00 PM', Icons.cloud),
  //   ('Isha', '6:00 PM', Icons.cloud),
  // ];

  static final List<Map<String, dynamic>> prayerTimesList = [
    {'name': 'Fajr', 'time': '5:00 AM', 'icon': Icons.sunny},
    {'name': 'Dhuhr', 'time': '12:00 PM', 'icon': Icons.cloud},
    {'name': 'Asr', 'time': '3:00 PM', 'icon': Icons.cloud},
    {'name': 'Maghrib', 'time': '5:00 PM', 'icon': Icons.cloud},
    {'name': 'Isha', 'time': '6:00 PM', 'icon': Icons.cloud},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return PrayerTimeItem(
            prayerName: prayerTimesList[index]['name'],
            prayertime: prayerTimesList[index]['time'],
            icoon: prayerTimesList[index]['icon'],
          );
        },
      ),
    );
  }
}

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({
    super.key,
    required this.prayerName,
    required this.prayertime,
    required this.icoon,
  });

  final String prayerName;
  final String prayertime;
  final IconData icoon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown.shade100,
      ),
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icoon),
          SizedBox(width: 5),
          CustomText(text: prayerName),
          Spacer(),
          CustomText(text: prayertime),
        ],
      ),
    );
  }
}
