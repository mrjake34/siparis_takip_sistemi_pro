class RegisterSuccessfulModel {
  String? message;

  RegisterSuccessfulModel({this.message});

  RegisterSuccessfulModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    return data;
  }
}
