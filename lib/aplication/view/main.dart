

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/vitu1/Documents/GitHub/foodmaniac/lib/login/view/login.dart';
import 'file:///C:/Users/vitu1/Documents/GitHub/foodmaniac/lib/aplication/view/myBottomNavigationBar.dart';
import 'package:foodmaniac/utils/constants.dart';

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
        primarySwatch: primaryColor,
      ),
      home: getHomeScreen(),
    );
  }
}