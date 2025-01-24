import 'package:get_it/get_it.dart';
import 'package:ramadan_guide_app/core/services/api_service.dart';
import 'package:ramadan_guide_app/core/services/dio_clinet.dart';

import '../../features/home/di/home_dependecies.dart';
import '../../features/prayer_times/di/prayer_times_dependencies.dart';
import '../services/location_service.dart';

class DependencyInjectionService {
  // get singleton instance
  static final getIt = GetIt.instance;

  static final DependencyInjectionService _singleton = DependencyInjectionService._internal();

  factory DependencyInjectionService() => _singleton;

  DependencyInjectionService._internal();

  static setupDependencies() {
    //?? using GetIt

    // setup dioClient
    getIt.registerLazySingleton(() => DioClient());

    // setup ApiService
    getIt.registerFactory<ApiService>(() => ApiService(getIt<DioClient>().dio));

    // setup Location Service
    getIt.registerLazySingleton<LocationService>(() => LocationService());

    // setup Prayer Times View Dependencies
    PrayerTimesDependencies.setup();

    // setup Home View Dependencies
    HomeDependecies.setup();
  }
}
