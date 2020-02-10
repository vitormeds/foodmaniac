

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmaniac/productList/model/product.dart';

class AddComponent extends StatefulWidget {
  @override
  _AddComponentWidgetState createState() => _AddComponentWidgetState();

  AddComponent({this.character, this.minusPressed, this.plusPressed});

  int value = 0;
  Function(Result character, int qtd)  minusPressed;
  Function(Result character, int qtd)  plusPressed;
  Result character;
}

class _AddComponentWidgetState extends State<AddComponent> {
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

  _AddComponentWidgetState({this.character, this.minusPressed, this.plusPressed});

  Function(Result character, int qtd)  minusPressed;
  Function(Result character, int qtd)  plusPressed;
  Result character;

  TextEditingController valueTextController;
  TextField valueText;

  @override
  Widget build(BuildContext context) {
    valueTextController = TextEditingController(text: "0");
    valueText = TextField(controller: valueTextController,keyboardType: TextInputType.number,);
    return Row(children: <Widget>[
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerLeft,
          width: 40,
          child: RawMaterialButton(
            onPressed: actionMinusPressed,
            child: new Icon(
              Icons.minimize,
              color: Colors.white,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue,
          )),
      Container(
        alignment: Alignment.center,
        width: 20,
        child: valueText,
      ),
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerRight,
          width: 40,
          child: RawMaterialButton(
            onPressed: actionPlusPressed,
            child: new Icon(
              Icons.add,
              color: Colors.white,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue,
          ))
    ]);
  }

  void actionMinusPressed() {
    setState(() {
      if(int.parse(valueText.controller.text) > 0) {
        int value = int.parse(valueText.controller.text) - 1;
        valueText.controller.text = value.toString();
        minusPressed(character, value);
      }
    });
  }

  void actionPlusPressed() {
    setState(() {
      int value = int.parse(valueText.controller.text) + 1;
      valueText.controller.text = value.toString();
      plusPressed(character, value);
    });
  }
}
