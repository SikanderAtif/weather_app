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

    num temp = (json['main'])['temp'];
    num windSpeed = (json['wind'])['speed'];
    num humidity = (json['main'])['humidity'];
    String main = (json['weather'][0])['main'];
    String desc = (json['weather'][0])['description'];
    String country = (json['sys'])['country'];
    String name = json['name'];

    return Weather(temp: temp, windSpeed: windSpeed, humidity: humidity, weatherMain: main, weatherDesc: desc, country: country, cityName: name);
  }
}
