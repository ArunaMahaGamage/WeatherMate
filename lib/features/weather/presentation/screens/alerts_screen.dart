import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});
  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  bool extremeHeat = false;
  bool heavyRain = false;
  bool highWind = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Alerts & Filters')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(title: const Text('Extreme heat alerts'), value: extremeHeat, onChanged: (v) => setState(() => extremeHeat = v)),
            SwitchListTile(title: const Text('Heavy rain alerts'), value: heavyRain, onChanged: (v) => setState(() => heavyRain = v)),
            SwitchListTile(title: const Text('High wind alerts'), value: highWind, onChanged: (v) => setState(() => highWind = v)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text('Save preferences')),
            const SizedBox(height: 8),
            const Text('Note: You can extend this to real notifications or filtered city lists.'),
          ],
        ),
      ),
    );
  }
}
