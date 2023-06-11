class LoginResponseModel {
  String? message;
  UserModel? user;

  LoginResponseModel({this.message, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? id;
  String? shopName;
  String? role;

  UserModel({this.id, this.shopName, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    shopName = json['shopName'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['shopName'] = shopName;
    data['role'] = role;
    return data;
  }
}
