// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';

class AddOrderAddCustomerSearchProvider with ChangeNotifier {
  String _searchTerm = '';

  String get getSearchValue => _searchTerm;

  set setSearchValue(String value) {
    _searchTerm = value;
    notifyListeners();
  }
}

class AddOrderAddProductSearchProvider with ChangeNotifier {
  String _searchTerm = '';

  String get getSearchValue => _searchTerm;

  set setSearchValue(String value) {
    _searchTerm = value;
    notifyListeners();
  }
}

class AllOrdersListOrderSearchProvider with ChangeNotifier {
  String _searchTerm = '';

  String get getSearchValue => _searchTerm;

  set setSearchValue(String value) {
    _searchTerm = value;
    notifyListeners();
  }
}
