import 'package:go_router/go_router.dart';
import '../features/weather/presentation/screens/home_screen.dart';
import '../features/weather/presentation/screens/search_screen.dart';
import '../features/weather/presentation/screens/forecast_screen.dart';
import '../features/weather/presentation/screens/favorites_screen.dart';
import '../features/weather/presentation/screens/alerts_screen.dart';

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
