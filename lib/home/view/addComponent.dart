import 'package:flutter/material.dart';

class AddComponent extends StatelessWidget {
  AddComponent({this.value, this.minusPressed, this.plusPressed});

  int value;
  VoidCallback minusPressed;
  VoidCallback plusPressed;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerLeft,
          width: 40,
          child: RawMaterialButton(
            onPressed: () {},
            child: new Icon(
              Icons.add,
              color: Colors.blue,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
          )),
      Container(
        alignment: Alignment.center,
        width: 20,
        child: Text(value.toString()),
      ),
      Container(
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          alignment: Alignment.centerRight,
          width: 40,
          child: RawMaterialButton(
            onPressed: () {},
            child: new Icon(
              Icons.minimize,
              color: Colors.blue,
              size: 10.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
          ))
    ]);
  }
}
