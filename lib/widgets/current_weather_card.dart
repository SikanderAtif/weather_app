import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Weather _weather;
  const CurrentWeatherCard({super.key, required this._weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Location\n${_weather.cityName},\n${_weather.country}'),
        Text('Temp\n${_weather.temp}'),
        Text('Condition\n${_weather.weatherMain},\n${_weather.weatherDesc}'),
        Text(
          'Humidity: ${_weather.humidity},\nWind Speed: ${_weather.windSpeed}',
        ),
      ],
    );
  }
}
