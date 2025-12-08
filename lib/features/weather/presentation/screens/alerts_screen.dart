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
          title: const Text('Alerts')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Hour Rainfall Map'),
            const SizedBox(height: 16),
            Image.network(
              'https://meteo.gov.lk/images/SLMap.jpg?v=1765213460',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },
            ),
            //SwitchListTile(title: const Text('Extreme heat alerts'), value: extremeHeat, onChanged: (v) => setState(() => extremeHeat = v)),
            //SwitchListTile(title: const Text('Heavy rain alerts'), value: heavyRain, onChanged: (v) => setState(() => heavyRain = v)),
            //SwitchListTile(title: const Text('High wind alerts'), value: highWind, onChanged: (v) => setState(() => highWind = v)),
            const SizedBox(height: 16),
            //ElevatedButton(onPressed: () {}, child: const Text('Save preferences')),
            //const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
