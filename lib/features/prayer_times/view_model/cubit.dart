import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/location_model.dart';
import '../model/prayer_times_response.dart';
import '../repo/prayer_times_repo.dart';

part 'state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit(this._prayerTimesRepo) : super(_PrayerTimesInitial());
  final PrayerTimesRepo _prayerTimesRepo;

  Future<void> getPrayerTimes(LocationModel location) async {
    await _prayerTimesRepo.getPrayerTimes(
      location: location,
      onLoading: () => emit(PrayerTimesLoading()),
      onSuccess: (PrayerTimesResponse prayerTimesResponse) => emit(PrayerTimesSuccess(prayerTimesResponse)),
      onError: (String message) => emit(PrayerTimesError(message)),
    );
  }
}
