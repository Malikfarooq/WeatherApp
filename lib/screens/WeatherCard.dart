import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  String formatTime(int timeStamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                weather.description.contains('rain')
                    ? 'assets/rain.json'
                    : weather.description.contains("clear")
                    ? 'assets/sunny.json'
                    : 'assets/cloudy.json',
                height: 150,
                width: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.wb_sunny, size: 100, color: Colors.yellow);
                },
              ),
              Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${weather.temperature.toStringAsFixed(1)}°C",
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Text(
                weather.description,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.water_drop, color: Colors.blueAccent),
                      const Text("Humidity", style: TextStyle(color: Colors.white70)),
                      Text(
                        "${weather.humidity}%",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.air, color: Colors.white),
                      const Text("Wind", style: TextStyle(color: Colors.white70)),
                      Text(
                        "${weather.windSpeed} m/s",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.wb_sunny_outlined, color: Colors.orange),
                      const Text('Sunrise', style: TextStyle(color: Colors.white70)),
                      Text(
                        formatTime(weather.sunrise),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.night_shelter_outlined,
                          color: Colors.purpleAccent),
                      const Text('Sunset', style: TextStyle(color: Colors.white70)),
                      Text(
                        formatTime(weather.sunset),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
