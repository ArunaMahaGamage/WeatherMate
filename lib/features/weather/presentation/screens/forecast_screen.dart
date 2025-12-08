import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/forecast_chart.dart';
import '../controllers/weather_controller.dart';

class ForecastScreen extends ConsumerWidget {
  const ForecastScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherControllerProvider);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: state.forecast == null
            ? const Text('Load a city on Home to view forecast.')
            : ForecastChart(forecast: state.forecast!),
      ),
    );
  }
}
