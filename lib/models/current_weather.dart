class CurrentWeather {
  final String city;
  final double temp;
  final String description;
  final double feelsLike;
  final double wind;
  final int humidity;

  CurrentWeather({
    required this.city,
    required this.temp,
    required this.description,
    required this.feelsLike,
    required this.wind,
    required this.humidity,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      city: json['name'],
      temp: (json['main']['temp'] as num).toDouble(),
      description: (json['weather'][0]['description'] as String),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      wind: (json['wind']['speed'] as num).toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}
