class ForecastPoint {
  final DateTime time;
  final double temp;
  final String icon;
  ForecastPoint({required this.time, required this.temp, required this.icon});

  factory ForecastPoint.fromJson(Map<String, dynamic> json) {
    return ForecastPoint(
      time: DateTime.parse(json['dt_txt']),
      temp: (json['main']['temp'] as num).toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}

class Forecast {
  final String city;
  final List<ForecastPoint> points;
  Forecast({required this.city, required this.points});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final cityName = json['city']['name'];
    final list = (json['list'] as List).map((e) => ForecastPoint.fromJson(e)).toList();
    return Forecast(city: cityName, points: list);
  }
}
