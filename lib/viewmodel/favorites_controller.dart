import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/favorites_repository.dart';

/// State class for Favorites
class FavoritesState {
  final List<String> favorites;
  final bool loading;
  final String? error;

  FavoritesState({
    this.favorites = const [],
    this.loading = false,
    this.error,
  });

  FavoritesState copyWith({
    List<String>? favorites,
    bool? loading,
    String? error,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

/// Controller (ViewModel) for Favorites
class FavoritesController extends StateNotifier<FavoritesState> {
  final FavoritesRepository repo;

  FavoritesController(this.repo) : super(FavoritesState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = state.copyWith(loading: true);
    try {
      final list = await repo.list();
      state = state.copyWith(favorites: list, loading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), loading: false);
    }
  }

  Future<void> addFavorite(String city) async {
    await repo.add(city);
    await loadFavorites();
  }

  Future<void> updateFavorite(int index, String newCity) async {
    await repo.update(index, newCity);
    await loadFavorites();
  }

  Future<void> removeFavoriteAt(int index) async {
    await repo.removeAt(index);
    await loadFavorites();
  }

  Future<void> clearFavorites() async {
    await repo.clear();
    await loadFavorites();
  }
}

/// Riverpod provider for FavoritesController
final favoritesControllerProvider = StateNotifierProvider<FavoritesController, FavoritesState>((ref) {
  final repo = FavoritesRepository();
  return FavoritesController(repo);
});
