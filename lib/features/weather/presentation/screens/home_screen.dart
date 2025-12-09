import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/weather_controller.dart';
import '../../widgets/weather_card.dart';
import '../../widgets/forecast_chart.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Future.microtask(() => ref.read(weatherControllerProvider.notifier).loadCity(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weatherControllerProvider);
    if (state.current == null) {
      _controller.text = 'Colombo';
      Future.microtask(() => ref.read(weatherControllerProvider.notifier).loadCity(_controller.text));
    } else {
      _controller.text = state.current!.city;
    }
    return WillPopScope(
      onWillPop: () async {
        // Prevent app exit on back press
        // Option 1: Show confirmation dialog
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you really want to exit?'),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('No')),
              TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Yes')),
            ],
          ),
        );
        return shouldExit ?? false;

      },
      child: Scaffold(
        appBar: AppBar(title: const Text('WeatherMate')),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(child: Text('Menu')),
              ListTile(title: const Text('Search'), onTap: () => context.go('/search')),
              ListTile(title: const Text('Forecast'), onTap: () => context.go('/forecast')),
              ListTile(title: const Text('Favorites'), onTap: () => context.go('/favorites')),
              ListTile(title: const Text('Alerts'), onTap: () => context.go('/alerts')),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'City', prefixIcon: Icon(Icons.search)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => ref.read(weatherControllerProvider.notifier).loadCity(_controller.text),
                  child: const Text('Search'),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: state.current == null
                      ? null
                      : () => ref.read(weatherControllerProvider.notifier).addFavorite(state.current!.city),
                ),
              ],
            ),
            if (state.loading) const LinearProgressIndicator(),
            if (state.error != null) Text(state.error!, style: const TextStyle(color: Colors.red)),
            if (state.current != null) WeatherCard(weather: state.current!),
            if (state.forecast != null) ForecastChart(forecast: state.forecast!),
          ],
        ),
      ),
    );
  }
}
