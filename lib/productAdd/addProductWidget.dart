
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductWidget extends StatefulWidget {
  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {

  final nameController = TextEditingController();
  final valueController = TextEditingController();
  final descriptionController = TextEditingController();

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
          controller: nameController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Nome'
            )
        ),
        TextField(
          controller: valueController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Valor'
            )
        ),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Descrição'
            )
        ),
        RaisedButton(
          onPressed: () {
                _showDialog();
          },
          child: Text(
            'Salvar',
            style: TextStyle(fontSize: 20)
          ),
        )
      ],padding: EdgeInsets.fromLTRB(16, 0, 16, 0),),
    ));
  }

   void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert Dialog title"),
          content:  Container(child: ListView(children: <Widget>[
            Text("Name: " + nameController.text),
            Text("Value: " + valueController.text),
            Text("Description: " + descriptionController.text),
          ])),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
           FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
}
