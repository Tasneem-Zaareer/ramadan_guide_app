class ParyerTimingsRequest {
  final String? date;
  final double? latitude;
  final double? longitude;
  final int? method;
  final String? apiKey;

  ParyerTimingsRequest({
    this.date,
    this.latitude,
    this.longitude,
    this.method,
    this.apiKey,
  });

  /// Convert the request model into a map of query parameters
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'method': method,
      'key': apiKey,
    };
  }
}
