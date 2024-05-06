import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:vexana/vexana.dart';
import '../../core/base/interface/base_network_model.dart';
import '../../core/constants/network/url.dart';

/// This class is used to make network requests.
final class NetworkService {
  NetworkService._init();

  /// This map is used to set the headers.
  static final _headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers':
        'Origin, Content-Type, Accept, Credentials, Authorization',
    'Access-Control-Allow-Credentials': 'true',
  };

  /// This method is used to initialize the Dio package.
  static void start() {
    _networkManager = NetworkManager<EmptyModel>(
      options: BaseOptions(
        baseUrl: AppNetwork.baseUrl,
        headers: _headers,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status != null,
      ),
    );
  }

  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;

  static late NetworkManager _networkManager;

  /// This method is used to make a Post request.
  Future<BaseResponseModel<T>> request<T extends IBaseNetworkModel<T>>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    MethodType? method,
    T? model,
  }) async {
    options?.method = MethodType.getMethodType(method);

    final response = await _networkManager.request<dynamic>(
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

enum MethodType {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const MethodType(this.value);
  final String value;

  static String getMethodType(MethodType? method) => switch (method) {
        MethodType.get => MethodType.get.value,
        MethodType.put => MethodType.put.value,
        MethodType.delete => MethodType.delete.value,
        _ => MethodType.post.value
      };
}
