import 'package:flutter/material.dart';
import 'router.dart';
import 'theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WeatherMate',
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
