import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<Weather> fetchWeather() async {
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Lahore&appid=ff0ca65da1a45b1cae07a9b5e069e52f&units=metric',
      ),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw ServiceException('City not found, no internet', 5);
    }
  }
}

class ServiceException implements Exception {
  final String message;
  final int durationSeconds;

  ServiceException(this.message, this.durationSeconds);
}