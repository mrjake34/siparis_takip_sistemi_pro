import 'package:dio/dio.dart';
import '../../constants/network/url.dart';

class NetworkService {
  factory NetworkService() {
    _instance ??= NetworkService._init();
    return _instance!;
  }
  NetworkService._init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppNetwork.instance.baseUrl,
      ),
    );
  }
  static NetworkService? _instance;
  late Dio _dio;

  // final headers = {
  //   'Access-Control-Allow-Origin': '*',
  //   'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept, Credentials, Authorization',
  //   'Access-Control-Allow-Credentials': 'true',
  // };

  Dio get dio => _dio;
}
