class ForecastHelper {
  final num date, high, low;
  final String condition;

  const ForecastHelper({
    required this.date,
    required this.high,
    required this.low,
    required this.condition,
  });
}

class Forecast {
  final List<ForecastHelper> forecast;

  const Forecast({required this.forecast});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'list': List items} => Forecast(
        forecast: [
          for (final item in items)
            if (item case {
              'dt': num date,
              'main': {'temp_min': num low, 'temp_max': num high},
              'weather': [{'main': String condition}, ...],
            })
              ForecastHelper(
                date: date,
                high: high,
                low: low,
                condition: condition,
              ),
        ],
      ),

      _ => throw const FormatException('Failed to load forecast data.'),
    };
  }
}
