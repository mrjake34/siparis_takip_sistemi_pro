class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? shopName;

  RegisterRequestModel(
      {this.name, this.email, this.password, this.phone, this.shopName});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    shopName = json['shopName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['shopName'] = shopName;
    return data;
  }
}
