import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/errors/app_exceptions.dart';

class WeatherService {
  final Dio _dio = DioClient.dio;

  Future<Map<String, dynamic>> currentByCity(String city) async {
    try {
      final res = await _dio.get('/weather', queryParameters: {'q': city});
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw AppException(e.message ?? 'Network error', code: e.response?.statusCode);
    }
  }

  Future<Map<String, dynamic>> forecastByCity(String city) async {
    try {
      final res = await _dio.get('/forecast', queryParameters: {'q': city});
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw AppException(e.message ?? 'Network error', code: e.response?.statusCode);
    }
  }

  Future<Map<String, dynamic>> currentByCoords(double lat, double lon) async {
    try {
      final res = await _dio.get('/weather', queryParameters: {'lat': lat, 'lon': lon});
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw AppException(e.message ?? 'Network error', code: e.response?.statusCode);
    }
  }
}
