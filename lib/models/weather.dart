class Weather {
  final num temp, windSpeed, humidity;
  final String weatherMain, weatherDesc, country, cityName;

  const Weather({
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.weatherMain,
    required this.weatherDesc,
    required this.country,
    required this.cityName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'main': {'temp': num temp, 'humidity': num humidity},
        'wind': {'speed': num windSpeed},
        'weather': [{'main': String weatherMain, 'description': String weatherDesc},...],
        'sys': {'country': String country},
        'name': String cityName,
      } =>
        Weather(
          temp: temp,
          windSpeed: windSpeed,
          humidity: humidity,
          weatherMain: weatherMain,
          weatherDesc: weatherDesc,
          country: country,
          cityName: cityName,
        ),
      _ => throw const FormatException('Failed to load weather information :('),
    };
  }
}
