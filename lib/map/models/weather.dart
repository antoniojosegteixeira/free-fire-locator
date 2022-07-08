class Weather {
  final String name;
  final String region;
  final String country;
  final double temperature;
  final double wind;
  final String windDir;
  final double precipitation;
  final double latitude;
  final double longitude;

  Weather({
    required this.name,
    required this.region,
    required this.country,
    required this.temperature,
    required this.wind,
    required this.windDir,
    required this.precipitation,
    required this.latitude,
    required this.longitude,
  });
}