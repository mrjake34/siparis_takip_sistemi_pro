// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CourierList {
  List<Courier>? courier;
  CourierList({this.courier});
  CourierList.fromJson(Map<String, dynamic> json) {
    if (json["couriers"] != null) {
      courier = <Courier>[];
      json["couriers"].forEach((v) {
        courier!.add(Courier.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> courier = <String, dynamic>{};
    if (this.courier != null) {
      courier['couriers'] = this.courier!.map((e) => e.toJson()).toList();
    }
    return courier;
  }
}

class Courier {
  final String? name;
  final String? email;
  final String? phone;
  final String? id;
  final String? password;
  final String? role;

  Courier({this.password, this.role, this.id, this.name,
      this.phone, this.email});

  Courier.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['_id'],
        email = json['email'],
        role = json['role'],
        password = json['password'],
        phone = json['phone'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['_id'] = id;
    data['phone'] = phone;
    return data;
  }

  @override
  bool operator ==(covariant Courier other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.id == id &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        id.hashCode ^
        password.hashCode ^
    role.hashCode;
  }
}

class CourierAddOrder with ChangeNotifier {
  Courier? courier;

  Courier get searchValue {
    return courier!;
  }

  set searchValue(Courier value) {
    courier = value;
    notifyListeners();
  }
}

class CourierSearch with ChangeNotifier {
  String searchTerm = "";

  String get searchValue {
    return searchTerm;
  }

  set searchValue(String value) {
    searchTerm = value;
    notifyListeners();
  }
}
