import 'package:dio/dio.dart';
import '../../constants/network/url.dart';

class NetworkService {
  static NetworkService? _instance;
  late Dio _dio;
  factory NetworkService() {
    _instance ??= NetworkService._init();
    return _instance!;
  }
  NetworkService._init() {
    _dio = Dio(BaseOptions(baseUrl: AppNetwork.instance.baseUrl));
  }

  Dio get dio => _dio;
}
