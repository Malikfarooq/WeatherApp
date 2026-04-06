import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherService{
  final String Api_key="18a5f71b711499ae00199d72dd6241f3";

  Future <Weather> fetchWeather(String cityName) async {
    final String URL="https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$Api_key&units=metric";
    try {
      final response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        return Weather.fromJson(json.decode(response.body));
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print("Network/Parsing Error: $e");
      rethrow;
    }
  }

}