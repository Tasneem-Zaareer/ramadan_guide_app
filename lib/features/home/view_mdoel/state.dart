part of 'cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class GoToPrayerTimesViewState extends HomeState {
  final LocationModel locationModel;

  GoToPrayerTimesViewState({required this.locationModel});
}

final class UserNotEnableLocationState extends HomeState {
  final String message;

  UserNotEnableLocationState({required this.message});
}
