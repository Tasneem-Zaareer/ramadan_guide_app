import 'package:easy_localization/easy_localization.dart';
import 'package:ramadan_guide_app/core/services/api_service.dart';

import '../../../core/model/location_model.dart';
import '../../../core/services/error_handler_service.dart';
import '../model/prayer_times_response.dart';

class PrayerTimesRepo {
  final ApiService _apiService;
  PrayerTimesRepo(this._apiService);

  Future<void> getPrayerTimes({
    required LocationModel location,
    required Function() onLoading,
    required Function(PrayerTimesResponse response) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      onLoading();
      final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      PrayerTimesResponse response = await _apiService.getPrayerTimings(
        date: formattedDate,
        latitude: location.latitude ?? 40.7128,
        longitude: location.longitude ?? -74.0060,
        apiKey: "46b5e874751bff79ab9abc9c515fa2c1",
      );
      onSuccess(response);
    } catch (e) {
      onError(ErrorHandlerService.handleError(e));
    }
  }
}
