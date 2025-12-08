import 'package:flutter/material.dart';
import '../data/models/current_weather.dart';

class WeatherCard extends StatelessWidget {
  final CurrentWeather weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(weather.city, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('${weather.temp.toStringAsFixed(1)}°C • ${weather.description}'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Feels: ${weather.feelsLike.toStringAsFixed(1)}°C'),
                Text('Wind: ${weather.wind} m/s'),
                Text('Humidity: ${weather.humidity}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
