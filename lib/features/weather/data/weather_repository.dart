import 'models/current_weather.dart';
import 'models/forecast.dart';
import 'weather_service.dart';

class WeatherRepository {
  final WeatherService _service;
  WeatherRepository(this._service);

  Future<CurrentWeather> getCurrentByCity(String city) async {
    final json = await _service.currentByCity(city);
    return CurrentWeather.fromJson(json);
  }

  Future<Forecast> getForecastByCity(String city) async {
    final json = await _service.forecastByCity(city);
    return Forecast.fromJson(json);
  }
}
