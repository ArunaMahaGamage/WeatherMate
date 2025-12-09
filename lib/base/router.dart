import 'package:go_router/go_router.dart';
import '../features/home_screen.dart';
import '../features/search_screen.dart';
import '../features/forecast_screen.dart';
import '../features/favorites_screen.dart';
import '../features/alerts_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/search', builder: (_, __) => const SearchScreen()),
    GoRoute(path: '/forecast', builder: (_, __) => const ForecastScreen()),
    GoRoute(path: '/favorites', builder: (_, __) => const FavoritesScreen()),
    GoRoute(path: '/alerts', builder: (_, __) => const AlertsScreen()),
  ],
);
