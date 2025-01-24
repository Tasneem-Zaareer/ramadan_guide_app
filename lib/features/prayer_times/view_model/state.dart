part of 'cubit.dart';

@immutable
sealed class PrayerTimesState {}

final class _PrayerTimesInitial extends PrayerTimesState {}

final class PrayerTimesSuccess extends PrayerTimesState {
  final PrayerTimesResponse prayerTimesResponse;
  PrayerTimesSuccess(this.prayerTimesResponse);
}

final class PrayerTimesError extends PrayerTimesState {
  final String errorMessage;
  PrayerTimesError(this.errorMessage);
}

final class PrayerTimesLoading extends PrayerTimesState {}
