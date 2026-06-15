import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';

class ForecastItem extends StatelessWidget {
  final Forecast _forecast;
  const ForecastItem({super.key, required this._forecast});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            isThreeLine: true,
            title: Text(
              '${DateTime.fromMillisecondsSinceEpoch(_forecast.forecast[0].date.toInt() * 1000)}',
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Condition\n${_forecast.forecast[0].condition}'),
                Text('High Temp\n${_forecast.forecast[0].high}'),
                Text('Low Temp\n${_forecast.forecast[0].low}'),
              ],
            ),
          ),
          ListTile(
            isThreeLine: true,
            title: Text('${DateTime.fromMillisecondsSinceEpoch(_forecast.forecast[1].date.toInt() * 1000)}'),
            subtitle: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Condition\n${_forecast.forecast[1].condition}'),
                Text('High Temp\n${_forecast.forecast[1].high}'),
                Text('Low Temp\n${_forecast.forecast[1].low}'),
              ],
            ),
          ),
          ListTile(
            isThreeLine: true,
            title: Text('${DateTime.fromMillisecondsSinceEpoch(_forecast.forecast[2].date.toInt() * 1000)}'),
            subtitle: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Condition\n${_forecast.forecast[2].condition}'),
                Text('High Temp\n${_forecast.forecast[2].high}'),
                Text('Low Temp\n${_forecast.forecast[2].low}'),
              ],
            ),
          ),
          ListTile(
            isThreeLine: true,
            title: Text('${DateTime.fromMillisecondsSinceEpoch(_forecast.forecast[3].date.toInt() * 1000)}'),
            subtitle: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Condition\n${_forecast.forecast[3].condition}'),
                Text('High Temp\n${_forecast.forecast[3].high}'),
                Text('Low Temp\n${_forecast.forecast[3].low}'),
              ],
            ),
          ),
          ListTile(
            isThreeLine: true,
            title: Text('${DateTime.fromMillisecondsSinceEpoch(_forecast.forecast[4].date.toInt() * 1000)}'),
            subtitle: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Condition\n${_forecast.forecast[4].condition}'),
                Text('High Temp\n${_forecast.forecast[4].high}'),
                Text('Low Temp\n${_forecast.forecast[4].low}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
