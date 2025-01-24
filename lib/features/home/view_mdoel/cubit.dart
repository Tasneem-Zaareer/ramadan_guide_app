import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_guide_app/core/constants/app_messages.dart';
import 'package:ramadan_guide_app/core/services/location_service.dart';

import '../../../core/model/location_model.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.locationService) : super(HomeInitial());
  final LocationService locationService;

  Future<void> checkLocationAndGetCurrentLocation() async {
    final locationModel = await locationService.getCheckLocationAndGetCurrentLocation();

    if (locationModel?.latitude != null) {
      emit(GoToPrayerTimesViewState(locationModel: locationModel!));
    } else {
      emit(UserNotEnableLocationState(message: AppMessages.userNotEnabledLocation));
    }
  }
}
