import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/prayer_times/model/prayer_times_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.aladhan.com/v1/")
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    String baseUrl,
  }) = _ApiService;

  @GET("/timings/{date}")
  Future<PrayerTimesResponse> getPrayerTimings({
    @Path("date") required String date,
    @Query("latitude") required double latitude,
    @Query("longitude") required double longitude,
    @Query("method") int? method,
    @Query("key") required String apiKey,
  });
}
