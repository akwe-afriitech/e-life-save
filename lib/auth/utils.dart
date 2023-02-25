import 'package:flutter/material.dart';



class Utils{

  static showSnackBar(String? text){
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.red,);
    final messengerKey =GlobalKey<ScaffoldMessengerState>().currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}