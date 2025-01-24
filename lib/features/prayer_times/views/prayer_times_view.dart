import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/di/dependency_injection_service.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/model/location_model.dart';
import '../view_model/cubit.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key, required this.locationModel});

  final LocationModel? locationModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjectionService.getIt<PrayerTimesCubit>()
        ..getPrayerTimes(
          locationModel ?? LocationModel(),
        ),
      child: Scaffold(
        body: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            if (state is PrayerTimesError) {
              return Center(
                child: Text(
                  state.errorMessage,
                ),
              );
            } else if (state is PrayerTimesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  FeatureImagePrayerTime(),
                  TodayRamadanTimeWidget(),
                  PrayerTimeList(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class FeatureImagePrayerTime extends StatelessWidget {
  const FeatureImagePrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Image.asset(
            AppImages.featureMosque,
            fit: BoxFit.cover,
            width: double.infinity,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 50.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TodayRamadanTimeWidget extends StatelessWidget {
  const TodayRamadanTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TodayRamadanTimeItem(
          title: tr('sahoor'),
          time: '5:00 AM',
          icon: (Icons.sunny),
        ),
        TodayRamadanTimeItem(
          title: tr('iftar'),
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  CustomText(
                    text: time,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PrayerTimeList extends StatelessWidget {
  const PrayerTimeList({super.key});

  static final List<Map<String, dynamic>> prayerTimesList = [
    {'name': tr('fajr'), 'time': '5:00 AM', 'icon': Icons.circle},
    {'name': tr('dhuhr'), 'time': '12:00 PM', 'icon': Icons.sunny},
    {'name': tr('asr'), 'time': '3:00 PM', 'icon': Icons.wb_sunny},
    {'name': tr('maghrib'), 'time': '5:00 PM', 'icon': Icons.cloud},
    {'name': tr('isha'), 'time': '6:00 PM', 'icon': Icons.bedtime},
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PrayerTimesCubit>();
    final state = cubit.state;
    if (state is PrayerTimesSuccess) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              PrayerTimeItem(
                prayerName: state.prayerTimesResponse.data.timings.fajr,
                prayertime: state.prayerTimesResponse.data.timings.fajr,
                icoon: Icons.abc,
              ),
            ],
          ));
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icoon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 5),
          CustomText(
            text: prayerName,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const Spacer(),
          CustomText(
            text: prayertime,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
