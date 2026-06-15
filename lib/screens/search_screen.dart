import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/loading_state.dart';
import 'package:weather_app/widgets/error_state.dart';
import 'package:weather_app/widgets/current_weather_card.dart';

class SearchScreen extends StatefulWidget {
  final String title;
  const SearchScreen({super.key, required this.title});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String> _searchQueryNotifier = ValueNotifier<String>('');

  void _search() {
    String city = _controller.text.trim();
    if (city.isEmpty) return;
    print("City: $city");

    _searchQueryNotifier.value = city;
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchQueryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) {
                _search();
              },
            ),
            SizedBox(height: 12),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _search,
              alignment: AlignmentGeometry.center,
            ),
            SizedBox(height: 24),
            Expanded(
              child: ValueListenableBuilder<String>(
                valueListenable: _searchQueryNotifier,
                builder: (context, query, _) {
                  if (query.isEmpty) {
                    return const Text('Start typing to search for a city.');
                  }

                  return FutureBuilder<Weather>(
                    future: WeatherService.fetchWeather(query),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingState();
                      }

                      if (snapshot.hasError) {
                        return ErrorState();
                      }

                      if (snapshot.hasData) {
                        return CurrentWeatherCard();
                      }

                      return SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
