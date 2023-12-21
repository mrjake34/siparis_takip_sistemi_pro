import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/interface_base_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:vexana/vexana.dart';
import '../../core/base/interface/base_network_model.dart';
import '../../core/constants/network/url.dart';

/// This class is used to make network requests.
final class NetworkService {
  NetworkService._init();

  /// This method is used to initialize the Dio package.
  void start() {
    _networkManager = NetworkManager<EmptyModel>(
      options: BaseOptions(
        baseUrl: AppNetwork.baseUrl,
        headers: headers,
      ),
    );
    _dio = Dio(
      BaseOptions(
        baseUrl: AppNetwork.baseUrl,
        headers: headers,
      ),
    );
  }

  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;

  late NetworkManager _networkManager;
  late Dio _dio;

  /// This map is used to set the headers.
  final headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers':
        'Origin, Content-Type, Accept, Credentials, Authorization',
    'Access-Control-Allow-Credentials': 'true',
  };

  /// This method is used to make a Get request.
  Future<BaseResponseModel<T>> get<T extends IBaseNetworkModel<T>>(
    String path, {
    Options? options,
  }) async {
    final response = await _networkManager.get<dynamic>(path);
    return BaseResponseModel(
      data: response.data as T?,
      statusCode: response.statusCode,
    );
  }

  /// This method is used to make a Post request.
  Future<BaseResponseModel<T>> post<T extends IBaseNetworkModel<T>>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T? model,
  }) async {
    final response = await _networkManager.post<dynamic>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    final parseModel = _parseModel<T, T>(
      model: model,
      resp: response.data,
    );
    return BaseResponseModel<T>(
      data: parseModel,
      headers: response.headers.map,
      statusCode: response.statusCode,
    );
  }

  /// This method is used to make a Put request.
  Future<BaseResponseModel<T>> put<E, T extends IBaseNetworkModel<T>>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final reponse = await _networkManager.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return BaseResponseModel<T>(
      data: reponse.data,
      statusCode: reponse.statusCode,
    );
  }

  /// This method is used to make a Delete request.
  Future<BaseResponseModel<T>> delete<E, T extends IBaseNetworkModel<T>>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _networkManager.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return BaseResponseModel<T>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  R? _parseModel<R, T extends IBaseNetworkModel<T>>({
    T? model,
    dynamic resp,
  }) {
    if (model == null || resp == null) {
      return null;
    }
    if (resp is Map<String, dynamic>) {
      return model.fromJson(resp) as R;
    } else if (resp is List) {
      return resp
          .map(
            (responseData) => model.fromJson(
              responseData is Map<String, dynamic> ? responseData : {},
            ),
          )
          .cast<T>()
          .toList() as R;
    } else {
      return model.toString() as R;
    }
  }
}
