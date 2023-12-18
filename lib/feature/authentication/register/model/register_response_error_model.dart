

class RegisterResponseErrorModel {

  RegisterResponseErrorModel({this.message});

 RegisterResponseErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
  }
  String? message;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
