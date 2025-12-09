import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../../models/forecast.dart';

class ForecastChart extends StatelessWidget {
  final Forecast forecast;
  const ForecastChart({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final data = forecast.points.take(8).toList(); // next ~24h, 3-hourly
    return SfCartesianChart(
      title: ChartTitle(text: 'Next 24h (${forecast.city})'),
      primaryXAxis: CategoryAxis(),
      series: [
        LineSeries<ForecastPoint, String>(
          dataSource: data,
          xValueMapper: (p, _) => DateFormat.Hm().format(p.time),
          yValueMapper: (p, _) => p.temp,
          name: 'Temp °C',
          markerSettings: const MarkerSettings(isVisible: true),
        )
      ],
    );
  }
}
