class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final int windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherList = json['weather'] as List?;
    final description = (weatherList != null && weatherList.isNotEmpty)
        ? weatherList[0]['description']
        : "No description";

    return Weather(
      cityName: json['name'] ?? "Unknown",
      temperature: (json['main']['temp'] as num?)?.toDouble() ?? 0.0,
      description: description,
      humidity: (json['main']['humidity'] as num?)?.toInt() ?? 0,
      windSpeed: (json['wind']['speed'] as num?)?.toInt() ?? 0,
      sunrise: (json['sys']['sunrise'] as num?)?.toInt() ?? 0,
      sunset: (json['sys']['sunset'] as num?)?.toInt() ?? 0,
    );
  }
}
