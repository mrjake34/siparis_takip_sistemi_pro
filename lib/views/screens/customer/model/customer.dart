import 'dart:convert';


CustomerList customerListFromJson(String str) => CustomerList.fromJson(json.decode(str));

String customerListToJson(CustomerList data) => json.encode(data.toJson());

class CustomerList {
  CustomerList({
    required this.message,
    required this.customers,
  });

  String message;
  List<Customer> customers;

  factory CustomerList.fromJson(Map<String, dynamic> json) => CustomerList(
    message: json["message"],
    customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
  };
}

class Customer {
  Customer({
    this.id,
    this.shopName,
    this.name,
    this.phone,
    this.address,
    this.longitude,
    this.latitude,
    this.orders,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? shopName;
  String? name;
  String? phone;
  String? address;
  double? longitude;
  double? latitude;
  List<dynamic>? orders;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["_id"],
    shopName: json["shopName"],
    name: json["name"],
    phone: json["phone"],
    address: json["adress"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    orders: List<dynamic>.from(json["orders"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "shopName": shopName,
    "name": name,
    "phone": phone,
    "adress": address,
    "longitude": longitude,
    "latitude": latitude,
    "orders": List<dynamic>.from(orders!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}


