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
    List<ForecastHelper> result = [];
    dynamic list = json['list'];

    for (final item in list) {
      num date = item['dt'];
      Map<String, dynamic> main = item['main'];
      num minTemp = main['temp_min'];
      num maxTemp = main['temp_max'];
      Map<String, dynamic> weather = (item['weather'][0]);
      String weatherMain = weather['main'];

      result.add(
        ForecastHelper(
          date: date,
          high: maxTemp,
          low: minTemp,
          condition: weatherMain,
        ),
      );
    }

    return Forecast(forecast: result);
  }
}
