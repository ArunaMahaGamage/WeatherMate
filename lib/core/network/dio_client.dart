import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  DioClient._();
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 12),
      queryParameters: {'appid': dotenv.env['OWM_API_KEY'], 'units': 'metric'},
    ),
  );
}
