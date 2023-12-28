abstract class IDataModel<T> {
  int? statusCode;
  T? data;
  String? message;

  IDataModel<T> fromJson(Map<String, dynamic> json);

  Map<String, dynamic>? toJson();
}
