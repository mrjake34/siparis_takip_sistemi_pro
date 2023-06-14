class RegisterRequestModel {
  RegisterRequestModel({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.shopName,
  });

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    email = json['email'].toString();
    password = json['password'].toString();
    phone = json['phone'].toString();
    shopName = json['shopName'].toString();
  }
  String? name;
  String? email;
  String? password;
  String? phone;
  String? shopName;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['shopName'] = shopName;
    return data;
  }
}
