import 'package:flutter/material.dart';

class AddComponent extends StatelessWidget {
  AddComponent({this.value, this.minusPressed, this.plusPressed});

  int value;
  VoidCallback minusPressed;
  VoidCallback plusPressed;

  TextEditingController valueTextController;
  TextField valueText;

  @override
  Widget build(BuildContext context) {
    valueTextController = TextEditingController(text: value.toString());
    valueText = TextField(controller: valueTextController,keyboardType: TextInputType.number,);
    return Row(children: <Widget>[
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerLeft,
          width: 40,
          child: RawMaterialButton(
            onPressed: plusPressed,
            child: new Icon(
              Icons.add,
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
            onPressed: minusPressed,
            child: new Icon(
              Icons.minimize,
              color: Colors.white,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue,
          ))
    ]);
  }
}
