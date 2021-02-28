


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/productList/view/myBottomNavigationBar.dart';

class Login extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          appBar: AppBar(title: Text("Food Maniac"),),

          body: ListView(children: <Widget>[
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'E-Mail'
                )
            ),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password'
                )
            ),
            RaisedButton(
              onPressed: () {
                login();
              },
              child: Text(
                  'Logar',
                  style: TextStyle(fontSize: 20)
              ),
            )
          ],padding: EdgeInsets.fromLTRB(16, 0, 16, 0),),
        ));
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
    );
  }

}
