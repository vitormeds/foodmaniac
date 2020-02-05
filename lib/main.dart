import 'package:flutter/material.dart';
import 'package:foodmaniac/addProductWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Maniac",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddProductWidget(),
    );
  }
}