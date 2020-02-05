import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

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
    return Scaffold(
      appBar: AppBar(title: Text("Rick And Morty"),),

      body: ListView(children: <Widget>[
        TextField(
          controller: nameController,
        ),
        TextField(
          controller: valueController,
        ),
        TextField(
          controller: descriptionController,
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
    );
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
