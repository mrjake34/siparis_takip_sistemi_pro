import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/interface_base_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
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
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status != null,
      ),
    );
  }

  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;

  late NetworkManager _networkManager;

  /// This map is used to set the headers.
  final headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers':
        'Origin, Content-Type, Accept, Credentials, Authorization',
    'Access-Control-Allow-Credentials': 'true',
  };

  /// This method is used to make a Get request.
  Future<BaseResponseModel<R>> get<R, T extends IBaseNetworkModel<T>>(
    String path, {
    Options? options,
    T? model,
  }) async {
    Response<dynamic> response;
    response = await _networkManager.get<dynamic>(
      path,
      options: options,
    );
    if (response.data == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.failedLoadData,
        statusCode: response.statusCode,
      );
    }
    final parseModel = _parseModel<R, T>(
      model: model,
      resp: response.data,
    );
    if (parseModel == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.failedLoadData,
        statusCode: response.statusCode,
      );
    }
    return BaseResponseModel(
      data: parseModel,
      statusCode: response.statusCode,
      message: response.statusMessage,
      headers: response.headers.map,
    );
  }

  /// This method is used to make a Put request.
  Future<BaseResponseModel<R>> put<R, T extends IBaseNetworkModel<T>>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T? model,
  }) async {
    final response = await _networkManager.put<dynamic>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    if (response.data == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.failedLoadData,
        statusCode: response.statusCode,
      );
    }
    final parseModel = _parseModel<R, T>(
      model: model,
      resp: response.data,
    );
    return BaseResponseModel(
      data: parseModel,
      statusCode: response.statusCode,
      message: response.statusMessage,
      headers: response.headers.map,
    );
  }

  /// This method is used to make a Delete request.
  Future<BaseResponseModel<R>> delete<R, T extends IBaseNetworkModel<T>>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T? model,
  }) async {
    final response = await _networkManager.delete<dynamic>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    if (response.data == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.failedLoadData,
        statusCode: response.statusCode,
      );
    }
    final parseModel = _parseModel<R, T>(
      model: model,
      resp: response.data,
    );
    return BaseResponseModel(
      data: parseModel,
      statusCode: response.statusCode,
      message: response.statusMessage,
      headers: response.headers.map,
    );
  }

  /// This method is used to make a Post request.
  Future<BaseResponseModel<R>> post<R, T extends IBaseNetworkModel<T>>(
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
    final parseModel = _parseModel<R, T>(
      model: model,
      resp: response.data,
    );
    if (parseModel == null) {
      return BaseResponseModel<R>(
        networkStatus: NetworkStatus.failedLoadData,
        statusCode: response.statusCode,
      );
    }
    return BaseResponseModel(
      data: parseModel,
      statusCode: response.statusCode,
      message: response.statusMessage,
      headers: response.headers.map,
    );
  }

  R? _parseModel<R, T extends IBaseNetworkModel<dynamic>>({
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
