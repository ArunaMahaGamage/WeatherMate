import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/weather_controller.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherControllerProvider);
    final notifier = ref.read(weatherControllerProvider.notifier);
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'City'), controller: controller),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () => notifier.loadCity(controller.text), child: const Text('Search')),
            const SizedBox(height: 12),
            if (state.current != null) Text('Found: ${state.current!.city} • ${state.current!.temp.toStringAsFixed(1)}°C'),
          ],
        ),
      ),
    );
  }
}
