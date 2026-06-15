import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/forecast_item.dart';

class WeatherScreen extends StatefulWidget {
  final Weather _weather;
  final Forecast _forecast;
  const WeatherScreen({super.key, required this._weather, required this._forecast});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget._weather.cityName} Weather'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Weather:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 22),
            CurrentWeatherCard(weather: widget._weather),
            SizedBox(height: 22),
            Text(
              '5-Day Forecast:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 22),
            ForecastItem(forecast: widget._forecast),
          ],
        ),
      ),
    );
  }
}
