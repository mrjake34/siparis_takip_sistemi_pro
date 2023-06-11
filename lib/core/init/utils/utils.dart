import 'package:flutter/material.dart';

class UtilsService {
UtilsService._init();
static final UtilsService _instance = UtilsService._init();
static UtilsService get instance => _instance;


GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();
  void showSnackBar(String? text){
    if(text == null) return;

    final snackBar = SnackBar(content: Text(text));

      messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
  void errorSnackBar(String? text){
    if(text == null) return;

    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(text, style: const TextStyle(color: Colors.white),),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}