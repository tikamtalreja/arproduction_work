import 'package:flutter/material.dart';
import 'screen/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primaryColor: Colors.black
    ),
  ));
}
