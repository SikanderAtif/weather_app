import 'package:weather_app/constants/api_constants.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class WeatherService {
  Future<Weather> fetchWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${ApiConstants.openWeatherMapKey}&units=metric',
        ),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      } else {
        throw ServiceException('City not found', 5);
      }
    } on SocketException catch (e) {
      throw SocketException('No Internet Connection: $e');
    }
  }

  Future<Forecast> fetchForecast(String city) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=${ApiConstants.openWeatherMapKey}&units=metric',
        ),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return Forecast.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      } else {
        throw ServiceException('City not found', 5);
      }
    } on SocketException catch (e) {
      throw SocketException('No Internet Connection: $e');
    }
  }
}

class ServiceException implements Exception {
  final String message;
  final int durationSeconds;

  ServiceException(this.message, this.durationSeconds);
}
