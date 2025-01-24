import 'package:ramadan_guide_app/features/prayer_times/view_model/cubit.dart';

import '../../../core/di/dependency_injection_service.dart';
import '../repo/prayer_times_repo.dart';

class PrayerTimesDependencies {
  // lazy Singletons
  PrayerTimesDependencies._();
  // setup dependencies
  static setup() {
    // setup dependencies
    final getIt = DependencyInjectionService.getIt;

    getIt.registerFactory<PrayerTimesRepo>(() => PrayerTimesRepo(getIt()));

    // setup cubit
    getIt.registerLazySingleton<PrayerTimesCubit>(() => PrayerTimesCubit(getIt()));
  }
}
