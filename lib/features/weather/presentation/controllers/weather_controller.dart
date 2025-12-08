import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/weather_repository.dart';
import '../../data/models/current_weather.dart';
import '../../data/models/forecast.dart';
import '../../../favorites/data/favorites_repository.dart';
import '../../data/weather_service.dart';

class WeatherState {
  final CurrentWeather? current;
  final Forecast? forecast;
  final bool loading;
  final String? error;
  final List<String> favorites;

  WeatherState({
    this.current,
    this.forecast,
    this.loading = false,
    this.error,
    this.favorites = const [],
  });

  WeatherState copyWith({
    CurrentWeather? current,
    Forecast? forecast,
    bool? loading,
    String? error,
    List<String>? favorites,
  }) {
    return WeatherState(
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
      loading: loading ?? this.loading,
      error: error,
      favorites: favorites ?? this.favorites,
    );
  }
}

class WeatherController extends StateNotifier<WeatherState> {
  final WeatherRepository repo;
  final FavoritesRepository favRepo;

  WeatherController(this.repo, this.favRepo) : super(WeatherState());

  Future<void> loadCity(String city) async {
    state = state.copyWith(loading: true, error: null);
    try {
      final current = await repo.getCurrentByCity(city);
      final forecast = await repo.getForecastByCity(city);
      final favorites = await favRepo.list();
      state = state.copyWith(current: current, forecast: forecast, favorites: favorites, loading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), loading: false);
    }
  }

  Future<void> addFavorite(String city) async {
    await favRepo.add(city);
    state = state.copyWith(favorites: await favRepo.list());
  }

  Future<void> removeFavoriteAt(int index) async {
    await favRepo.removeAt(index);
    state = state.copyWith(favorites: await favRepo.list());
  }
}

final weatherControllerProvider = StateNotifierProvider<WeatherController, WeatherState>((ref) {
  final repo = WeatherRepository(WeatherService());
  final favRepo = FavoritesRepository();
  return WeatherController(repo, favRepo);
});
