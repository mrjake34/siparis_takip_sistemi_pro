import 'package:dio/dio.dart';
import '../../core/constants/network/url.dart';

class NetworkService {
  NetworkService._init();
  void start() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppNetwork.instance.baseUrl,
      ),
    );
  }

  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;

  late Dio _dio;

  // final headers = {
  //   'Access-Control-Allow-Origin': '*',
  //   'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept, Credentials, Authorization',
  //   'Access-Control-Allow-Credentials': 'true',
  // };

  Dio get dio => _dio;

  Future<Response<T>> delete<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    _dio.delete<T>(
      path!,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
