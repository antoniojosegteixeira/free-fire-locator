class MapInfoResponse {
  final double latitude;
  final double longitude;
  final String satelliteName;
  final String date;
  MapInfoResponse({
    required this.latitude,
    required this.longitude,
    required this.satelliteName,
    required this.date,
  });

  factory MapInfoResponse.fromCsv(dynamic csv) {
    return MapInfoResponse(
      latitude: csv[0],
      longitude: csv[1],
      satelliteName: csv[2],
      date: csv[3],
    );
  }
}
