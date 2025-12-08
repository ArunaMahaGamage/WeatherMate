import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/weather_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // expects OWM_API_KEY
  await Hive.initFlutter();
  await Hive.openBox<String>('favorites'); // city names
  runApp(const ProviderScope(child: WeatherApp()));
}
