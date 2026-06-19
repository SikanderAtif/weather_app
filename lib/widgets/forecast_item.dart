import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';

class ForecastItem extends StatelessWidget {
  final Forecast _forecast;
  const ForecastItem({super.key, required this._forecast});

  String _getDate(int index) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      _forecast.forecast[index].date.toInt() * 1000,
    );
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();

    return '$year-$month-$day';
  }

  String _getTime(int index) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      _forecast.forecast[index].date.toInt() * 1000,
    );
    String hour = date.hour.toString();
    String min = date.minute.toString();
    String sec = date.second.toString();

    return '$hour:$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          for (int i = 0; i < _forecast.forecast.length;)
            ListTile(
              title: Text(
                _getDate(i),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: SizedBox(
                height: 100, 
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int j = i; i < _forecast.forecast.length && _getDate(i) == _getDate(j); i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 32.0, top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getTime(i),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Condition: ${_forecast.forecast[i].condition}'),
                            Text('High: ${_forecast.forecast[i].high}'),
                            Text('Low: ${_forecast.forecast[i].low}'),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}