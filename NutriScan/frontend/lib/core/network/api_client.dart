// API client implementation
// Cliente HTTP configurado (Dio)
import 'package:dio/dio.dart';
import 'package:nutriscan_app/core/config/config.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl)) {
    // Adicionar interceptadores, se necessário
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Dio get dio => _dio;
}