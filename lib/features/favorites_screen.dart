import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/viewmodel/weather_controller.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherControllerProvider);
    final notifier = ref.read(weatherControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Favorites')),
      body: ListView.builder(
        itemCount: state.favorites.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(state.favorites[i]),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(icon: const Icon(Icons.play_arrow), onPressed: () => {notifier.loadCity(state.favorites[i]),context.go('/')}),
            IconButton(icon: const Icon(Icons.delete), onPressed: () => notifier.removeFavoriteAt(i)),
          ]),
        ),
      ),
    );
  }
}
