import 'dart:developer';

import 'package:geolocator/geolocator.dart';

import '../model/location_model.dart';

class LocationService {
  // Check if location services are enabled on the device
  Future<bool> isLocationServiceEnabled() async {
    // Returns true if location services are enabled, otherwise false
    return await Geolocator.isLocationServiceEnabled();
  }

  // Check the current permission status and request permissions if necessary
  Future<LocationPermission> checkAndRequestPermission() async {
    // Check the current permission status
    LocationPermission permission = await Geolocator.checkPermission();

    // If permissions are denied, request them
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Return the updated permission status (denied, granted, etc.)
    return permission;
  }

  // Retrieve the current location of the user
  Future<Position?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        // If services are disabled, throw an exception with a descriptive error
        throw Exception('Location services are disabled. Please enable them in settings.');
      }

      // Check and request location permissions
      LocationPermission permission = await checkAndRequestPermission();
      if (permission == LocationPermission.denied) {
        // Throw an error if the user denies permissions
        throw Exception('Location permission denied by the user.');
      }

      if (permission == LocationPermission.deniedForever) {
        // Handle the case where permissions are permanently denied
        throw Exception('Location permissions are permanently denied. Please enable permissions manually in settings.');
      }

      // Retrieve the current position with specific location settings
      return await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high, // Request high accuracy for precise location
          distanceFilter: 10, // Minimum distance (in meters) between location updates
        ),
      );
    } catch (e) {
      // Log and return null if an error occurs while getting the location
      log('Error retrieving location: $e');
      return null;
    }
  }

  Future<LocationModel?> getCheckLocationAndGetCurrentLocation() async {
    LocationModel? locationModel;
    // if location service is enabled get the current location else permission request and if user enables location service then get the current location
    if (await isLocationServiceEnabled()) {
      await getCurrentLocation().then((value) {
        log('latitude is ${value?.latitude} longitude is ${value?.longitude}');
        locationModel = LocationModel(
          latitude: value?.latitude,
          longitude: value?.longitude,
        );
      });
    } else {
      await checkAndRequestPermission();
      if (await isLocationServiceEnabled()) {
        await getCurrentLocation().then((value) {
          locationModel = LocationModel(
            latitude: value?.latitude,
            longitude: value?.longitude,
          );
          log('latitude is ${value?.latitude} longitude is ${value?.longitude}');
        });
      }
    }
    return locationModel;
  }
}
