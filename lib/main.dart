

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/productList/view/listProducts.dart';
import 'package:foodmaniac/productList/view/login.dart';
import 'package:foodmaniac/productList/view/myBottomNavigationBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget getHomeScreen() {
    if(1==2) {
      return MyBottomNavigationBar();
    }
    return Login();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Maniac",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getHomeScreen(),
    );
  }
}