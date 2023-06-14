// ignore_for_file: public_member_api_docs, sort_constructors_first,
// avoid_equals_and_hash_code_on_mutable_classes

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CourierList {
  List<Courier>? courier;
  CourierList({this.courier});
  CourierList.fromJson(Map<String, dynamic> json) {
    if (json['couriers'] != null) {
      courier = <Courier>[];
      json['couriers'].forEach((Map<String, String> v) {
        courier!.add(Courier.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final courier = <String, dynamic>{};
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

  Courier({
    this.password,
    this.role,
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  Courier.fromJson(Map<String, String> json)
      : name = json['name'],
        id = json['_id'],
        email = json['email'],
        role = json['role'],
        password = json['password'],
        phone = json['phone'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['_id'] = id;
    data['phone'] = phone;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'id': id,
      'password': password,
      'role': role,
    };
  }

  factory Courier.fromMap(Map<String, dynamic> map) {
    return Courier(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
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
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
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
    return courier ?? Courier();
  }

  set searchValue(Courier value) {
    courier = value;
    notifyListeners();
  }
}

class CourierSearch with ChangeNotifier {
  String searchTerm = '';

  String get searchValue {
    return searchTerm;
  }

  set searchValue(String value) {
    searchTerm = value;
    notifyListeners();
  }
}
