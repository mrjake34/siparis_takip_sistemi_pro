import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/app/app_constants.dart';

class NetworkService {
  static NetworkService? _instance;
  late Dio _dio;
  factory NetworkService() {
    _instance ??= NetworkService._init();
    return _instance!;
  }
  NetworkService._init() {
    _dio = Dio(BaseOptions(baseUrl: AppConstats.baseUrl));
  }

  Dio get dio => _dio;
}
