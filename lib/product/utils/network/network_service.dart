import 'dart:io';
import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:vexana/vexana.dart';
import '../../core/base/interface/base_network_model.dart';
import '../../core/constants/network/url.dart';

/// This class is used to make network requests.
final class NetworkService {
  NetworkService._init();

  /// This map is used to set the headers.
  final headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers':
        'Origin, Content-Type, Accept, Credentials, Authorization',
    'Access-Control-Allow-Credentials': 'true',
  };

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

  /// This method is used to make a Get request.
  Future<BaseResponseModel<T>> get<T extends IBaseNetworkModel<T>>(
    String path, {
    Options? options,
    T? model,
  }) async {
    Response<dynamic>? response;
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
    final parseModel = _parseModel<T>(
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
  Future<BaseResponseModel<T>> put<T extends IBaseNetworkModel<T>>(
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
    final parseModel = _parseModel<T>(
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
  Future<BaseResponseModel<T>> delete<T extends IBaseNetworkModel<T>>(
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
    final parseModel = _parseModel<T>(
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
    final parseModel = _parseModel<T>(
      model: model,
      resp: response.data,
    );
    if (parseModel == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.failedLoadData,
        statusCode: response.statusCode,
      );
    }
    return BaseResponseModel<T>(
      data: parseModel,
      statusCode: response.statusCode,
      message: response.statusMessage,
      headers: response.headers.map,
    );
  }

  T? _parseModel<T extends IBaseNetworkModel<T>>({
    T? model,
    dynamic resp,
  }) {
    if (model == null || resp == null) {
      return null;
    }
    if (resp is Map<String, dynamic>) {
      return model.fromJson(resp);
    } else if (resp is List) {
      return resp
          .map(
            (responseData) => model.fromJson(
              responseData is Map<String, dynamic> ? responseData : {},
            ),
          )
          .cast<T>()
          .toList() as T;
    } else {
      return model.toString() as T;
    }
  }
}
