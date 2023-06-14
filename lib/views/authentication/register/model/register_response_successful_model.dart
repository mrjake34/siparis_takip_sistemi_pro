class RegisterSuccessfulModel {

  RegisterSuccessfulModel({this.message});

  RegisterSuccessfulModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'].toString();
  }
  String? message;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Message'] = message;
    return data;
  }
}
