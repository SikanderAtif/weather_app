import 'package:flutter/material.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(22),
      child: Text('Card'),
    );
  }
}