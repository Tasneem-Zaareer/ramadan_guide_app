import '../../../core/di/dependency_injection_service.dart';
import '../view_mdoel/cubit.dart';

class HomeDependecies {
  //
  HomeDependecies._();
  //
  static void setup() {
    final getIt = DependencyInjectionService.getIt;
    // setup home cubit
    getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  }
}
